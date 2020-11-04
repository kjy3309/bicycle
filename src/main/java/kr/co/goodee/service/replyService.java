package kr.co.goodee.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import kr.co.goodee.dao.replyDAO;
import kr.co.goodee.dto.replDTO;


@Service
public class replyService {
	
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired replyDAO dao;
	
	
	public boolean reply(HashMap<String, Object> param) {
		logger.info("서비스 들어옴");
		int count = dao.reply(param);
		logger.info("성공 값 : "+ count);
		boolean success =false;
		if(count>0) {
			success = true;
		}
		return success;
	}

	
	//댓글 수정 폼
	public String replyUpdateForm(String r_idx) {
		
		return dao.replyUpdateForm(r_idx);
		
	}
	
	//댓글 수정
	public String replyUpdate(String upComment,String r_idx) {
		
		return dao.replyUpdate(upComment,r_idx);
		
	}
	
	//댓글 삭제
	public boolean comDelete(String r_idx) {

		return dao.comDelete(r_idx);
		//return이 없어도 되는건가..? 이상하다...
	}


	public ArrayList<replDTO> replyList() {//b_idx값 넣어줘야됨
		ArrayList<replDTO> dto = dao.replyList();
		
		return null;
	}

	



	
	
	
	
	
}
