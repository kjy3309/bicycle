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
import kr.co.goodee.service.NoticeBoardService;

@Controller
public class NoticeBoardController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired NoticeBoardService service;
	
	
	@RequestMapping(value = "/NoticeBoardlist", method = RequestMethod.GET)
	public String NoticeBoardlist(Model model) {
		
		logger.info("리스트 요청!!");
		
		service.NoticeBoardlist(model);
		
		return "NoticeBoardlist";
	}
	
	//글쓰기 페이지 이동
	@RequestMapping(value = "/NoticeBoardwriteForm", method = RequestMethod.GET)
	public String NoticeBoardwriteForm(Model model, HttpSession Session) {
		// 파일 업로드 때문에 session을 가져가야한다
		
		//FreeBoardfileList 를 Session에 담아준다.
		HashMap<String, String> NoticeBoardfileList = new HashMap<String, String>();
		Session.setAttribute("NoticeBoardfileList",NoticeBoardfileList);
		
		return "NoticeBoardwriteForm";
	}
	
	
	//파일 업로드 폼
	@RequestMapping(value = "/NoticeFileuploadForm", method = RequestMethod.GET)
	public String FileuploadForm(Model model) {

		return "NoticeFileuploadForm";
	}
	
	//파일 업로드
	@RequestMapping(value = "/NoticeFileupload", method = RequestMethod.POST)
	public ModelAndView NoticeFileupload(MultipartFile file , HttpSession Session) {

		logger.info("파일 업로드 요청");
		
		return service.NoticeFileupload(file,Session);
	}
	
	//파일 삭제
	@RequestMapping(value = "/NoticeBoardfileDelete", method = RequestMethod.GET)
	public @ResponseBody HashMap<String,Object> NoticeBoardfileDelete(String fileName , HttpSession Session) {

		logger.info("무엇을 삭제할까요? : "+fileName);
		
		return service.NoticeFileDelete(fileName, Session);
	}
	
	//글쓰기
	@RequestMapping(value = "/NoticeBoardwrite", method = RequestMethod.POST)
	public ModelAndView NoticeBoardwrite(@RequestParam HashMap<String, String> params, HttpSession Session) {

		logger.info("글쓰기 요청");
		logger.info("params : "+params); //글쓰기 폼으로에서 haspmap 씀
		
		
		return service.NoticeBoardwrite(params,Session); //service에 그대로 전달
	}
	
	@RequestMapping(value = "/NoticeBoarddetail", method = RequestMethod.GET)
	public ModelAndView NoticeBoarddetail(@RequestParam String idx) {
		
		logger.info("상세보기 요청"+idx);
		
		return service.NoticeBoarddetail(idx);
	}
	
	@RequestMapping(value = "/NoticeBoarddelete", method = RequestMethod.GET)
	public String NoticeBoarddelete(@RequestParam String idx) {
		
		logger.info("삭제 요청 : "+idx);
		String page ="redirect:/NoticeBoarddetail";
		int success = service.NoticeBoarddelete(idx);
		if(success>0) {
			page="redirect:/NoticeBoardlist";
		}
		return page;
	}
	
	@RequestMapping(value = "/NoticeBoardupdateForm", method = RequestMethod.GET)
	public ModelAndView NoticeBoardupdateForm(@RequestParam String idx, HttpSession Session) {
		logger.info("수정 할 idx : "+idx);
		HashMap<String, String> fileList = new HashMap<String,String>();
		HashMap<String, String> delFileList = new HashMap<String,String>();
		Session.setAttribute("fileList", fileList);
		Session.setAttribute("delFileList", delFileList);
		return service.NoticeBoardupdateForm(idx,Session);
	}
	
	@RequestMapping(value = "/NoticeBoardupdateFileDelete", method = RequestMethod.GET)
	 public @ResponseBody HashMap<String, Object> NoticeupdateFileDelete(@RequestParam String fileName , HttpSession session) {
	      logger.info("업데이트 파일삭제  요청"+fileName);   
	      return service.NoticeBoardupdateFileDelete(fileName,session);
	}
	
	@RequestMapping(value = "/NoticeBoardupdate", method = RequestMethod.POST)
	 public ModelAndView NoticeBoardupdate(@RequestParam HashMap<String, String> params, HttpSession Session) {
	      logger.info("수정 글 번호는? "+params.get("b_idx"));
	      logger.info("params : "+params);
	      return service.NoticeBoardupdate(params,Session);
	}
	
	
	
}
