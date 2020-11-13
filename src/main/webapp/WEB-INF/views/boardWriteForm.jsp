<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
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
			#writeFormTable{
			position: relative;
			margin-top:5%;
			left:23%;
			}
			.a{
			background-color: rgb(17, 124, 167);
			}
			.b{
			background-color: rgb(220, 242, 250);
			}
			
	</style>
</head>
<body>
	
	
	<form action = "freeBoardWrite" method="post">
	<table class = "board"  style="text-align: center; border: 1px solid #dddddd; width:50%;" id="writeFormTable">
		
		<tr>
		<!--session.get("userId") 세션에서 가져와서 작성자에 value값으로 넣어줘야하남...-->
			<th width="150px" class="a">작성자</th>
			<td class="b"><p>${loginId}</p></td>
			<input name="id" type="hidden" value="${loginId }"/>	
		</tr>
		<tr>
			<th width="150px" class="a">제목</th>
			<td class="b"><input type = "text" name ="subject" /></td>	
		</tr>
		<tr>
			<th width="150px" class="a">내용</th>
			<td class="b">
				<div id = "editable" contenteditable="true" style="background-color: white;"></div>
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
	
	<!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>

    <!-- Option 2: jQuery, Popper.js, and Bootstrap JS
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
    -->
	
</body>
<script>
	function fileUp(){ // 파일 업로드 클릭시
		//var FreeBoardWindow = window.open('fileUploadForm','파일업로드','width=500 ,height=150');
		window.open('fileUploadForm','파일업로드','width=500, height=150');
	}

	function save(){
		$("#editable input[type = 'button']").remove(); // 삭제버튼 제거
		$("#content").val($("#editable").html()); // 
		$("form").submit();
		
		
		//location.href = "/FreeBoardlist?category=1&&page=1";
	}
	
	function del(elem){
		console.log(elem);
		var fileName = elem.id.split("/")[1];
		$.ajax({
			url:'boardFileDelete',
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