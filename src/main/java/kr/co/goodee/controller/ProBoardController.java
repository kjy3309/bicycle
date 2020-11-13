package kr.co.goodee.controller;

import java.util.ArrayList;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.goodee.dto.ProBoardDTO;
import kr.co.goodee.service.ProBoardService;

@Controller
public class ProBoardController {
	
	@Autowired ProBoardService bService;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping(value = "/QuestList", method = RequestMethod.GET)
	public String list(Model model) {
		model.addAttribute("list", bService.list());
		return "QuestList";
	}
	
	@RequestMapping(value = "/writeForm", method = RequestMethod.GET)
	public String writeForm() {
		return "writeForm";
	}
	
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(Model model, @RequestParam HashMap<String, String> map, @RequestParam String user_name, String pw) {
		String page = "writeForm";
		System.out.println(user_name + "////////////////////////////////");
		if(bService.write(map) > 0){
			page = "profile";
			model.addAttribute("list", bService.profile(user_name));
		} 
		return page;
	}
	
	@RequestMapping(value = "/Adwrite", method = RequestMethod.GET)
	public String Adwrite() {
		return "Adwrite";
	}
	
	@RequestMapping(value = "/Adwrite", method = RequestMethod.POST)
	public String Adwrite(Model model, @RequestParam HashMap<String, String> map, @RequestParam String user_name, String pw) {
		String page = "Adwrite";
		if(bService.Adwrite(map) > 0){
			page = "Adprofile";
			model.addAttribute("list", bService.profile("administor"));
		} 
		return page;
	}
	
	@RequestMapping(value = "/question", method = RequestMethod.GET)
	public String quest(Model model, @RequestParam String name) {
		model.addAttribute("list", bService.detail(name));
		return "question";
	}
	
	@RequestMapping(value = "/answer", method = RequestMethod.GET)
	public String answer(Model model, @RequestParam String name) {
		model.addAttribute("list", bService.ans(name));
		return "answer";
	}
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String detail(Model model, @RequestParam String idx) {
		model.addAttribute("list", bService.detailView(idx));
		return "detail";
	}
	
	@RequestMapping(value = "/del", method = RequestMethod.GET)
	public String del(Model model, @RequestParam String idx) {
		if(bService.del(idx) > 0) {
			model.addAttribute("msg", "글이 삭제되었어요");
			model.addAttribute("list", bService.list());
		}
		return "list";
	}
	
	@RequestMapping(value = "/updateForm", method = RequestMethod.GET)
	public String updateForm(Model model, @RequestParam String name) {
		model.addAttribute("bbs", bService.updetail(name));
		return "updateForm";
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(Model model, @RequestParam HashMap<String, String> map) {
		System.out.println(map.get("user_name"));
		System.out.println(map.get("age"));
		System.out.println(map.get("gender"));
		System.out.println(map.get("email"));
		bService.update(map);
		model.addAttribute("list", bService.profile(map.get("id")));
		return "profile";
	}
}
