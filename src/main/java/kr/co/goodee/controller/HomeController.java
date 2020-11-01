package kr.co.goodee.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		
		return "home";
	}
	
	@RequestMapping(value = "/relocation", method = RequestMethod.GET)
	public String relocation(Model model) {
		
		return "relocation";
	}
	
	@RequestMapping(value = "/rts", method = RequestMethod.GET)

	public String rts(Model model) {
				
		return "rts";
	}
	
}
