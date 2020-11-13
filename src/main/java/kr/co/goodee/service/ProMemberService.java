package kr.co.goodee.service;

import java.util.HashMap;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import kr.co.goodee.dao.ProMemberDAO;

@Service
public class ProMemberService {
	
	@Autowired ProMemberDAO dao;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public int join(HashMap<String, String> map) {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String pw = encoder.encode(map.get("pw"));
		map.replace("pw", pw);
		return dao.join(map);
	}

	public String login(String id) {
		return dao.login(id);
	}

	public int overlay(String id) {
		return dao.overlay(id);
	}

	public int withDraw(String id) {
		return dao.withDraw(id);
	}

}
