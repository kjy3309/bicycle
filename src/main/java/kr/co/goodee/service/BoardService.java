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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.goodee.dao.BoardDAO;
import kr.co.goodee.dto.FileDTO;
import kr.co.goodee.dto.BoardDTO;

@Service
public class BoardService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired BoardDAO dao;
	
	@Value("#{config['Globals.root']}") String root;
	
	private String fullpath = null; 
	

	public ArrayList<BoardDTO> boardList(int category, int pages) {
		
		logger.info("자유게시판 리스트 서비스");
		int pagePerCnt = 17; // 페이지 당 보여줄 게시물 수
		int end = pages * pagePerCnt;
		int start = (end-pagePerCnt)+1;
		
		return dao.boardList(category,start,end);

		
	}
	
	public ModelAndView fileUpload(MultipartFile file, HttpSession Session) {
		
		ModelAndView mav = new ModelAndView();
		
		//경로 설정
		fullpath = root+"upload/";
		
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
			Session.setAttribute("fileList", fileList);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		mav.addObject("path", "photo/"+Newfilename);
		mav.setViewName("fileUploadForm");
		
		return mav;
	}

	public HashMap<String,Object> fileDelete(String fileName, HttpSession Session) {
		HashMap<String,Object> result = new HashMap<String,Object>();
		int success = 0;
		
		//1. Session 에서 fileList 가져오기
		HashMap<String,String> fileList = (HashMap<String, String>) Session.getAttribute("fileList");
		
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
	public ModelAndView freeBoardWrite(HashMap<String, String> params, HttpSession Session,RedirectAttributes redirect) {
		ModelAndView mav = new ModelAndView();
		String page = "redirect:/boardList";
		logger.info("왜 안되냐구 카테고리!"+params);
		BoardDTO been = new BoardDTO(); // 빈 사용 필수
		been.setSubject(params.get("subject"));
		been.setContent(params.get("content"));
		//String session = (String) Session.getAttribute("loginId");
		been.setId((String) Session.getAttribute("loginId"));
		been.setCategory(Integer.parseInt(params.get("category")));
		HashMap<String, Object> fileList = (HashMap<String, Object>) Session.getAttribute("fileList");
		if(dao.freeBoardWrite(been) == 1) { // 글 등록 성공
			//page = "redirect:/boardDetail?b_idx="+been.getB_idx();
			redirect.addAttribute("category",params.get("category"));
			redirect.addAttribute("page", 1);
			page = "redirect:/boardList";
			//  page = "redirect:/boardList?category=1&&page=1";
			int size = fileList.size();
			logger.info("저장할 파일 수  : "+size);
			int b_idx = been.getB_idx();
			if(size>0) { //업로드 한 파일이 있다면
				logger.info(b_idx+"번 게시물에 소속된 파일 등록");
				for(String key : fileList.keySet()) {
					dao.boardWriteFile(been.getId(),b_idx,(String)fileList.get(key),key);
				}
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
	public ModelAndView boardDetail(String idx) {
		ModelAndView mav = new ModelAndView();
		
		dao.boardbHit(idx);
		
		BoardDTO dto = dao.boardDetail(idx);
		//파일을 만들때 하나 더 추가
		ArrayList<FileDTO> fileList = dao.boardFileList(idx);
		// 파일 크기 확인
		logger.info("첨부된 파일 : "+fileList.size());
		
		mav.addObject("fileList",fileList);
		// view 에 뿌리는 값
		mav.addObject("info", dto);
		// view 이름
		mav.setViewName("boardDetail");
		
		return mav;
	}

	public int boardDelete(String idx,int category) {
		logger.info("서비스 왔나?"+ idx);
		int success = dao.boardDelete(idx,category);
		logger.info("success : " + success);
		return success;
	}

	public ModelAndView boardUpdateForm(String idx, HttpSession session,int category,String page) {
		ModelAndView mav = new ModelAndView();
		BoardDTO dto = dao.boardDetail(idx);
		mav.addObject("info",dto);
		mav.addObject("category",category);
		mav.addObject("page",page);
				
		mav.setViewName("boardUpdateForm");
		return mav;
	}

	public HashMap<String, Object> boardUpdateFileDelete(String fileName, HttpSession session) {
		HashMap<String, Object> result = new HashMap<String, Object>();
		int success = 0;
		
		//1. Session 에서 delFileList 가져오기
		HashMap<String, String> delFileList = (HashMap<String, String>) session.getAttribute("delFileList");
		
		//2. 실제 파일 삭제하기
		String delFileName = root+"FreeBoard/"+fileName;
		logger.info("지울 파일 경로는 ? : "+delFileName);
		File file = new File(delFileName);
		if(file.exists()) { // 파일이 존재 할 경우
			logger.info("존재하니?");
			if(file.delete()) { // 삭제 처리 후 성공하면
				success = 1;
				logger.info("엥?");
			}else {
				logger.info("이미 삭제된 상황");
				success = 1;
			}			
		}
		
		//3. fileList 에서 삭제한 파일명 넣기
		delFileList.put(fileName, fileName);
		logger.info(delFileList.get(fileName));
		logger.info("업로드 한 파일 개수 : "+delFileList.size());
		
		//4. session에 fileList 넣기
		session.setAttribute("delFileList", delFileList);
		
		result.put("success", success);
		logger.info("WLR?");
		return result;
	}
 
	@Transactional
	public ModelAndView boardUpdate(HashMap<String, String> params, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		/*
		 * redirect.addAttribute("category",category);
		 * redirect.addAttribute("page",page);
		 */
				
		String page = "boardUpdateForm";
		BoardDTO been = new BoardDTO(); // 빈 사용 필수
		been.setSubject(params.get("subject"));
		been.setContent(params.get("content"));
		been.setId(params.get("id"));
		been.setB_idx(Integer.parseInt(params.get("b_idx")));
		HashMap<String, Object> fileList = (HashMap<String, Object>) session.getAttribute("fileList");
	    HashMap<String, Object> delFileList = (HashMap<String, Object>) session.getAttribute("delFileList");
	    
	    if(dao.boardUpdate(been)==1) {
	    	int size = 0;
	    	if(fileList != null) {
		    	size = fileList.size();
	    	}
	    	int delSize = 0;
	    	 if(delFileList != null) {
	 	    	delSize = delFileList.size();
	 	    }
	    	int b_idx = been.getB_idx();
	    	logger.info("게시글 번호 : "+b_idx);
	    	if(size>0) {
	    		logger.info(b_idx+" 번 게시물");
	    		for(String key : fileList.keySet()) {
	    			dao.boardWriteFile(been.getId(), b_idx, (String) fileList.get(key),key);
	    		}
	    	}
	    	if(delSize>0) {
	    		for(String delKey : delFileList.keySet()) {
	    			dao.boardDeleteFile(b_idx,delKey);
	    			logger.info("성공 : "+delKey);
	    		}
	    	}
	    	page = "redirect:/boardList?category=1&&page=1";
	    	}else {
		    	for(String fileName : fileList.keySet()) {
		    		File file = new File(root+"FreeBoard/"+fileName);
		    		boolean success = file.delete();
		    		logger.info(fileName+"삭제 결과"+success);
	    	}
	    }
	    session.removeAttribute("fileList");
	    
	    mav.setViewName(page);
	    logger.info(page);
	    return mav;
	}

	public int pcfbList() {
		return dao.pcfbList();
	}
	//게시글 수 세기
	public int packCount(int category, int pages) {
		
		
		return dao.packCount(category);
	}









}
