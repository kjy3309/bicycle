package kr.co.goodee.service;

import java.util.ArrayList;
		
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.goodee.dao.ProBoardDAO;
import kr.co.goodee.dto.ProBoardDTO;
import kr.co.goodee.dto.ProMemberDTO;

@Service
public class ProBoardService {
	
	@Autowired ProBoardDAO dao;

	public ArrayList<ProBoardDTO> list() {
		return dao.list();
	}
	
	public ArrayList<ProMemberDTO> profile(String id) {
		System.out.println(id + "++++++++++++++++++++++++++++++++++++++++++++++");
		return dao.profile(id);
	}

	public int write(HashMap<String, String> map) {
		return dao.write(map);
	}

	public ArrayList<ProBoardDTO> detail(String name) {
		return dao.detail(name);
	}
	
	public ArrayList<ProMemberDTO> updetail(String name) {
		return dao.updetail(name);
	}

	public int del(String idx) {
		return dao.del(idx);
	}

	public void update(HashMap<String, String> map) {
		dao.update(map);
	}

	public ProBoardDTO detailView(String idx) {
		return dao.detailView(idx);
	}

	public ArrayList<ProBoardDTO> ans(String name) {
		return dao.ans(name);
	}

	public int Adwrite(HashMap<String, String> map) {
		return dao.Adwrite(map);
	}


}
