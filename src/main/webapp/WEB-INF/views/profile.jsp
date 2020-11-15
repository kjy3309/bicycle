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
        <a style="color: white; margin-left: 20px; margin-top: 20px;" >안녕하세요 ${sessionScope.loginId } 님.</a>  <button onclick="location.href='logout'" style="margin-left: 92%; color: white; background-color:rgb(14, 13, 13); border:rgb(14, 13, 13);">로그아웃</button>
        <hr color="orange" width="97%">
		<table id="inform" style=" margin-top: 10px;">
			
			<c:forEach items="${list}" var="bbs">
				<tr >     
                    <th>이름 &nbsp&nbsp&nbsp&nbsp<a> | </a></th><td>${bbs.name}</td>
                </tr> 
                <tr>
                    <th>나이 &nbsp&nbsp&nbsp&nbsp<a> | </a></th><td>${bbs.birth}</td>
                </tr>
                <tr>
                    <th>생년 &nbsp&nbsp&nbsp&nbsp<a> | </a></th><td>${bbs.status}</td>
                </tr>
                <tr>
                    <th>이메일  &nbsp&nbsp<a> | </a></th><td>${bbs.email}</td>
                </tr>
                <tr >
                       <td> <a style="color: darkorange;" href="updateForm?name=${bbs.name}">정보 수정</a> </td>
                   
                    <th> </th>
                    <td>
                        
                     <a style="color: darkorange; margin-left: 670px;" href="writeForm?name=${bbs.name}">문의 하기</a> </td>
                     <td> <a style="color: darkorange; margin-left: 15px;" href="question?name=${bbs.id}">문의 내역</a> </td>
                     <td> <a style="color: darkorange; margin-left: 15px;" href="answer?name=${bbs.name}">답변 내역</a>
                    </td>
                </tr>
                <tr>
                	<td> <a style="color: darkorange;" href="./">메인으로</a>
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
