package kr.co.goodee.controller;

import java.io.FileInputStream;
	
import java.io.FileNotFoundException;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map.Entry;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.goodee.dao.ProBoardDAO;
import kr.co.goodee.dto.ProMemberDTO;
import kr.co.goodee.service.ProBoardService;
import kr.co.goodee.service.ProMemberService;

@Controller
public class ProHomeController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired ProMemberService service;
	@Autowired ProBoardService bService;
	@Autowired ProBoardDAO dao;
	
	
//	@RequestMapping(value = "/", method = RequestMethod.GET)
//	public String home() {
//		return "index";
//	}
	
	@RequestMapping(value = "/withDraw", method = RequestMethod.GET)
	public String withDraw(Model model, HttpSession session) {
		String id = (String) session.getAttribute("loginId");
		if(service.withDraw(id) > 0) {
			model.addAttribute("msg", "회원 탈퇴가 정상적으로 처리되었어요");
		}
		return "index";
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.removeAttribute("loginId");
		return "home";
	}
	
	@RequestMapping(value = "/joinForm", method = RequestMethod.GET)
	public String joinForm() {
		return "joinForm";
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(Model model, @RequestParam HashMap<String, String> map ) {
		
		int success = service.join(map);
		String page = "joinForm";
		
		if(success > 0) {
			model.addAttribute("msg","회원 가입에 성공했습니다.");
			page = "index";
		} else {
			model.addAttribute("msg","회원 가입에 실패했습니다.");
		}
		
		return page;
	}
	
	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public String profile(Model model, HttpSession session, @RequestParam String id) {
		
		String page = "profile";
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String encryptPw = service.login(id);
		if(id.equals("admin")) {
			session.setAttribute("loginId", id);
			page = "Adprofile";
			model.addAttribute("list", bService.profile(id));
		} else if(encryptPw.equals(id)) {
			session.setAttribute("loginId", id);
			page = "profile";
			model.addAttribute("list", bService.profile(id));
		} else {
			model.addAttribute("msg", "ID 또는 비밀번호를 확인해주세요.");
		}
		
		return page;
	}
	
//	@RequestMapping(value = "/login", method = RequestMethod.POST)
//	public String login(Model model, HttpSession session, @RequestParam String id, String pw) {
//		
//		String page = "index";
//		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
//		String encryptPw = service.login(id);
//		
//		if(encoder.matches(pw, encryptPw)) {
//			if(id.equals("administor")) {
//				session.setAttribute("loginId", id);
//				page = "Adprofile";
//				model.addAttribute("list", bService.profile(id));
//			} else {
//				session.setAttribute("loginId", id);
//				page = "profile";
//				System.out.println(id + "--------------------------------------------------------------");
//				model.addAttribute("list", bService.profile(id));
//			}
//		} else {
//			model.addAttribute("msg", "ID 또는 비밀번호를 확인해주세요.");
//		}
//		
//		return page;
//	}
	// 스케쥴러는 한번 시작하면 서비스를 내릴 때 까지 멈출수가 없다.
	// 0에서 시작해서 5씩 증가
	//@Scheduled(cron = "0/5 * * * * MON-FRI")
	// XML 방식과 annotation 방식은 혼용 할 수 없다.
	
//	@RequestMapping(value = "/xlsx", method = RequestMethod.GET)
//	public void xlsx() throws Exception {
//		FileInputStream file = new FileInputStream("C:/placedata.xlsx");
//		XSSFWorkbook workbook = new XSSFWorkbook(file);
//		
//		int rowIndex = 0; 
//		int columnIndex = 0;
//		
//		//시트 수 (첫번째에만 존재하므로 0을 준다)
//        //만약 각 시트를 읽기위해서는 FOR문을 한번더 돌려준다
//		XSSFSheet sheet = workbook.getSheetAt(0);
//		
//		//행의 수
//        int rows = sheet.getPhysicalNumberOfRows();
//        
//        for(rowIndex=1; rowIndex<rows; rowIndex++) {
//        	// 행을 읽는다....
//        	XSSFRow row = sheet.getRow(rowIndex);
//        	
//			
//        	if(row != null) {
//        		int cells = row.getPhysicalNumberOfCells();
//        		int br_idx = 0 ;
//    			String br_name = null;
//    			double letitude = 0;
//    			double longitude = 0;
//    			
//        		for(columnIndex=0; columnIndex<=cells; columnIndex++) {
//        			XSSFCell cell = row.getCell(columnIndex);
//        			String value = "";
//        			
//        			// 셀이 빈값일 경우를 위한 널값 체크
//        			if(cell==null) {
//        				continue;
//        			}else {
//        				//타입별로 내용 읽기
//        				switch (cell.getCellType()){
//                        case XSSFCell.CELL_TYPE_FORMULA:
//                            value=cell.getCellFormula();
//                            break;
//                        case XSSFCell.CELL_TYPE_NUMERIC:
//                            value=cell.getNumericCellValue()+"";
//                            break;
//                        case XSSFCell.CELL_TYPE_STRING:
//                            value=cell.getStringCellValue()+"";
//                            break;
//                        case XSSFCell.CELL_TYPE_BLANK:
//                            value=cell.getBooleanCellValue()+"";
//                            break;
//                        case XSSFCell.CELL_TYPE_ERROR:
//                            value=cell.getErrorCellValue()+"";
//                            break;
//                        }
//        			}
//        			
//        			switch (columnIndex) {
//					case 0:
//						String temp = value.substring(0,value.lastIndexOf("."));
//						br_idx = Integer.parseInt(temp);
//						break;
//
//					case 1:
//						br_name = value;
//						break;
//						
//					case 2:
//						letitude = Double.parseDouble(value);
//						break;
//					
//					case 3:
//						longitude = Double.parseDouble(value);
//						break;
//					}
//        		}
//        		dao.info(br_idx, br_name, letitude, longitude);
//        		
//        		br_idx = 0;
//    			br_name = "";
//    			letitude = 0;
//    			longitude = 0;
//    			System.out.println("반복문 끝");
//        	}
//        	
//        }
//	}
	
	
}
