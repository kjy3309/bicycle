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
	
	<form action = "boardUpdate" method="post">
	<table class = "board">
		
		<input type="hidden" name="b_idx" value="${info.b_idx}"/>
		
		
		
		<tr>
			<th>작성자</th>
			<td>${info.id}</td>	
		</tr>
		<tr>
			<th>제목</th>
			<td><input type = "text" name ="subject" id = "subject" value="${info.subject}"/></td>	
		</tr>
		<tr>
			<th>내용</th>
			<td>
				<div id = "editable" contenteditable="true">${info.content}</div>
				<input id = "content" type="hidden" name = "content" value = ""/>
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
			<td colspan="2"><input type ="button" onclick="save()"  value="저장"/>
			</td>	
		</tr>																		
		<input type="hidden" id="category" name="category" value="${category} "/>
		<input type="hidden" id="page" name="page" value="${page}"/>
		<!--얘네 값 다 온단말이쥐 .. 잠깐 화장실갔다와야겠다.  -->
	</table>
	</form>
</body>
<script>

	//삭제버튼 붙이기
	$(document).ready(function(){
	   $("#editable img").each(function(idx,item){//idx = 갯수 , item = ???
	      console.log(idx,item);
	      $(item).after("<input id='${path}' type='button' value='삭제' onclick='del(this)'><br/>");
	   });
	});
	
	function fileUp(){ // 파일 업로드 클릭시 ★★ㅁ8★★ㅁ8ㅁ8★ㅁ8ㅁ8ㅁ이건 도대체 왜 연결이 안되는거야?
		var FreeBoardWindow = window.open('fileUploadForm','파일업로드','width=500,height=150');
												
	}

	function save(){
		
		var category = $("#category").val();
		var page = $("#page").val();
		var y = $('#subject').val();
		var t = $('#editable').html();
		$('#content').val(t);
		var z = $('#content').val();
	
		//값 전달되니까 내일은 그거 넣어서 form다시 살리고 죽였던거 다시 살려서 시도해보자
		$("#editable input[type = 'button']").remove(); // 삭제버튼 제거
		$("#content").val($("#editable").html());
		$("form").submit();
		
		/* location.href='boardList?category='+category+'&&page='+page; *///이게 도대체 왜 안갈까?
		//location.href = 'boardList?category="${category}+"&page="+${page};
		//location.href='boardDetail?idx='+${info.b_idx}+'&&category='+${category}+'&&page='+${page};
   	
	}
	
    //파일 삭제 버튼 
    function del(elem){
       //console.log(elem); 
       var file = $(elem).prevAll();
       var name = file[0].outerHTML.split("/")[2].split(" ")[0];
       var fileName = name.substring(name.indexOf('"'),name);
       console.log(fileName);
        $.ajax({
          url:'boardFileDelete',
          type:'get',
          data:{'fileName':fileName}, 
          dataType:'json',
          success:function(data){
             console.log(data);
             if(data.success == 1){
            	 console.log("???");
                $(elem).prev().remove(); 
                $(elem).remove(); 
             }
          }, error:function(e){
             
          }
       }); 
    }


</script>
</html>