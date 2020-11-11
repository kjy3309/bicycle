package kr.co.goodee.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;

import kr.co.goodee.dao.replyDAO;
import kr.co.goodee.dto.FileDTO;
import kr.co.goodee.dto.FreeBoardDTO;
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

	
	//댓글 수정 내용불러오기
	public String replyUpdateForm(HashMap<String, Object>param) {
		
		return dao.replyUpdateForm(param);
		
	}
	
	/*
	 * //댓글 수정 public String replyUpdate(String upComment,String r_idx) {
	 * 
	 * return dao.replyUpdate(upComment,r_idx);
	 * 
	 * }
	 */
	
	


	public ArrayList<replDTO> replyList(HashMap<String, Object>b_idx) {//b_idx값 넣어줘야됨
		//ArrayList<replDTO> dto = dao.replyList(b_idx);
		
		return null;
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
		
		ArrayList<replDTO> dto2 = dao.replyList(idx); 
		logger.info("댓글리스트 불러오기 : " + idx);
		// view 에 뿌리는 값
		mav.addObject("info", dto);
		mav.addObject("repl_list", dto2);
		
		// view 이름
		mav.setViewName("FreeBoarddetail");
		
		return mav;
	}

	//댓글 수정 완료
	public boolean replyUpdateSuccess(HashMap<String, Object> param) {
		boolean result = dao.replyUpdateSuccess(param);
		return result;
	}

	//댓글 삭제
		public boolean comDelete(HashMap<String, Object> param) {

			return dao.comDelete(param);
			
		}



	
	
	
	
	
}
