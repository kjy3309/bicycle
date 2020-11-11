package kr.co.goodee.dao;

import java.util.ArrayList;

import kr.co.goodee.dto.FileDTO;
import kr.co.goodee.dto.FreeBoardDTO;
import kr.co.goodee.dto.NoticeBoardDTO;

public interface NoticeBoardDAO {

	ArrayList<NoticeBoardDTO> NoticeBoardlist();

	int NoticeBoardwrite(NoticeBoardDTO been);
	
	void NoticeBoardwriteFile(int b_idx, String string, String key);

	NoticeBoardDTO NoticeBoarddetail(String idx);
	
	ArrayList<FileDTO> NoticeBoardfileList(String idx);

	int NoticeBoarddelete(String idx);

	void NoticeBoardbHit(String idx);

	int NoticeBoardupdate(NoticeBoardDTO been);

	void NoticeBoarddeleteFile(int b_idx, String delKey);
}
