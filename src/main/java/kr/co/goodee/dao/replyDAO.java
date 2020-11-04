package kr.co.goodee.dao;

import java.util.ArrayList;
import java.util.HashMap;

import kr.co.goodee.dto.replDTO;

public interface replyDAO {

	int reply(HashMap<String, Object> param);//댓글작성

	String replyUpdateForm(String r_idx);//댓글수정폼

	String replyUpdate(String upComment,String r_idx);//댓글수정완료

	boolean comDelete(String r_idx);//댓글 삭제

	ArrayList<replDTO> replyList();//댓글 리스트 띄우기하는중에 재료
	
	

}
