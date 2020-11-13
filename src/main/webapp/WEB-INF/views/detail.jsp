<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	
	
</head>
<body>
	<table>
			<tr>
				<th>글 번호</th><td>${bbs.idx}</td>
			</tr>
			<tr>
				<th>조회수</th><td>${bbs.bHit}</td>
			</tr>
			<tr>
				<th>작성자</th>	<td>${bbs.user_name}</td>
			</tr>
			<tr>
				<th>작성일</th>	<td>${bbs.reg_date}</td>
			</tr>
			<tr>
				<th>제목</th><td>${bbs.subject}</td>
			</tr>
			<tr>
				<th>내용</th><td>${bbs.content}</td>
			</tr>	
		<tr>
			<td colspan="2">
				<input type="button" value="삭제" onclick="location.href='del?idx=${bbs.idx}'"/>
				<input type="button" value="수정" onclick="location.href='updateForm?idx=${bbs.idx}'"/>
				<input type="button" value="글목록" onclick="location.href='list'"/>
			</td>
		</tr>		
	</table>		
</body>
<script>
var msg="${msg}";
if(msg != ""){
	alert(msg);
}
</script>
</html>