package kr.co.goodee.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

import org.rosuda.REngine.REXP;
import org.rosuda.REngine.Rserve.RConnection;
import org.rosuda.REngine.Rserve.RserveException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import kr.co.goodee.dao.RdataDAO;
import kr.co.goodee.dto.RdataDTO;

@Service
public class RdataService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired RdataDAO dao;
	
	public void rdata(HashMap<String, String> params) throws Exception {
		
		//ArrayList<RdataDTO> list = dao.rdata(params);
		//logger.info("크기 : " + list.size());
	
		String hidden = "\'"+params.get("hidden") + "\'";
		String time = "\'"+params.get("time")+ "\'";
		String idx = "\'"+params.get("br_idx")+ "\'";
		
		RConnection conn = new RConnection();
		//REXP exp,exp1;
		
		conn.eval("library('rJava')");
		conn.eval("library('RJDBC')");
		conn.eval("library('dplyr')");
		conn.eval("library(plotly)");
		conn.eval("library(htmlwidgets)");
		
		conn.eval("jdbcDriver <- JDBC(driverClass = 'oracle.jdbc.driver.OracleDriver', classPath = 'ojdbc8.jar')");
		conn.eval("url <-'jdbc:oracle:thin:@gdportal.iptime.org:1521:xe'");
		conn.eval("id <-'C##WEB_USER'");
		conn.eval("pass<-'pass'");
		conn.eval("con <- dbConnect(jdbcDriver,url,id,pass)");
		
		conn.eval("str <- 'SELECT to_char(remain_reg_date,\\'d\\'), ROUND(AVG(remain)) from bicycle_remain where remain_time IN ('");
		conn.assign("x", hidden);
		conn.eval("str2<-x");
		conn.eval("str3<-','");
		conn.assign("y", time);
		conn.eval("str4<-y");
		conn.eval("str5<-')and br_idx='");
		conn.assign("z", idx);
		conn.eval("str6<-z");
		conn.eval("str7<-'group by to_char(remain_reg_date,\\'d\\') order by to_char(remain_reg_date,\\'d\\')'");
		
		conn.eval("real <- paste(str,x,str3,y,str5,z,str7)");
		conn.eval("sql<-real");
		//exp = conn.eval("sql");
		
		conn.eval("sql1 <- 'SELECT to_char(remain_reg_date,\\'d\\'), ROUND(AVG(remain)) from bicycle_remain where remain_time IN (\\'09:29\\',\\'09:30\\') and br_idx=102 group by to_char(remain_reg_date,\\'d\\') order by to_char(remain_reg_date,\\'d\\')'");
		//exp1 = conn.eval("sql1");

		conn.eval("remain <- dbGetQuery(con,sql)");
		conn.eval("names(remain) <- c('num','avg')");
		conn.eval("remain <- cbind(remain,'day'=c('1sun','2mon','3tue','4wed','5thu','6fri','7sat'))");
		
		conn.eval("test<-plot_ly(remain, x=~day, y=~avg)");
		conn.eval("saveWidget(test,'C:/rLink/real_remain.html', selfcontained=FALSE, libdir='lib')");
		
		conn.eval("dbDisconnect(con)");
		
		conn.close();
		
		//System.out.println(exp.asString());
		//System.out.println(exp1.asString());
		
	}

	public void rGraph(String br_idx, String hour) throws Exception {
		
		//String time = "\'"+params.get("time")+ "\'";
		//String idx = "\'"+params.get("br_idx")+ "\'";
		String idx = "\'"+br_idx + "\'";
		String x1 = "\'%"+hour + ":00%\'";
		String x2 = "\'%"+hour + ":01%\'";
		String x3 = "\'%"+hour + ":02%\'";
		String x4 = "\'%"+hour + ":03%\'";
		String x5 = "\'%"+hour + ":04%\'";
		String x6 = "\'%"+hour + ":05%\'";
		String x7 = "\'%"+hour + ":06%\'";
		String x8 = "\'%"+hour + ":07%\'";
		String x9 = "\'%"+hour + ":08%\'";
		String x10 = "\'%"+hour + ":09%\'";
		
		RConnection conn = new RConnection();
		REXP exp,exp1;
		
		conn.eval("library('rJava')");
		conn.eval("library('RJDBC')");
		conn.eval("library('dplyr')");
		conn.eval("library(plotly)");
		conn.eval("library(htmlwidgets)");
		
		conn.eval("jdbcDriver <- JDBC(driverClass = 'oracle.jdbc.driver.OracleDriver', classPath ='ojdbc8.jar')");
		conn.eval("url <-'jdbc:oracle:thin:@gdportal.iptime.org:1521:xe'");
		conn.eval("id <-'C##WEB_USER'");
		conn.eval("pass<-'pass'");
		conn.eval("con <- dbConnect(jdbcDriver,url,id,pass)");
		
		conn.assign("idx", idx);
		conn.assign("x1", x1);
		conn.assign("x2", x2);
		conn.assign("x3", x3);
		conn.assign("x4", x4);
		conn.assign("x5", x5);
		conn.assign("x6", x6);
		conn.assign("x7", x7);
		conn.assign("x8", x8);
		conn.assign("x9", x9);
		conn.assign("x10", x10);
		
		
		
		
		conn.eval("");
		conn.eval("");
		conn.eval("");
		conn.eval("");
		conn.eval("");
		conn.eval("");
		conn.eval("");
		conn.eval("");
		conn.eval("");
		conn.eval("");
		conn.eval("");
		conn.eval("");
		conn.eval("");
		conn.eval("");
		
		

		conn.eval("str <- 'SELECT to_char(remain_reg_date,\\'d\\'), ROUND(AVG(remain)) from bicycle_remain where remain_time IN ('");
		conn.eval("str2<-x");
		conn.eval("str3<-','");
		conn.eval("str4<-y");
		conn.eval("str5<-')and br_idx='");
		conn.eval("str6<-z");
		conn.eval("str7<-'group by to_char(remain_reg_date,\\'d\\') order by to_char(remain_reg_date,\\'d\\')'");
		conn.eval("real <- paste(str,x,str3,y,str5,z,str7)");
		conn.eval("sql<-real");
		
		
		
		
	}

}
