<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<link rel="stylesheet" href="css/common.css" type="text/css">
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
	<a style="color: white; margin-left: 20px; margin-top: 20px;" >정보 수정</a>
        <hr color="orange" width="97%" style="margin-top: 20px;">
		<form action="update" method="post">
		<table>
			<c:forEach items="${bbs}" var="bbs">
				   
                   <td><input  type="hidden" name="id" style="color: white; background-color: rgb(44, 43, 43); border: 1px rgb(14, 13, 13); width: 400px; height: 20px;" value="${bbs.id }" /></td>
                
			<tr >     
                    <th>이름 &nbsp&nbsp&nbsp&nbsp<a> | </a></th><td><input type="text" name="user_name" style="color: white; background-color: rgb(44, 43, 43); border: 1px rgb(14, 13, 13); width: 400px; height: 20px;" value="${bbs.name }" /></td>
                </tr> 
                <tr>
                    <th>나이 &nbsp&nbsp&nbsp&nbsp<a> | </a></th><td><input type="text" name="age" style="color: white; background-color: rgb(44, 43, 43); border: 1px rgb(14, 13, 13); width: 400px; height: 20px;" value="${bbs.birth }" /></td>
                </tr>
                <tr>
                    <th>성별 &nbsp&nbsp&nbsp&nbsp<a> | </a></th><td><input type="text" name="gender" style="color: white; background-color: rgb(44, 43, 43); border: 1px rgb(14, 13, 13); width: 400px; height: 20px;" value="${bbs.status }" /></td>
                </tr>
                <tr>
                    <th>이메일  &nbsp&nbsp<a> | </a></th><td><input type="text" name="email" style="color: white; background-color: rgb(44, 43, 43); border: 1px rgb(14, 13, 13); width: 400px; height: 20px;" value="${bbs.email }" /></td>
                    <th style="padding-left: 700px;"> 
                    <input onClick="ms()" style="color: orange; background-color: rgb(14, 13, 13); border: 1px  rgb(14, 13, 13); font-size: 15px " type="submit" value="수정"/></th>
                </tr>
                
           </c:forEach>
		</table>
	</form>
	</div>
</body>
<script>
function ms() {
	alert("회원 정보가 수정되었습니다.");
}</script>
</html>