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
        <a style="color: white; margin-left: 20px; margin-top: 20px;" >문의하기</a>
        <hr color="orange" width="97%" style="margin-top: 20px;">
		<form action="write" method="post">
            <table>
				<tr>
					<th>작성자</th>
					<td><input type="text" name="user_name" style="color: white; background-color: rgb(44, 43, 43); border: 1px rgb(14, 13, 13); width: 400px; height: 20px;" value="${sessionScope.loginId}" readonly/></td>
				</tr>
                <tr>
                    <th>제목</th>
                    <td><input type="text" name="subject" style="color: white; background-color: rgb(44, 43, 43); border: 1px rgb(14, 13, 13); width: 400px; height: 20px;"/></td> <td colspan="2"><input onClick="ms()" style="color: white; background-color: rgb(14, 13, 13); border: 1px  rgb(14, 13, 13);" type="submit" value="보내기"/></td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td><textarea name="content" style="resize: none; color: white; background-color: rgb(44, 43, 43); border: 1px rgb(14, 13, 13); width: 1100px; height: 370px;"></textarea></td>
                </tr>
            </table>
        </form>
        
    </div>
		
</body>
<script>
	function ms() {
		alert("관리자에게 문의되었습니다");
	}
</script>
</html>