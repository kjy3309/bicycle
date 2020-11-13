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
			border: 1px solid black;
			border-collapse: collapse;
			padding: 5px 10px;
		}
	</style>
</head>
<body>
		안녕하세요. ${sessionScope.loginId } 님. <button onclick="location.href='logout'">로그아웃</button>
		<button style="margin-top: 5px;" onclick="location.href='writeForm'">글쓰기</button>
		<button style="margin-top: 5px;" onclick="location.href='withDraw'">회원탈퇴</button>
		<button style="margin-top: 5px;" onclick="location.href='profile'">정보</button>
		<table id="list">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
			<c:forEach items="${list}" var="bbs">
				<tr>
					<td>${bbs.idx}</td>
					<td><a href="detail?idx=${bbs.idx}">${bbs.subject}</a></td>
					<td>${bbs.user_name}</td>
					<td>${bbs.reg_date}</td>
					<td>${bbs.bHit}</td>
				</tr>
			</c:forEach>			
		</table>
		
</body>
<script>
	var msg="${msg}";
	if(msg != ""){
		alert(msg);
	}
	
</script>
</html>




