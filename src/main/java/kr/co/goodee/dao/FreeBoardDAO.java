package kr.co.goodee.dao;

import java.util.ArrayList;

import kr.co.goodee.dto.FileDTO;
import kr.co.goodee.dto.FreeBoardDTO;

public interface FreeBoardDAO {


	ArrayList<FreeBoardDTO> FreeBoardlist(int category, int start, int end);
	
	int FreeBoardwrite(FreeBoardDTO been);

	void FreeBoardwriteFile(int b_idx, String string, String key);

	FreeBoardDTO FreeBoarddetail(String idx);

	ArrayList<FileDTO> FreeBoardfileList(String idx);

	int FreeBoarddelete(String idx);

	void FreeBoardbHit(String idx);

	int FreeBoardupdate(FreeBoardDTO been);

	void FreeBoarddeleteFile(int b_idx, String delKey);

	int pcfbList();

	

	
}
