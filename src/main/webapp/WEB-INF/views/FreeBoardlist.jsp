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

       <!-- css -->
      <link rel="stylesheet" href="resources/css/reset.css">
      <link rel="stylesheet" href="resources/css/style.css">
      <link rel="stylesheet" href="resources/css/swiper.css">

      <!-- 웹 폰트 -->
      <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&subset=korean" rel="stylesheet">
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
	
	   <header id="header">
            <div class="container">
                <div class="row">
                    <div class="header clearfix">
                        <h1 style="float: left">
                            <a href="#">
                                <h2><strong>이미지하나..필요</strong></h2>
                            </a>    
                        </h1>
                        <nav class="nav" style="float: right">                            
                            <ul class="clearfix">
                                <li><a href="FreeBoardlist">Notice</a></li>
                                <li><button>Login</button></li>
                            </ul>
                        </nav>    
                    </div>
                </div>
            </div>
        </header>
        <!-- //header -->
	
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
			<c:forEach items = "${FreeBoardlist}" var = "bbs">
				<tr>
					<td>${bbs.b_idx}</td>
					<td>
						<a href ="FreeBoarddetail?idx=${bbs.b_idx}" target="_blank">${bbs.subject}</a>
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
    
	 <nav aria-label="...">
	  <ul class="pagination">
	    <li class="page-item disabled">
	      <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
	    </li>
	    <li class="page-item"><a class="page-link" href="#">1</a></li>
	    <li class="page-item active" aria-current="page">
	      <a class="page-link" href="#">2 <span class="sr-only">(current)</span></a>
	    </li>
	    <li class="page-item"><a class="page-link" href="#">3</a></li>
	    <li class="page-item">
	      <a class="page-link" href="#">Next</a>
	    </li>
	  </ul>
	</nav>

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