package kr.co.goodee.dao;

import java.util.ArrayList;
import java.util.HashMap;

import kr.co.goodee.dto.RdataDTO;

public interface RdataDAO {

	ArrayList<RdataDTO> rdata(HashMap<String, String> params);
	

}
