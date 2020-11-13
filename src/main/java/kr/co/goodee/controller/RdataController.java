package kr.co.goodee.controller;

import java.util.HashMap;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import kr.co.goodee.service.RdataService;

@Controller
public class RdataController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired RdataService service;
	
	@RequestMapping(value = "/rdata", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> rdata(Model model, @RequestParam HashMap<String, String> params) throws Exception {
		
		logger.info("params : " + params);
		HashMap<String, Object> map = new HashMap<String, Object>();
		boolean success =false;
		if(params.size() >=3) {
			service.rdata(params);
			map.put("fileName", "real_remain.html");
		}
		
		return map;
	}
	
	
	@RequestMapping(value = "/rGraph", method = RequestMethod.GET)
	public String rGraph(Model model, @RequestParam String hour, @RequestParam String br_idx) throws Exception {
		
		logger.info("br_idx : " + br_idx);
		logger.info("hour : " + hour);
		
		service.rGraph(br_idx,hour);
		
		return null;
	}
	
	
	
}
