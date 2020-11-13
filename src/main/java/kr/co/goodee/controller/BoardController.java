package kr.co.goodee.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.ProcessBuilder.Redirect;
import java.util.HashMap;
import java.util.Locale;

import javax.servlet.http.HttpServletResponse;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sun.mail.iap.Response;

import kr.co.goodee.service.Auth;
import kr.co.goodee.service.BoardService;

@Controller
public class BoardController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired BoardService service;
	
	
	//리스트
	@RequestMapping(value = "/boardList", method = RequestMethod.GET)
	public String boardList(Model model, @RequestParam int category, @RequestParam String page,HttpSession session) {
		int pages = 0;
		// 페이지를 보내줬음
		if(page == null) {
			pages = 1;
		}
		String pageParam = page; // pageParam 으로 받음
        
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
		logger.info("세션가져와졌나요???"+session);
		model.addAttribute("category", category);
		model.addAttribute("currPage", pages);
		model.addAttribute("endPage", totPage);
		model.addAttribute("boardList", service.boardList(category,pages));
		int pack = service.packCount(category,pages);
		model.addAttribute("count",pack);
		String Session = (String) session.getAttribute("loginId");
		model.addAttribute("session",Session);
		return "boardList";
	}
	
	//글쓰기 페이지 이동
	@Auth
	@RequestMapping(value = "/boardWriteForm", method = RequestMethod.GET)
	public String FreeBoardwriteForm(Model model, HttpSession Session, @RequestParam int category,HttpServletResponse response) {
		// 파일 업로드 때문에 session을 가져가야한다
		//FreeBoardfileList 를 Session에 담아준다.
		HashMap<String, String> boardFileList = new HashMap<String, String>();
		Session.setAttribute("FreeBoardfileList", boardFileList);
		//Session.setAttribute("userId", );
		String loginId = (String) Session.getAttribute("loginId");
		model.addAttribute("loginId", loginId);
		//model.addAttribute("category", category);
		/*
		 * String page = "fds"; if(loginId==null) {
		 * response.setContentType("text/html; charset=UTF-8"); PrintWriter out; try {
		 * out = response.getWriter();
		 * out.println("<script>alert('로그인이 필요한 서비스입니다.'); location.href='"+page+
		 * "';</script>"); out.flush(); } catch (IOException e) { e.printStackTrace(); }
		 * 
		 * }
		 */
		return "boardWriteForm";
	}
	
	
	//파일 업로드 폼
	@RequestMapping(value = "/fileUploadForm", method = RequestMethod.GET)
	public String fileUploadForm(Model model) {

		return "fileUploadForm";
	}
	
	//파일 업로드
	@RequestMapping(value = "/fileUpload", method = RequestMethod.POST)
	public ModelAndView Fileupload(MultipartFile file , HttpSession Session) {

		logger.info("파일 업로드 요청");
		
		return service.fileUpload(file,Session);
	}
	
	//파일 삭제
	@RequestMapping(value = "/boardFileDelete", method = RequestMethod.GET)
	public @ResponseBody HashMap<String,Object> FreeBoardfileDelete(String fileName , HttpSession Session) {

		logger.info("무엇을 삭제할까요? : "+fileName);
		
		return service.fileDelete(fileName, Session);
	}
	
	//글쓰기
	@RequestMapping(value = "/freeBoardWrite", method = RequestMethod.POST)
	public ModelAndView freeBoardWrite(@RequestParam HashMap<String, String> params, HttpSession Session) {

		logger.info("글쓰기 요청");
		logger.info("params : "+params); //글쓰기 폼으로에서 haspmap 씀
		String session = (String) Session.getAttribute("loginId");//세션가져와서
		if(session.equals("admin")) {
			
			params.put("category", "0");
			
		}else {
			
			params.put("category", "1");
		}
		
		return service.freeBoardWrite(params,Session); //service에 그대로 전달
	}
	
	// 여기 코드 수정 충돌 방지 위해 value 값 임의로 바꿈 나중에 다시 수정  boardDetail로
	@RequestMapping(value = "/0123", method = RequestMethod.GET)
	public ModelAndView boardDetail(@RequestParam String idx) {
		
		logger.info("상세보기 요청"+idx);
		
		return service.boardDetail(idx);
	}
	
	@RequestMapping(value = "/boardDelete", method = RequestMethod.GET)
	public String boardDelete(@RequestParam String idx,@RequestParam int category,RedirectAttributes redirect,@RequestParam String page) {
		
		logger.info("삭제 요청 : "+idx);
		String pages ="redirect:/boardDetail";
		int success = service.boardDelete(idx,category);
		if(success>0) {
			redirect.addAttribute("category",category);
			redirect.addAttribute("page",page);
			pages="redirect:/boardList";
		}
		return pages;
	}
	
	@RequestMapping(value = "/boardUpdateForm", method = RequestMethod.GET)
	public ModelAndView boardUpdateForm(@RequestParam String idx, HttpSession Session,@RequestParam int category,@RequestParam String page) {
		logger.info("수정 할 idx : "+idx);
		HashMap<String, String> fileList = new HashMap<String,String>();
		HashMap<String, String> delFileList = new HashMap<String,String>();
		Session.setAttribute("fileList", fileList);
		Session.setAttribute("delFileList", delFileList);
		logger.info("쓰고싶다 제발"+category+"page??"+page);
		return service.boardUpdateForm(idx,Session,category,page);
	}
	
	@RequestMapping(value = "/boardUpdateFileDelete", method = RequestMethod.GET)
	 public @ResponseBody HashMap<String, Object> boardUpdateFileDelete(@RequestParam String fileName , HttpSession session) {
	      logger.info("업데이트 파일삭제  요청"+fileName);   
	      return service.boardUpdateFileDelete(fileName,session);
	}
	
	@RequestMapping(value = "/boardUpdate", method = RequestMethod.POST)
	 public ModelAndView boardUpdate(@RequestParam HashMap<String, String> params, HttpSession Session) {
	      logger.info("수정 글 번호는? "+params.get("b_idx"));
	      logger.info("params : "+params);
	    
	      return service.boardUpdate(params,Session);
	}
	
	
	
	
}
