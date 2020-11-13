<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<style>
		table, th, td{
			padding: 20px 10px;
            color: white;
		}
		body{
			background-color: rgb(14, 13, 13);
		}

        #out{
            background-color: rgb(14, 13, 13);
            margin-left: 15%;
            margin-top: 11%;
            height: 600px;
            width: 1300px;
        }

	</style>
</head>
<body>

    <div id="out">
        <a style="color: white; margin-left: 20px; margin-top: 20px;" >문의 내역</a>
        <hr color="orange" width="97%" style="margin-top: 20px;">
		<table id="inform" style=" margin-top: 10px;">
            <c:forEach items="${list}" var="bbs">
                    <tr>
                        <td>제목 : ${bbs.subject} <a> | </a>${bbs.reg_date}</td>
                        
                    </tr>
                    <tr>
                        <td>${bbs.content}</td>
                    </tr>
                    <tr>
                        <td><hr size="1px" color="white" width="1250px" style="margin-top: 20px; margin-left: -5px; "></td>
                    </tr>
                </c:forEach>	
        </table>
        
    </div>
		
</body>

<script>
var msg="${msg}";
if(msg != ""){
	alert(msg);
}
</script>
</html>