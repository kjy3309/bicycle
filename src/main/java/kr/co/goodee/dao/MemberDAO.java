package kr.co.goodee.dao;

import java.util.HashMap;

public interface MemberDAO {

	int idCheck(String id);

	String emailCheck(String email);

	int regist(HashMap<String, String> userInfo);

	String login(String loginId, String loginPw);

}
