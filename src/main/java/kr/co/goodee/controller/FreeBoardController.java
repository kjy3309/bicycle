package kr.co.goodee.controller;

import java.util.HashMap;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.co.goodee.service.FreeBoardService;

@Controller
public class FreeBoardController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired FreeBoardService service;
	
	
	//리스트
	@RequestMapping(value = "/FreeBoardlist", method = RequestMethod.GET)
	public String FreeBoardlist(Model model, @RequestParam int category, @RequestParam String page) {
		
		// 페이지를 보내줬음
		String pageParam = page; // pageParam 으로 받음
        int pages =1;
		if(pageParam != null) {
           pages = Integer.parseInt(pageParam);
        }
        logger.info("pages : " +pageParam);
        int totCount = service.pcfbList(); // 전체 게시물 수
        int listCount =17;
        int totPage = totCount/listCount;
        
        if(totCount % listCount > 0 ) {
           totPage ++;
        }
        
        if(totPage ==0) {
           totPage=1;
        }
		
		logger.info("리스트 요청!! 카테고리 : "+category);
		model.addAttribute("currPage", pages);
		model.addAttribute("endPage", totPage);
		model.addAttribute("boardList", service.FreeBoardlist(category,pages));
		
		return "FreeBoardlist";
	}
	
	//글쓰기 페이지 이동
	@RequestMapping(value = "/FreeBoardwriteForm", method = RequestMethod.GET)
	public String FreeBoardwriteForm(Model model, HttpSession Session) {
		// 파일 업로드 때문에 session을 가져가야한다
		
		//FreeBoardfileList 를 Session에 담아준다.
		HashMap<String, String> FreeBoardfileList = new HashMap<String, String>();
		Session.setAttribute("FreeBoardfileList", FreeBoardfileList);
		//model.addAttribute("category", category);
		return "FreeBoardwriteForm";
	}
	
	
	//파일 업로드 폼
	@RequestMapping(value = "/FileuploadForm", method = RequestMethod.GET)
	public String FileuploadForm(Model model) {

		return "FileuploadForm";
	}
	
	//파일 업로드
	@RequestMapping(value = "/Fileupload", method = RequestMethod.POST)
	public ModelAndView Fileupload(MultipartFile file , HttpSession Session) {

		logger.info("파일 업로드 요청");
		
		return service.Fileupload(file,Session);
	}
	
	//파일 삭제
	@RequestMapping(value = "/FreeBoardfileDelete", method = RequestMethod.GET)
	public @ResponseBody HashMap<String,Object> FreeBoardfileDelete(String fileName , HttpSession Session) {

		logger.info("무엇을 삭제할까요? : "+fileName);
		
		return service.FileDelete(fileName, Session);
	}
	
	//글쓰기
	@RequestMapping(value = "/FreeBoardwrite", method = RequestMethod.POST)
	public ModelAndView FreeBoardwrite(@RequestParam HashMap<String, String> params, HttpSession Session) {

		logger.info("글쓰기 요청");
		logger.info("params : "+params); //글쓰기 폼으로에서 haspmap 씀
		String session = (String) Session.getAttribute("userId");//세션가져와서
		if(session.equals("admin")) {
			
			params.put("category", "0");
			
		}else {
			
			params.put("category", "1");
		}
		
		return service.FreeBoardwrite(params,Session); //service에 그대로 전달
	}
	
	// 여기 코드 수정 충돌 방지 위해 value 값 임의로 바꿈 나중에 다시 수정
	@RequestMapping(value = "/0123", method = RequestMethod.GET)
	public ModelAndView FreeBoarddetail(@RequestParam String idx) {
		
		logger.info("상세보기 요청"+idx);
		
		return service.FreeBoarddetail(idx);
	}
	
	@RequestMapping(value = "/FreeBoarddelete", method = RequestMethod.GET)
	public String FreeBoarddelete(@RequestParam String idx) {
		
		logger.info("삭제 요청 : "+idx);
		String page ="redirect:/FreeBoarddetail";
		int success = service.FreeBoarddelete(idx);
		if(success>0) {
			page="redirect:/FreeBoardlist";
		}
		return page;
	}
	
	@RequestMapping(value = "/FreeBoardupdateForm", method = RequestMethod.GET)
	public ModelAndView FreeBoardupdateForm(@RequestParam String idx, HttpSession Session) {
		logger.info("수정 할 idx : "+idx);
		HashMap<String, String> fileList = new HashMap<String,String>();
		HashMap<String, String> delFileList = new HashMap<String,String>();
		Session.setAttribute("fileList", fileList);
		Session.setAttribute("delFileList", delFileList);
		return service.FreeBoardupdateForm(idx,Session);
	}
	
	@RequestMapping(value = "/FreeBoardupdateFileDelete", method = RequestMethod.GET)
	 public @ResponseBody HashMap<String, Object> updateFileDelete(@RequestParam String fileName , HttpSession session) {
	      logger.info("업데이트 파일삭제  요청"+fileName);   
	      return service.FreeBoardupdateFileDelete(fileName,session);
	}
	
	@RequestMapping(value = "/FreeBoardupdate", method = RequestMethod.POST)
	 public ModelAndView FreeBoardupdate(@RequestParam HashMap<String, String> params, HttpSession Session) {
	      logger.info("수정 글 번호는? "+params.get("b_idx"));
	      logger.info("params : "+params);
	      return service.FreeBoardupdate(params,Session);
	}
	
	
	
	
}
