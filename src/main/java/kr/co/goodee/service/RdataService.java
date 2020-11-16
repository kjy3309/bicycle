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
	      
	      String a1 = "\'%"+hour + ":10%\'";
	      String a2 = "\'%"+hour + ":11%\'";
	      String a3 = "\'%"+hour + ":12%\'";
	      String a4 = "\'%"+hour + ":13%\'";
	      String a5 = "\'%"+hour + ":14%\'";
	      String a6 = "\'%"+hour + ":15%\'";
	      String a7 = "\'%"+hour + ":16%\'";
	      String a8 = "\'%"+hour + ":17%\'";
	      String a9 = "\'%"+hour + ":18%\'";
	      String a10 = "\'%"+hour + ":19%\'";
	      
	      
	      String b1 = "\'%"+hour + ":20%\'";
	      String b2 = "\'%"+hour + ":21%\'";
	      String b3 = "\'%"+hour + ":22%\'";
	      String b4 = "\'%"+hour + ":23%\'";
	      String b5 = "\'%"+hour + ":24%\'";
	      String b6 = "\'%"+hour + ":25%\'";
	      String b7 = "\'%"+hour + ":26%\'";
	      String b8 = "\'%"+hour + ":27%\'";
	      String b9 = "\'%"+hour + ":28%\'";
	      String b10 = "\'%"+hour + ":29%\'";
	      
	      
	      String c1 = "\'%"+hour + ":30%\'";
	      String c2 = "\'%"+hour + ":31%\'";
	      String c3 = "\'%"+hour + ":32%\'";
	      String c4 = "\'%"+hour + ":33%\'";
	      String c5 = "\'%"+hour + ":34%\'";
	      String c6 = "\'%"+hour + ":35%\'";
	      String c7 = "\'%"+hour + ":36%\'";
	      String c8 = "\'%"+hour + ":37%\'";
	      String c9 = "\'%"+hour + ":38%\'";
	      String c10 = "\'%"+hour + ":39%\'";
	      
	      
	      String d1 = "\'%"+hour + ":40%\'";
	      String d2 = "\'%"+hour + ":41%\'";
	      String d3 = "\'%"+hour + ":42%\'";
	      String d4 = "\'%"+hour + ":43%\'";
	      String d5 = "\'%"+hour + ":44%\'";
	      String d6 = "\'%"+hour + ":45%\'";
	      String d7 = "\'%"+hour + ":46%\'";
	      String d8 = "\'%"+hour + ":47%\'";
	      String d9 = "\'%"+hour + ":48%\'";
	      String d10 = "\'%"+hour + ":49%\'";
	      
	      String e1 = "\'%"+hour + ":50%\'";
	      String e2 = "\'%"+hour + ":51%\'";
	      String e3 = "\'%"+hour + ":52%\'";
	      String e4 = "\'%"+hour + ":53%\'";
	      String e5 = "\'%"+hour + ":54%\'";
	      String e6 = "\'%"+hour + ":55%\'";
	      String e7 = "\'%"+hour + ":56%\'";
	      String e8 = "\'%"+hour + ":57%\'";
	      String e9 = "\'%"+hour + ":58%\'";
	      String e10 = "\'%"+hour + ":59%\'";
	      
	      
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
	      
	      conn.assign("a1", a1);
	      conn.assign("a2", a2);
	      conn.assign("a3", a3);
	      conn.assign("a4", a4);
	      conn.assign("a5", a5);
	      conn.assign("a6", a6);
	      conn.assign("a7", a7);
	      conn.assign("a8", a8);
	      conn.assign("a9", a9);
	      conn.assign("a10", a10);
	      
	      conn.assign("b1", b1);
	      conn.assign("b2", b2);
	      conn.assign("b3", b3);
	      conn.assign("b4", b4);
	      conn.assign("b5", b5);
	      conn.assign("b6", b6);
	      conn.assign("b7", b7);
	      conn.assign("b8", b8);
	      conn.assign("b9", b9);
	      conn.assign("b10", b10);
	      
	      conn.assign("c1", c1);
	      conn.assign("c2", c2);
	      conn.assign("c3", c3);
	      conn.assign("c4", c4);
	      conn.assign("c5", c5);
	      conn.assign("c6", c6);
	      conn.assign("c7", c7);
	      conn.assign("c8", c8);
	      conn.assign("c9", c9);
	      conn.assign("c10", c10);
	      
	      conn.assign("d1", d1);
	      conn.assign("d2", d2);
	      conn.assign("d3", d3);
	      conn.assign("d4", d4);
	      conn.assign("d5", d5);
	      conn.assign("d6", d6);
	      conn.assign("d7", d7);
	      conn.assign("d8", d8);
	      conn.assign("d9", d9);
	      conn.assign("d10", d10);
	      
	      conn.assign("e1", e1);
	      conn.assign("e2", e2);
	      conn.assign("e3", e3);
	      conn.assign("e4", e4);
	      conn.assign("e5", e5);
	      conn.assign("e6", e6);
	      conn.assign("e7", e7);
	      conn.assign("e8", e8);
	      conn.assign("e9", e9);
	      conn.assign("e10", e10);
	      
	      conn.eval("str1 <- 'select count(*) from t3_Bicycle_info where rent_idx='");
	      conn.eval("str2<- ' AND (rent_reg_date LIKE('");
	      conn.eval("str3<-') or rent_reg_date LIKE('");
	      conn.eval("str4<-') or rent_reg_date LIKE('");
	      conn.eval("str5<-') or rent_reg_date LIKE('");
	      conn.eval("str6<-') or rent_reg_date LIKE('");
	      conn.eval("str7<-') or rent_reg_date LIKE('");
	      conn.eval("str8<-') or rent_reg_date LIKE('");
	      conn.eval("str9<-') or rent_reg_date LIKE('");
	      conn.eval("str10<-') or rent_reg_date LIKE('");
	      conn.eval("str11<-') or rent_reg_date LIKE('");
	      conn.eval("str12<-'))'");
	      conn.eval("sql <- paste(str1,idx,str2,x1,str3,x2,str4,x3,str5,x4,str6,x5,str7,x6,str8,x7,str9,x8,str10,x9,str11,x10,str12, sep='')");
	      
	      conn.eval("b_str1 <- 'select count(*) from t3_Bicycle_info where back_idx='");
	      conn.eval("b_str2<- ' AND (back_reg_date LIKE('");
	      conn.eval("b_str3<-') or back_reg_date LIKE('");
	      conn.eval("b_str4<-') or back_reg_date LIKE('");
	      conn.eval("b_str5<-') or back_reg_date LIKE('");
	      conn.eval("b_str6<-') or back_reg_date LIKE('");
	      conn.eval("b_str7<-') or back_reg_date LIKE('");
	      conn.eval("b_str8<-') or back_reg_date LIKE('");
	      conn.eval("b_str9<-') or back_reg_date LIKE('");
	      conn.eval("b_str10<-') or back_reg_date LIKE('");
	      conn.eval("b_str11<-') or back_reg_date LIKE('");
	      conn.eval("b_str12<-'))'");
	      conn.eval("sql1 <- paste(b_str1,idx,b_str2,x1,b_str3,x2,b_str4,x3,b_str5,x4,b_str6,x5,b_str7,x6,b_str8,x7,b_str9,x8,b_str10,x9,b_str11,x10,b_str12, sep='')");
	      
	      conn.eval("rent <- dbGetQuery(con,sql)");
	      conn.eval("back <- dbGetQuery(con,sql1)");
	      conn.eval("result <- back$`COUNT(*)`- rent$`COUNT(*)` ");
	      // ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	      conn.eval("sql <- paste(str1,idx,str2,a1,str3,a2,str4,a3,str5,a4,str6,a5,str7,a6,str8,a7,str9,a8,str10,a9,str11,a10,str12, sep='')");
	      conn.eval("sql1 <- paste(b_str1,idx,b_str2,a1,b_str3,a2,b_str4,a3,b_str5,a4,b_str6,a5,b_str7,a6,b_str8,a7,b_str9,a8,b_str10,a9,b_str11,a10,b_str12, sep='')");
	      
	      conn.eval("rent <- dbGetQuery(con,sql)");
	      conn.eval("back <- dbGetQuery(con,sql1)");
	      exp = conn.eval("abc <- back$`COUNT(*)`- rent$`COUNT(*)`");
	      conn.eval("result <- rbind(result,abc)");
	      System.out.println(exp.asInteger());
	      // ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	      conn.eval("sql <- paste(str1,idx,str2,b1,str3,b2,str4,b3,str5,b4,str6,b5,str7,b6,str8,b7,str9,b8,str10,b9,str11,b10,str12, sep='')");
	      conn.eval("sql1 <- paste(b_str1,idx,b_str2,b1,b_str3,b2,b_str4,b3,b_str5,b4,b_str6,b5,b_str7,b6,b_str8,b7,b_str9,b8,b_str10,b9,b_str11,b10,b_str12, sep='')");
	      
	      conn.eval("rent <- dbGetQuery(con,sql)");
	      conn.eval("back <- dbGetQuery(con,sql1)");
	      exp = conn.eval("abc <- back$`COUNT(*)`- rent$`COUNT(*)`");
	      conn.eval("result <- rbind(result,abc)");
	      System.out.println(exp.asInteger());
	      // ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	      conn.eval("sql <- paste(str1,idx,str2,c1,str3,c2,str4,c3,str5,c4,str6,c5,str7,c6,str8,c7,str9,c8,str10,c9,str11,c10,str12, sep='')");
	      conn.eval("sql1 <- paste(b_str1,idx,b_str2,c1,b_str3,c2,b_str4,c3,b_str5,c4,b_str6,c5,b_str7,c6,b_str8,c7,b_str9,c8,b_str10,c9,b_str11,c10,b_str12, sep='')");
	      
	      conn.eval("rent <- dbGetQuery(con,sql)");
	      conn.eval("back <- dbGetQuery(con,sql1)");
	      exp =conn.eval("abc <- back$`COUNT(*)`- rent$`COUNT(*)`");
	      conn.eval("result <- rbind(result,abc)");
	      System.out.println(exp.asInteger());
	      // ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	      conn.eval("sql <- paste(str1,idx,str2,d1,str3,d2,str4,d3,str5,d4,str6,d5,str7,d6,str8,d7,str9,d8,str10,d9,str11,d10,str12, sep='')");
	      conn.eval("sql1 <- paste(b_str1,idx,b_str2,d1,b_str3,d2,b_str4,d3,b_str5,d4,b_str6,d5,b_str7,d6,b_str8,d7,b_str9,d8,b_str10,d9,b_str11,d10,b_str12, sep='')");
	      
	      conn.eval("rent <- dbGetQuery(con,sql)");
	      conn.eval("back <- dbGetQuery(con,sql1)");
	      exp = conn.eval("abc <- back$`COUNT(*)`- rent$`COUNT(*)`");
	      conn.eval("result <- rbind(result,abc)");
	      System.out.println(exp.asInteger());
	      //ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	      conn.eval("sql <- paste(str1,idx,str2,e1,str3,e2,str4,e3,str5,e4,str6,e5,str7,e6,str8,e7,str9,e8,str10,e9,str11,e10,str12, sep='')");
	      conn.eval("sql1 <- paste(b_str1,idx,b_str2,e1,b_str3,e2,b_str4,e3,b_str5,e4,b_str6,e5,b_str7,e6,b_str8,e7,b_str9,e8,b_str10,e9,b_str11,e10,b_str12, sep='')");
	      
	      conn.eval("rent <- dbGetQuery(con,sql)");
	      conn.eval("back <- dbGetQuery(con,sql1)");
	      exp  = conn.eval("abc <- back$`COUNT(*)`- rent$`COUNT(*)`");
	      conn.eval("result <- rbind(result,abc)");
	      System.out.println(exp.asInteger());
	      //ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	      conn.eval("df <- as.data.frame(result, stringsAsFactors = FALSE)");
	      conn.eval("df <- cbind(df,'time'=c('0~9','10~19','20~29','30~39','40~49','50~59'))");
	      conn.eval("names(df) <- c('count','time')");
	      conn.eval("graph <- plot_ly(df, x=~time, y=~count)");
	      conn.eval("saveWidget(graph,'C:/rLink/real_graph.html', selfcontained=FALSE, libdir='lib')");
	      conn.eval("dbDisconnect(con)");
	      
	      conn.close();
	      
	      
	   }
}
