package kr.co.goodee.dao;

import java.util.ArrayList;
import java.util.HashMap;

import kr.co.goodee.dto.FileDTO;
import kr.co.goodee.dto.BoardDTO;
import kr.co.goodee.dto.replDTO;

public interface replyDAO {

	int reply(HashMap<String, Object> param);//댓글작성

	String replyUpdateForm(HashMap<String, Object>param);//댓글내용불러오기

	String replyUpdate(String upComment,String r_idx);//댓글수정완료

	boolean comDelete(HashMap<String, Object> param);//댓글 삭제

	
	
	
	//ArrayList<replDTO> replyList(HashMap<String, Object> b_idx);//댓글 리스트 띄우기하는중에 재료
	
	boolean replyUpdateSuccess(HashMap<String, Object> param);//댓글 수정 완료
	//-------------------------------------------------------------------------
	BoardDTO boardDetail(String idx,int category);

	ArrayList<FileDTO> boardFileList(String idx);

	void boardbHit(String idx);

	ArrayList<replDTO> replyList(String idx);

	
	
	

}
