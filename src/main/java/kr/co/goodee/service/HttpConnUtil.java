package kr.co.goodee.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

import kr.co.goodee.dao.BicycleRealTimeDAO;

@Service
public class HttpConnUtil {
	
	private class Key {
		int parkingBikeTotCnt;
		String stationName;
	}
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired BicycleRealTimeDAO dao;
	
	/**
	 * @param urls:ArrayList<String>
	 * @param header:HashMap<String,String>
	 * @param params 
	 * @param method:String
	 * @return 
	 * @return result:String
	 */
	
	public HashMap<String, Object> findRTBS(int id) {
		String method = "GET";
		ArrayList<String> urls = new ArrayList<String>();
		urls.add("http://openapi.seoul.go.kr:8088/765663435864686433384657724e46/json/bikeList/1/999/");
		
		StringBuffer sb = new StringBuffer();//url 사용 버퍼
		String readLine = "";//읽어들일 문자 변수
		BufferedReader reader = null;//버퍼리더
		String result = "";
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		
		for(String url : urls) {	sb.append(url);}//url 조합
				
		try {
			URL url = new URL(sb.toString());					
			HttpURLConnection con = (HttpURLConnection)url.openConnection();			
			/*			
			con.setConnectTimeout(2000);
			con.setReadTimeout(5000);
			*/
			method = method.toUpperCase(); // method 가 소문자로 들어왔을 수 있으니 대문자로 변경.....			
			con.setRequestMethod(method);//method 적용   
			con.setDoOutput(true); // 쓰기모드 지정? POST 방식은 스트림 기반의 데이터 전송 방식이기 때문에 setDoOutput(true)를 실행하여 URLConnection의 출력 스트림을 사용하도록 지정해야 한다.
				        		
			sb = null; // sb에 들어있던 url 값이 초기화?? null 값으로 재선언
			sb = new StringBuffer(); // 이번엔 아래에서 메시지를 받기위해서 새로운 버퍼 다시 생성?                   
			
			if(con.getResponseCode()==200) { // 요청이 성공적으로 되었는가?
				reader = new BufferedReader(new InputStreamReader(con.getInputStream()));
				//메시지를 전송 받는다.			
				while ((readLine = reader.readLine()) != null) {sb.append(readLine);}			
				result = sb.toString();
				
				//Gson pretty = new GsonBuilder().setPrettyPrinting().create(); 콘솔 로그 확인용
		         
		        JsonElement jsonElement = JsonParser.parseString(result);
		        //String element = pretty.toJson(jsonElement); 콘솔 로그 확인용
		        jsonElement =  jsonElement.getAsJsonObject().get("rentBikeStatus").getAsJsonObject().get("row");
		         
		        Gson gson = new Gson();
		        Key[] key = gson.fromJson(jsonElement, Key[].class);
		        boolean findId = false;
		        
		        for(Key k : key) {
		        	int rentIdx =  Integer.parseInt(k.stationName.substring(0,k.stationName.indexOf(".")));
		        	if(id == rentIdx) {
		        		map.put("parkingBikeTotCnt", k.parkingBikeTotCnt);
		        		map.put("br_name", dao.findBrName(id));
		        		findId = true;
		        	} 
		        }
		        
		        if(!findId) {
		        	map = findRTBS2(id);
		        }
		        
				
			} else { // 요청이 잘못 되면 에러 메시지를 받아줌
				reader = new BufferedReader(new InputStreamReader(con.getErrorStream()));
				if(con.getResponseCode()!=200) {
					System.out.println("fail message : "+result);
					result = "failCode : "+con.getResponseCode();
				}		
			}			
			
							
		} catch (Exception e) {
			e.printStackTrace();
			result = "{\"success\":\"false\",\"message\":\"read time out\"}";
		}finally {
			try {
				if(reader != null) { reader.close();}	
				
				} catch (IOException e) {
					e.printStackTrace();
				}
			//System.out.println("result : "+result);
			return map;
		}
		
	}
	
	public HashMap<String, Object> findRTBS2(int id) {
		String method = "GET";
		ArrayList<String> urls = new ArrayList<String>();
		urls.add("http://openapi.seoul.go.kr:8088/765663435864686433384657724e46/json/bikeList/1000/1999/");
		
		StringBuffer sb = new StringBuffer();//url 사용 버퍼
		String readLine = "";//읽어들일 문자 변수
		BufferedReader reader = null;//버퍼리더
		String result = "";	
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		for(String url : urls) {	sb.append(url);}//url 조합
				
		try {
			
			URL url = new URL(sb.toString());					
			HttpURLConnection con = (HttpURLConnection)url.openConnection();		

			method = method.toUpperCase(); // method 가 소문자로 들어왔을 수 있으니 대문자로 변경.....			
			con.setRequestMethod(method);//method 적용   
			con.setDoOutput(true); // 쓰기모드 지정? POST 방식은 스트림 기반의 데이터 전송 방식이기 때문에 setDoOutput(true)를 실행하여 URLConnection의 출력 스트림을 사용하도록 지정해야 한다.
			
			sb = null; // sb에 들어있던 url 값이 초기화?? null 값으로 재선언
			sb = new StringBuffer(); // 이번엔 아래에서 메시지를 받기위해서 새로운 버퍼 다시 생성?
			
			if(con.getResponseCode()==200) { // 요청이 성공적으로 되었는가?
				reader = new BufferedReader(new InputStreamReader(con.getInputStream()));
				//메시지를 전송 받는다.			
				while ((readLine = reader.readLine()) != null) {sb.append(readLine);}			
				result = sb.toString();
				
				//Gson pretty = new GsonBuilder().setPrettyPrinting().create(); 콘솔 로그 확인용
		         
		        JsonElement jsonElement = JsonParser.parseString(result);
		        //String element = pretty.toJson(jsonElement); 콘솔 로그 확인용
		        jsonElement =  jsonElement.getAsJsonObject().get("rentBikeStatus").getAsJsonObject().get("row");
		         
		        Gson gson = new Gson();
		        Key[] key = gson.fromJson(jsonElement, Key[].class);
				boolean findId = false;
		        
		        for(Key k : key) {
		        	int rentIdx =  Integer.parseInt(k.stationName.substring(0,k.stationName.indexOf(".")));
		        	if(id == rentIdx) {
		        		map.put("parkingBikeTotCnt", k.parkingBikeTotCnt);
		        		map.put("br_name", dao.findBrName(id));
		        		findId = true;
		        	} 
		        }
		        
		        if(!findId) {
		        	map = findRTBS3(id);
		        }
				
			} else { // 요청이 잘못 되면 에러 메시지를 받아줌
				reader = new BufferedReader(new InputStreamReader(con.getErrorStream()));
				if(con.getResponseCode()!=200) {
					System.out.println("fail message : "+result);
					result = "failCode : "+con.getResponseCode();
				}		
			}			
							
		} catch (Exception e) {
			e.printStackTrace();
			result = "{\"success\":\"false\",\"message\":\"read time out\"}";
		}finally {
			try {
				if(reader != null) { reader.close();}	
				
				} catch (IOException e) {
					e.printStackTrace();
				}
			return map;
		}
		
		
				
		}
	
	public HashMap<String, Object> findRTBS3(int id) {
		String method = "GET";
		ArrayList<String> urls = new ArrayList<String>();
		urls.add("http://openapi.seoul.go.kr:8088/765663435864686433384657724e46/json/bikeList/2000/2050/");
		
		StringBuffer sb = new StringBuffer();//url 사용 버퍼
		String readLine = "";//읽어들일 문자 변수
		BufferedReader reader = null;//버퍼리더
		String result = "";	
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		for(String url : urls) {	sb.append(url);}//url 조합
				
		try {
			
			URL url = new URL(sb.toString());					
			HttpURLConnection con = (HttpURLConnection)url.openConnection();		

			method = method.toUpperCase(); // method 가 소문자로 들어왔을 수 있으니 대문자로 변경.....			
			con.setRequestMethod(method);//method 적용   
			con.setDoOutput(true); // 쓰기모드 지정? POST 방식은 스트림 기반의 데이터 전송 방식이기 때문에 setDoOutput(true)를 실행하여 URLConnection의 출력 스트림을 사용하도록 지정해야 한다.
			
			sb = null; // sb에 들어있던 url 값이 초기화?? null 값으로 재선언
			sb = new StringBuffer(); // 이번엔 아래에서 메시지를 받기위해서 새로운 버퍼 다시 생성?
			
			if(con.getResponseCode()==200) { // 요청이 성공적으로 되었는가?
				reader = new BufferedReader(new InputStreamReader(con.getInputStream()));
				//메시지를 전송 받는다.			
				while ((readLine = reader.readLine()) != null) {sb.append(readLine);}			
				result = sb.toString();
				
				//Gson pretty = new GsonBuilder().setPrettyPrinting().create(); 콘솔 로그 확인용
		         
		        JsonElement jsonElement = JsonParser.parseString(result);
		        //String element = pretty.toJson(jsonElement); 콘솔 로그 확인용
		        jsonElement =  jsonElement.getAsJsonObject().get("rentBikeStatus").getAsJsonObject().get("row");
		         
		        Gson gson = new Gson();
		        Key[] key = gson.fromJson(jsonElement, Key[].class);
		        
		        for(Key k : key) {
		        	int rentIdx =  Integer.parseInt(k.stationName.substring(0,k.stationName.indexOf(".")));
		        	if(id == rentIdx) {
		        		map.put("parkingBikeTotCnt", k.parkingBikeTotCnt);
		        		map.put("br_name", dao.findBrName(id));
		        	} 
		        }
				
			} else { // 요청이 잘못 되면 에러 메시지를 받아줌
				reader = new BufferedReader(new InputStreamReader(con.getErrorStream()));
				if(con.getResponseCode()!=200) {
					System.out.println("fail message : "+result);
					result = "failCode : "+con.getResponseCode();
				}		
			}			
							
		} catch (Exception e) {
			e.printStackTrace();
			result = "{\"success\":\"false\",\"message\":\"read time out\"}";
		}finally {
			try {
				if(reader != null) { reader.close();}	
				
				} catch (IOException e) {
					e.printStackTrace();
				}
			return map;
		}
		
		
				
		}

}