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
			
			input[type='text']:focus{
				outline: none;
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
	
	<table>
		<tr>
			<td>
				<input type="hidden" id="id" name="id" value="test"/>
				<!--  <input type="hidden" id="id" name="id" value="${session.getid}"/><!-- 로그인할때 세션에 저장된 아이디 가져와서 넣는다.-->
				댓글<input type="text" name="content" id="content" placeholder="댓글을 작성해주세요."/>
				<input type="button" id="re_btn" value="작성"/>
			</td>
		</tr>
	</table>
			
			
	<table>
		<tr>
			<th>아이디</th>
			<th>내용</th>
			<th>날짜</th>
			<th colspan="2"></th>
		</tr>
		
		<c:forEach var ="repl" items="${repl_list}" >
			<tr>
				<td>${repl.id}</td>
				<!--input type으로 해놓고 테두리를 흰색으로바꾸고 못고치게 readonly 준다.  -->
				<%-- <td id="real_repl">${repl.r_comment}</td> --%>
				
				<!-- 2020.11.04 여기부터 다시 만들면 된다 가히얌..힘내보자^^ -->
				<td>
					<input type="text" id="${repl.r_idx}" value="${repl.r_comment}" style="border:0px" readonly/> 
					<!-- <input type="text" id=""  value="${repl.r_comment}"  style="display:none"/></td>-->
					<td id="repl_Oridate">${repl.r_reg_date}</td>
				
					<!-- <input type="hidden" id="r_idx" value="${repl.r_idx}" /> -->
				<td>
					<input type="button" id="update${repl.r_idx}" value="수정"   onclick="replyUpdate1(${repl.r_idx})"/>
					<input type="button" id="confirm${repl.r_idx}" value="확인" style="display:none"    onclick="replyUpdate2(${repl.r_idx})" />
					<input type="button" id="re_delete" onclick="replyDelete(${repl.r_idx})" value="삭제" />
				</td>
			</tr>
		</c:forEach>
	</table>
	
	

</body>
<script>
	
		$("#re_btn").click(function(){
			var param ={};
			param.b_idx = ${info.b_idx};//이게되나?
			param.id = $("#id").val();
			param.content = $("#content").val();
			
			$.ajax({
		         type:'POST',
		         url:'reply',
		         data:param,
		         dataType:"JSON",
		         success:function(d){
		        	 console.log(d);
		        	 //alert("댓글 작성 완료");
		        	 location.href='FreeBoarddetail?idx='+${info.b_idx};
		        	 //listCall(); 
		        	
		         },
		         error:function(e){
		        	 console.log(e);
		        	 alert("댓글 작성 실패");
		         }
		      });
		})
				
		
		
		
		
		
	
		//댓글수정1
		 function replyUpdate1(idx){
			var upcomment = '#'+idx;
			var update = '#update'+idx;
			var confirm = '#confirm'+idx;
			//$("#real_repl").attr('readonly', false);
			/* $("#real_repl").css('display','none');
			$(upcomment).css('display', 'block'); */
			console.log($(upcomment));
			$(upcomment).attr('readonly', false);
			$(upcomment).css('border', '1px solid black');
			
			$(update).css('display','none');
			$(confirm).css('display','block');
			
		}
		 
		//댓글수정 완료2
		function replyUpdate2(idx){
			var upcomment = '#'+idx;
			var update = '#update'+idx;
			var confirm = '#confirm'+idx;
			
			var param ={};
			param.b_idx = ${info.b_idx};
			param.r_idx = idx;
			param.r_comment = $(upcomment).val();
			
			$.ajax({
		         type:'POST',
		         url:'replyUpdate',
		         data:param,
		         dataType:"JSON",
		         success:function(d){
		        	 console.log(d);
		        	 //alert("댓글 수정 완료");
		        	 location.href='FreeBoarddetail?idx='+${info.b_idx};

		         },
		         error:function(e){
		        	 console.log(e);
		        	 alert("댓글 수정 실패");
		         }
		      });
		}
		 
		//댓글삭제
		
		function replyDelete(rIdx){
			var param ={};
			param.b_idx = ${info.b_idx};
			param.r_idx = rIdx;
			
			$.ajax({
		         type:'GET',
		         url:'replyDelete',
		         data:param,
		         dataType:"JSON",
		         success:function(d){
		        	 console.log(d);
		        	 alert("댓글 삭제");
		        	 location.href='FreeBoarddetail?idx='+${info.b_idx};
		        	 

		         },
		         error:function(e){
		        	 console.log(e);
		        	 alert("댓글 삭제 실패");
		         }
		      });
		}
		
		
		
		
		
		
		
	
	
	
	
			
	//리스트띄우기- 필요없는 코드-----------------------------------
	function listCall(){
		
		var param ={};
		param.b_idx = ${info.b_idx};//이게되나?
		
		$.ajax({
			type:'GET',
			url:'FreeBoarddetail',
			data:param,
			dataType:'JSON',
			success:function(s){
				console.log('List성공했을까?');//원래는 여기로 와야되는데 안온단말이지.. 왜일까 왔다아! boolean값으로 반환했더니.
			},error:function(e){
				console.log(e);
			}
		});
	}
			

</script>
</html>