package kr.co.goodee.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.co.goodee.dao.BicycleRealTimeDAO;
import kr.co.goodee.dto.BicycleRentDTO;
import kr.co.goodee.service.HttpConnUtil;

@RestController
public class AjaxController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired BicycleRealTimeDAO dao;
	@Autowired HttpConnUtil httpConn;
	
	@RequestMapping(value = "/rts/bicycleRental", method = RequestMethod.GET)
	public ArrayList<BicycleRentDTO> bicycleRental() {
		
		return dao.bicycleRental();
	}
	
	@RequestMapping(value = "/rts/realTimeBicycleStatus", method = RequestMethod.GET)
	public HashMap<String, Object> realTimeBicycleStatus(@RequestParam int id) {
		
		return httpConn.findRTBS(id);
	}
}
