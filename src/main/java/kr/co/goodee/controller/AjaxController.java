package kr.co.goodee.controller;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kr.co.goodee.dao.BicycleRealTimeDAO;
import kr.co.goodee.dto.BicycleRentDTO;

@RestController
public class AjaxController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired BicycleRealTimeDAO dao;
	
	@RequestMapping(value = "/bicycleRental", method = RequestMethod.GET)
	public ArrayList<BicycleRentDTO> bicycleRental(Model model) {
		
		return dao.bicycleRental();
	}
}
