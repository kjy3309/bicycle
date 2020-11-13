package kr.co.goodee.dao;

import java.util.ArrayList;	
import java.util.HashMap;

import kr.co.goodee.dto.ProBoardDTO;
import kr.co.goodee.dto.ProMemberDTO;

public interface ProBoardDAO {

	ArrayList<ProBoardDTO> list();
	
	ArrayList<ProMemberDTO> profile(String id);

	int write(HashMap<String, String> map);

	ArrayList<ProBoardDTO> detail(String name);
	
	ArrayList<ProMemberDTO> updetail(String name);

	int del(String idx);

	void update(HashMap<String, String> map);

	void info(int br_idx, String br_name, double letitude, double longitude);

	ProBoardDTO detailView(String idx);

	ArrayList<ProBoardDTO> ans(String name);

	int Adwrite(HashMap<String, String> map);

}
