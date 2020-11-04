package kr.co.goodee.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.goodee.dto.replDTO;
import kr.co.goodee.service.replyService;

@Controller
public class replyController {

		@Autowired replyService service;
	
		private Logger logger = LoggerFactory.getLogger(this.getClass());
	
		//댓글작성폼
		@RequestMapping(value = "/replForm", method = RequestMethod.GET)
		public String list(Model model) {
			return "reply";
		}
		
	  //댓글작성
	  @RequestMapping(value = "/reply")
	  public @ResponseBody boolean reply(@RequestParam HashMap<String, Object> param){ 
		  logger.info("댓글 재료 : "+param);
		  ModelAndView mav = new ModelAndView();
		  boolean success = service.reply(param);
		  logger.info("success : " + success);
		  return success;
		  //return map;//보낸view에 그대로 이 값이 들어가는것이다.
	  }
	 
		//수정폼
		@RequestMapping(value = "/replyUpdateForm", method = RequestMethod.GET)
		public String replyUpdateForm(Model model,@RequestParam String r_idx) {
			logger.info("댓글 수정폼 : "+r_idx);
			String comment = service.replyUpdateForm(r_idx);
			model.addAttribute("com",comment);//이게 가져온 원래 댓글내용이니까 이걸 뿌려주는거지 수정폼에
			
			return "home";//수정폼이 되야하고
		}
		
	
		//수정 : 수정버튼을 누르면 replyUpdate컨트롤러를 타고 db에 업데이트 시킨다. 
		 @RequestMapping(value = "/replyUpdate", method = RequestMethod.GET) 
		 public String replyUpdate(Model model,@RequestParam String upComment,@RequestParam String r_idx) {
			 logger.info("댓글 수정 : "+upComment);
			 String newComment = service.replyUpdate(upComment,r_idx);
			 model.addAttribute("com",newComment);//새로운 댓글을 view에 같은 com으로 넣어서 나중에 자연스레 뽑는다.
			 return "home";//detail.jsp겠지
		}
		 
		//삭제
		 @RequestMapping(value = "/replyDelete", method = RequestMethod.GET) 
		 public String replyDelete(Model model, @RequestParam String r_idx) {
			logger.info("삭제 댓글 번호"+r_idx);
			 boolean success = service.comDelete(r_idx);
			 if(success) {
				 String msg ="삭제되었습니다."; 
				 model.addAttribute("msg",msg);
			 }
			 
			 return "home"; //detail.jsp겠지
		}
		 
		 //댓글 리스트 재료 가져오기 dto써서 근데 다 뿌려줄거니까 dto를  arraylist에 담아와야하네
		 @RequestMapping(value = "/replyList", method = RequestMethod.GET) 
		 public ModelAndView prepareList(Model model,@RequestParam HashMap<String, Object> b_idx) {//글의 detail에 idx가 있어야하는데...
			 	//dto만들어서 그안에 댓글 주인 id랑 내용이랑 r_idx값 가져와서..넣어주고 modelandview에 넣기
			 	ArrayList<replDTO> repl_list = new ArrayList<replDTO>();
			 	logger.info("param이 왓니?"+b_idx);
			 	repl_list = service.replyList();
			 	ModelAndView mav = new ModelAndView();
			 	mav.addObject("repl",repl_list);//dto로 이루어진 받아온 댓글들을 넣어준다.
			 	
			 	
			 	
			 return mav; //detail.jsp겠지
		}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
