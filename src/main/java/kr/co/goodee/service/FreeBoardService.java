package kr.co.goodee.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.co.goodee.dao.FreeBoardDAO;
import kr.co.goodee.dto.FileDTO;
import kr.co.goodee.dto.FreeBoardDTO;

@Service
public class FreeBoardService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired FreeBoardDAO dao;
	
	@Value("#{config['Globals.root']}") String root;
	
	private String fullpath = null; 
	
	public void FreeBoardlist(Model model) {
		
		logger.info("자유게시판 리스트 서비스");
		
		ArrayList<FreeBoardDTO> FreeBoardlist= dao.FreeBoardlist();
		
		logger.info("파일 크기"+FreeBoardlist.size());
		
		model.addAttribute("FreeBoardlist",FreeBoardlist);
		
	}
	
	public ModelAndView Fileupload(MultipartFile file, HttpSession Session) {
		
		ModelAndView mav = new ModelAndView();
		
		//경로 설정
		fullpath = root+"FreeBoard/";
		
		//파일명을 추출
		String fileName = file.getOriginalFilename();
		
		// 뒤에서 .을 기준으로 자름
		String Newfilename = System.currentTimeMillis()+fileName.substring(fileName.lastIndexOf("."));
		
		//파일명을 바꾸고 저장
		try {
			byte[] bytes = file.getBytes(); // 바이너리 추출하기
			Path path = Paths.get(fullpath+Newfilename); // 경로 지정
			Files.write(path, bytes); // 파일 저장
			
			//업로드 성공한 파일을 Session 에 저장
			HashMap<String, String> fileList = new HashMap<String, String>();
			fileList.put(Newfilename, fileName);
			logger.info("업로드 한 파일의 개수 :"+fileList.size());
			Session.setAttribute("filelist", fileList);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		mav.addObject("path", "photo/"+Newfilename);
		mav.setViewName("FileuploadForm");
		
		return mav;
	}

	public HashMap<String,Object> FileDelete(String fileName, HttpSession Session) {
		HashMap<String,Object> result = new HashMap<String,Object>();
		int success = 0;
		
		//1. Session 에서 fileList 가져오기
		HashMap<String,String> fileList = (HashMap<String, String>) Session.getAttribute("FreeBoardfileList");
		
		//2. 진짜 파일 삭제
		String delFileName = root +"FreeBoard/"+fileName;
		logger.info("경로는?"+delFileName);
		
		File file = new File(delFileName);
		if(file.exists()) { // 파일이 있나?
			if(file.delete()) { // 있으면
				logger.info("있냐?");
				success = 1;
				logger.info("ㅋㅋ"+success);
				logger.info("fileName" + fileName);
				logger.info("파일 이름 : "+fileList.get(fileName));
			}
		}else {
			logger.info("업서용ㅁ");
			success = 1;
		}
		

		//3. fileList 에서 삭제한 파일명 지우기
		if(fileList.get(fileName) != null) {
			fileList.remove(fileName);
			logger.info("삭제 후 남은 파일 개수"+fileList.size());
		}
		// 세션에 저장
		Session.setAttribute("fileList", fileList);
		
		// 성공 여부 변경
		result.put("success", success);
		
		return result;
	}
	@Transactional
	public ModelAndView FreeBoardwrite(HashMap<String, String> params, HttpSession Session) {
		ModelAndView mav = new ModelAndView();
		String page = "redirect:/FreeBoardlist";
		FreeBoardDTO been = new FreeBoardDTO(); // 빈 사용 필수
		been.setSubject(params.get("subject"));
		been.setContent(params.get("content"));
		been.setId(params.get("id"));
		
		HashMap<String, Object> fileList = (HashMap<String, Object>) Session.getAttribute("FreeBoardfileList");
		
		if(dao.FreeBoardwrite(been) == 1) { // 글 등록 성공
			int size = fileList.size();
			logger.info("저장할 파일 수  : "+size);
			int b_idx = been.getB_idx();
			if(size>0) { //업로드 한 파일이 있다면
				logger.info(b_idx+"번 게시물에 소속된 파일 등록");
				for(String key : fileList.keySet()) {
					dao.FreeBoardwriteFile(b_idx,(String)fileList.get(key),key);
				}
				page = "redirect:/FreeBoarddetail?b_idx="+b_idx;
			}
		}else {
			for(String fileName : fileList.keySet()) {
				File file = new File(root+"FreeBoard/"+fileName);
				boolean success = file.delete();
				logger.info(fileName+"삭제 결과는 무엇있까요"+success);
			}
		}
		Session.removeAttribute("fileList");
		mav.setViewName(page);
		
		return mav;
	}
@Transactional(isolation = Isolation.READ_COMMITTED)
	public ModelAndView FreeBoarddetail(String idx) {
		ModelAndView mav = new ModelAndView();
		
		dao.FreeBoardbHit(idx);
		
		FreeBoardDTO dto = dao.FreeBoarddetail(idx);
		//파일을 만들때 하나 더 추가
		ArrayList<FileDTO> fileList = dao.FreeBoardfileList(idx);
		// 파일 크기 확인
		logger.info("첨부된 파일 : "+fileList.size());
		
		mav.addObject("fileList",fileList);
		// view 에 뿌리는 값
		mav.addObject("info", dto);
		// view 이름
		mav.setViewName("FreeBoarddetail");
		
		return mav;
	}

	public void FreeBoarddelete(String idx) {
		int success = dao.FreeBoarddelete(idx);
		
		logger.info("success 값은 ? :"+success);
		
	}




}
