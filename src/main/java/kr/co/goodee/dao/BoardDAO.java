package kr.co.goodee.dao;

import java.util.ArrayList;

import kr.co.goodee.dto.FileDTO;
import kr.co.goodee.dto.BoardDTO;

public interface BoardDAO {


	ArrayList<BoardDTO> boardList(int category, int start, int end);
	
	int FreeBoardwrite(BoardDTO been);

	void FreeBoardwriteFile(int b_idx, String string, String key);

	BoardDTO FreeBoarddetail(String idx);

	ArrayList<FileDTO> FreeBoardfileList(String idx);

	int FreeBoarddelete(String idx);

	void FreeBoardbHit(String idx);

	int FreeBoardupdate(BoardDTO been);

	void FreeBoarddeleteFile(int b_idx, String delKey);

	int pcfbList();

	

	
}
