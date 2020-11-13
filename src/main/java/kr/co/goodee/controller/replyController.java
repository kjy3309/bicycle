package kr.co.goodee.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.xml.bind.ParseConversionEvent;

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
	
		//댓글작성폼 -> 글의 detail
		@RequestMapping(value = "/replForm", method = RequestMethod.GET)
		public String list(Model model) {
			return "FreeBoarddetail";
		}
		
	  //댓글작성
	  @RequestMapping(value = "/reply" ,method = RequestMethod.POST)
	  public @ResponseBody boolean reply(@RequestParam HashMap<String, Object> param){ 
		  logger.info("댓글 재료 : "+param);
		  
		  boolean success = service.reply(param);
		  logger.info("success : " + success);
		  return success;
		  //return map;//보낸view에 그대로 이 값이 들어가는것이다.
	  }
	  
	  	//댓글 리스트 -> dto써서 근데 다 뿌려줄거니까 dto를  arraylist에 담아와야하네
		 @RequestMapping(value = "/replyList", method = RequestMethod.GET) 
		 public @ResponseBody HashMap<String, Object> prepareList(Model model,@RequestParam HashMap<String, Object> b_idx) {//글의 detail에 idx가 있어야하는데...
			 	//dto만들어서 그안에 댓글 주인 id랑 내용이랑 r_idx값 가져와서..넣어주고 modelandview에 넣기
			 	ArrayList<replDTO> repl_list = new ArrayList<replDTO>();
			 	logger.info("param이 왓니?"+b_idx);
			 	repl_list = service.replyList(b_idx);
			 	
			 	HashMap<String, Object> replInge = new HashMap<String, Object>();//아작스는 hashmap을 반환시켜줘야한다.
			 	//model.addAttribute("repl",repl_list);//dto로 이루어진 받아온 댓글들을 넣어준다.
			 	replInge.put("repl",repl_list);
			 	
			 return replInge; //FreeBoarddetail.jsp
		}
	
		 
		 @RequestMapping(value = "/boardDetail", method = RequestMethod.GET)
			public ModelAndView boardDetail(@RequestParam String idx,@RequestParam int category,@RequestParam String page) {

				logger.info("상세보기 요청"+idx+" / "+category+"/"+page);
				return service.boardDetail(idx,category,page);
			}
		 
		//수정내용
			@RequestMapping(value = "/replyUpdateForm", method = RequestMethod.POST)
			public @ResponseBody HashMap<String, Object> replyUpdateForm(Model model,@RequestParam HashMap<String, Object>param) {
				logger.info("댓글 수정폼 : "+param);//OK
				
				String comment = service.replyUpdateForm(param);
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("com",comment);//이게 가져온 원래 댓글내용이니까 이걸 뿌려주는거지 수정폼에
				
				return map;//수정폼이 되야하고
			}
			
		
			//수정 : 수정버튼을 누르면 replyUpdate컨트롤러를 타고 db에 업데이트 시킨다. 
			 @RequestMapping(value = "/replyUpdate", method = RequestMethod.POST) 
			 public @ResponseBody boolean replyUpdate(Model model,@RequestParam HashMap<String, Object> param) {
				 logger.info("댓글 수정완료 재료 : "+param);//OK
				 boolean result = service.replyUpdateSuccess(param);
				  logger.info("댓글수정시 category"+param.get("category"));
			      logger.info("댓글수정시 page"+param.get("page"));
				 return result;
			}
		 
			//삭제
			 @RequestMapping(value = "/replyDelete", method = RequestMethod.GET) 
			 public @ResponseBody boolean replyDelete(Model model, @RequestParam HashMap<String, Object> param) {
				logger.info("삭제 댓글 번호"+param);
				 boolean success = service.comDelete(param);
				 
				 
				 return success; //detail.jsp겠지
			}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
