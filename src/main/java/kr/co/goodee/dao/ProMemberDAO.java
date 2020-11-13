package kr.co.goodee.dao;

import java.util.HashMap;


public interface ProMemberDAO {

	int join(HashMap<String, String> map);

	String login(String id);

	int overlay(String id);

	int withDraw(String id);

	void bike(String name, int idx);

}
