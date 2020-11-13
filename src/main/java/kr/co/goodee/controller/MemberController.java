package kr.co.goodee.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.goodee.dto.BicycleRentDTO;
import kr.co.goodee.service.MemberService;

@Controller 
@RequestMapping(value ="/login")
public class MemberController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired MemberService service;
	
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> idCheck(@RequestParam String id) {
		
		return service.idCheck(id);
	}
	
	@RequestMapping(value = "/emailCheck", method = RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> emailCheck(@RequestParam String userEmail, String userEmailHost) {
		
		return service.emailCheck(userEmail, userEmailHost);
	}
	
	@RequestMapping(value = "/validateEmail", method = RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> validateEmail(@RequestParam String userEmail, String userEmailHost, String email) {
		
		return service.validateEmail(email);
	}
	
	@RequestMapping(value = "/regist", method = RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> regist(@RequestParam HashMap<String, String> userInfo, HttpSession session) {
		logger.info(userInfo+"맵");
		return service.regist(userInfo, session);
	}
	
	@RequestMapping(value = "/", method = RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> login(@RequestParam String loginId, String loginPw, HttpSession session) {
		
		return service.login(loginId, loginPw, session);
	}
}
