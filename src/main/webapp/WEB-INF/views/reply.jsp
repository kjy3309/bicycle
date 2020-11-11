<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
	   <meta charset="UTF-8">
	   <title>Insert title here</title>
	   <style>
	   	textarea{
			width: 100%;
			height: 150px;
			resize: none;
		}
	   </style>
	   <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	</head>
<body>
		<table>
			<tr><th>번호</th><td>${info.b_idx}</td></tr>
			<tr><th>조회수</th><td>${info.bHit}</td></tr>
			<tr><th>작성자</th><td>${info.id}</td></tr>
			<tr><th>제목</th><td>${info.subject}</td></tr>
			<tr><th>내용</th><td>${info.content}	</td></tr>
		</table>
			<a href = "FreeBoardlist">목록보기</a>
			<a href="FreeBoarddelete?idx=${info.b_idx}">삭제</a>
	
	
	<table>
		<tr>
			<td><input type="text" id="b_idx" name="b_idx"></td>
		</tr>
		<tr>
			<td><input type="text" id="id" name="id"/></td>
		</tr>
		<tr>
			<td><textarea name="content" id="content"></textarea></td>
		</tr>
	</table>
	<input type="button" id="re_btn" value="댓글작성"/>
	
	<!--  리스트 뿌려주기-->
	<c:forEach var="replList" items="${repl}">

    <p><c:out value="${replList.title}" /></p>

	</c:forEach>
	
</body>
<script>

	// 게시글번호가 ${bbs.idx}
	// function listCall >>>  var idx = "${}"
	// ajax. 게시글번호에 해당하는 댓글 목록들을 쫙 뽑아와요
	// 댓글 리스트 append 쫙그려져요 list
	
	//replylistCall() >> 글 idx에있는 댓글이 불러와져요. 
	//리스트를 먼저 뽑고 수정,삭제 후
	//그리고 리스트콜 함수는 글작성후 성공하면 다시 실행
	//controller에서  json
	
	//그러니까 디테일 들어가자마자 댓글 쫙 뽑는 함수필요하고
	//arraylist로 뽑은애들을 view로 가져와서 foreach문으로 뿌려주자. 
	
	
	
	
	
	
	
	
	
	//리스트띄우기
	function listCall(){
		
		var param="${}";//detail에 있는 b_idx값을 가져와라 그걸 기준으로 댓글들을 다 가져와서 each로..붙이쟈 (반복)
		param.b_idx=$("#b_idx").val();
		
		$.ajax({
			type:'POST',
			url:'replyList',
			data:param,
			dataType:'JSON',
			success:function(s){
				console.log(s);
				
			},error:function(e){
				console.log(e);
				
			}
			
		});
		
	}
	
	


	
	//댓글저장
	$("#re_btn").click(function(){
		var param ={};
		param.b_idx = $("#b_idx").val();
		param.id = $("#id").val();
		param.content = $("#content").val();
		
		var ingre ="$('#b_idx').value()";
		$.ajax({
	         type:'GET',
	         url:'reply',
	         data:param,
	         dataType:"JSON",
	         success:function(d){
	        	 console.log(d);
	        	 alert("댓글 작성 완료");
	        	 //location.href="./prepareList?param=ingre ";
	        	 //"detail?idx=${bbs.idx}"
	        	 listCall(); 
	        	
	         },
	         error:function(e){
	        	 console.log(e);
	        	 alert("댓글 작성 실패");
	         }
	      });
	})
	
	

</script>
</html>