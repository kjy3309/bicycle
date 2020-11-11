package kr.co.goodee.service;

import java.util.HashMap;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.co.goodee.dao.MemberDAO;

@Service
public class MemberService {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired MemberDAO dao;

	public HashMap<String, Object> idCheck(String id) {
		
		int result = dao.idCheck(id);
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		if(result != 0) { // 중복이 된 경우
			map.put("message", "이미 사용중인 아이디입니다.");
			map.put("data", "몰라..");
			map.put("success", false);
		}else {
			map.put("message", "사용 가능한 아이디입니다.");
			map.put("data", "몰라..");
			map.put("success", true);
		}
		return map;
	}

	public HashMap<String, Object> emailCheck(String userEmail, String userEmailHost) {
		String email = userEmail+"@"+userEmailHost;
		HashMap<String, Object> map = new HashMap<String, Object>();
		String dupId = dao.emailCheck(email);
		
		if(dupId == null) {// 중복되지 않음
			map.put("chk", true);
		} else {
			map.put("chk", false);
			map.put("dupId", dupId);
		}
		
		return map;
	}

	public HashMap<String, Object> validateEmail(String email) {
		// 해킹하면 안돼요ㅜ.
		String host = "smtp.gmail.com";
		final String user = "kjy3309@gmail.com";
		final String password = "park3309!";
		
		// smtp 값 설정
		Properties prop = new Properties();
		prop.put("mail.smtp.host", host);
		prop.put("mail.smtp.port", 465);
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.ssl.enable", "true"); 
		prop.put("mail.smtp.ssl.trust", host);
		
		// 난수
		Random r = new Random();
		int dice = r.nextInt(999999) + 100000; 
		if(dice > 1000000) {
			dice -= 100000;
		}
		HashMap<String,Object> map =  new HashMap<String, Object>();
		
		Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});
		
		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(user));
			
			//수신자 메일 주소 파라메터로 가져오자 아작스로?
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
			
			//제목과 내용
			message.setSubject("따릉이를 부탁해 인증번호 전달");
			message.setText("인증번호는 ["+dice+"] 입니다.");
			
			///보내기
			Transport transport = session.getTransport("smtp");
			transport.connect(host, user, password);
			transport.sendMessage(message, message.getAllRecipients());
			
			map.put("dice",dice);
			map.put("sendMail", true);
			
		} catch (MessagingException e) {
			e.printStackTrace();
			map.put("sendMail", false);
			map.put("message", "이메일 전송에 실패했습니다.");
		} 
		
		return map;
	}

	public HashMap<String, Object> regist(HashMap<String, String> userInfo, HttpSession session) {
		
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String encryptPass = encoder.encode((CharSequence) userInfo.get("password"));
		userInfo.replace("password", encryptPass);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		int bdMonth = Integer.parseInt(userInfo.get("bdMonth")) ;
		int bdDate = Integer.parseInt(userInfo.get("bdDate"));
		String month = "";
		String date = "";
		if(bdMonth < 10) {
			month = "0"+userInfo.get("bdMonth");
		} else {
			month = userInfo.get("bdMonth");
		}
		
		if(bdDate < 10) {
			date = "0"+userInfo.get("bdDate");
		} else {
			date = userInfo.get("bdDate");
		}
		
		userInfo.put("birth", userInfo.get("bdYear")+month+date);
		
		int result = dao.regist(userInfo);
		
		if(result>0) { // 성공
			map.put("regist", true);
			session.setAttribute("loginId", userInfo.get("id"));
		} else { // 실패
			map.put("regist", false);
			map.put("message", "회원가입에 실패했습니다. 입력 값을 다시 확인해 주세요.");
		}
		
		return map;
	}

	public HashMap<String, Object> login(String loginId, String loginPw, HttpSession session) {
		
		String pw = dao.login(loginId);
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		
		if(encoder.matches(loginPw, pw)) { // 로그인 성공
			logger.info("로그인 성공한거??");
			session.setAttribute("loginId", loginId);
			map.put("login", true);
		} else {
			logger.info("로그인 실패");
			map.put("login", false);
			map.put("message", "아이디 또는 비밀번호를 다시 확인해 주세요.");
		} 
		
		return map;
	}

}
