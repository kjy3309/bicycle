package kr.co.goodee.dao;

import java.util.ArrayList;
import java.util.HashMap;

import kr.co.goodee.dto.FileDTO;
import kr.co.goodee.dto.BoardDTO;

public interface BoardDAO {


	ArrayList<BoardDTO> boardList(int category, int start, int end);
	
	int freeBoardWrite(BoardDTO been);

	void boardWriteFile(String id,int b_idx, String key, String key2);

	BoardDTO boardDetail(String idx);

	ArrayList<FileDTO> boardFileList(String idx);

	int boardDelete(String idx,int category);

	void boardbHit(String idx);

	int boardUpdate(BoardDTO been);

	void boardDeleteFile(int b_idx, String delKey);

	int pcfbList();

	int packCount(int category);

	

	
}
