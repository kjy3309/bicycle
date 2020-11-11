<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<style>
			table,th,td{
				border : 1px solid black;
				border-collapse: collapse;
				padding: 5px 10px;
			}
		</style>
		<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	</head>
<body>
	<table>
		<input type="hidden" name="b_idx" value="${info.b_idx}"/>
		<tr><th>조회수</th><td>${info.bHit}</td></tr>
		<tr><th>작성자</th><td>${info.id}</td></tr>
		<tr><th>제목</th><td>${info.subject}</td></tr>
		<tr><th>내용</th><td>${info.content}	</td></tr>
	</table>
	<a href = "FreeBoardlist">목록보기</a>
	<a href="FreeBoarddelete?idx=${info.b_idx}">삭제</a>
	<a href="FreeBoardupdateForm?idx=${info.b_idx}">수정</a>
</body>
<script>

</script>
</html>