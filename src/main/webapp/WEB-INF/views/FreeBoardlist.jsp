<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    
      
    <title>Hello, world!</title>
	<style>
   		#boardlist{
   			width : 60%;
   			height : 300px;
   			margin : 3% auto;
   			margin-bottom : 10px;
   		}
   		
   		#drbtn{
   			margin-left : 76.2%; 
   		}
   		
   	</style>
  </head>
  <body>
	
    <!-- 테이블 -->
	<table class="table table-hover table-bordered" id="boardlist">
	  <thead class="thead-dark">
	    <tr>
	      <th scope="col">번호</th>
	      <th scope="col">제목</th>
	      <th scope="col">작성자</th>
	      <th scope="col">작성일</th>
	      <th scope="col">조회수</th>
	    </tr>
	  </thead>
		<tbody>
			<c:forEach items = "${boardList}" var = "bbs">
				<tr>
					<td>${bbs.b_idx}</td>
					<td>
						<a href ="FreeBoarddetail?idx=${bbs.b_idx}">${bbs.subject}</a>
					</td>
					<td>${bbs.id}</td>
					<td>${bbs.reg_date}</td>
					<td>${bbs.bHit}</td>
				</tr>
			</c:forEach>
		</tbody>
  </table>
  <table>
  		<button id = "drbtn" type="button" class="btn btn-dark" onclick = "location.href='FreeBoardwriteForm'">글쓰기</button>
  </table>
  <!-- 테이블 끝-->
    <!-- Optional JavaScript; choose one of the two! -->
	<!-- <nav aria-label="...">
	  <ul class="pagination">
	    <li class="page-item disabled">
	      <span class="page-link">이전</span>
	    </li>
	    <li class="page-item"><a class="page-link" href="#">1</a></li>
	    <li class="page-item active" aria-current="page">
	      <span class="page-link">
	        2
	        <span class="sr-only">(current)</span>
	      </span>
	    </li>
	    <li class="page-item"><a class="page-link" href="#">3</a></li>
	    <li class="page-item">
	      <a class="page-link" href="#">다음</a>
	    </li>
	  </ul>
	</nav> -->
	<div class="list-paging">  
    	<c:if test="${page.curPage ne 1}">
            <button onClick="fn_paging('${page.prevPage }')">prev</button> 
        </c:if>             
         <c:forEach var="pageNum" begin="${page.startPage }" end="${page.endPage }">
          <c:choose>
              <c:when test="${pageNum eq  page.curPage}">
                  <button class="on" onClick="fn_paging('${pageNum }')">${pageNum }</button> 
              </c:when>
              <c:otherwise>
                  <button onClick="fn_paging('${pageNum }')">${pageNum }</button> 
              </c:otherwise>
         </c:choose>
     </c:forEach>
     <c:if test="${page.curPage ne page.pageCnt && page.pageCnt > 0}">
            	<button onClick="fn_paging('${page.nextPage }')">next</button> 
        </c:if>
    </div>    

    <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>

    <!-- Option 2: jQuery, Popper.js, and Bootstrap JS
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
    -->
  </body>

</html>