<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src= "https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<style>
			table{
				width: 500px;
			}
			
			table,th,td{
				border: 1px solid black;
				border-collapse:collapse;
				padding:5px 10px;
			}
			
			td{
				text-align :center;
			}
			
			input[type='text']{
				width:100%;
			}
			
			#editable{
				text-align : left;
				width : 98%;
				height : 500px;
				border : 1px solid gray;
				padding : 5px;
				overflow : auto;
			}
			
	</style>
</head>
<body>
	<form action = "FreeBoardwrite" method="post">
	<table class = "board">
		<tr>
			<th>작성자</th>
			<td><input type = "text" name ="id"/></td>	
		</tr>
		<tr>
			<th>제목</th>
			<td><input type = "text" name ="subject"/></td>	
		</tr>
		<tr>
			<th>내용</th>
			<td>
				<div id = "editable" contenteditable="true"></div>
				<input id = "content" type = "hidden" name = "content" value = ""/>
			</td>	
		</tr>
		<tr>
			<th>파일첨부</th>
			<td>
				<input type = "button" onclick = "fileUp()" value = "파일 업로드"/>
				<div id = "files"></div>
			</td>
		</tr>
		<tr>
			<td colspan="2"><input type = "submit"  onclick="save()" value = "저장"/></td>	
		</tr>		
	</table>
	</form>
	
</body>
<script>
	function fileUp(){ // 파일 업로드 클릭시
		var FreeBoardWindow = window.open('FileuploadForm','파일업로드','width=500,height=150');
	}

	function save(){
		$("#editable input[type = 'button']").remove(); // 삭제버튼 제거
		$("#content").val($("#editable").html()); // 
		$("form").submit();
		location.href = "/FreeBoardlist";
	}
	
	function del(elem){
		console.log(elem);
		var fileName = elem.id.split("/")[1];
		$.ajax({
			url:'FreeBoardfileDelete',
			type : 'get',
			data : {'fileName' : fileName},
			dataType : 'json',
			success:function(data){
				console.log(data);
				if(data.success == 1){ // 성공했으면
					$(elem).prev().remove(); //클릭한 기준으로 앞에 삭제
					$(elem).remove(); // 클릭 버튼 삭제
				}
			},error:function(e){
				
			}
		})
	}

</script>
</html>