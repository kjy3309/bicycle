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
    <link rel="stylesheet" href="resources/css/default.css">
    <link rel="stylesheet" href="resources/css/style.css">
    <link rel="stylesheet" href="resources/css/formmail.css">

    <script src="resources/js/jquery-1.8.3.min.js"></script>
    <script src="resources/js/jquery.menu.js"></script>
    <script src="resources/js/jquery.easing.1.3.js"></script>
    <script src="resources/js/common.js"></script>
    <script src="resources/js/wrest.js"></script>
    <script src="resources/js/visualShow.js"></script>
    <script src="resources/js/main.js"></script>
    <script src="resources/js/hamMenu.js"></script>
    <script src="resources/js/responsive.js"></script>
    <script src="resources/js/scrollAction.js"></script>
    <script src="resources/js/jquery.rotate.js"></script>
    <script src="resources/js/swiper.js"></script>
    <script src="resources/js/swiper.min.js"></script>
    <link rel="stylesheet" href="resources/css/main.css">
    <link rel="stylesheet" href="resources/css/swiper.css">
    <link rel="stylesheet" href="resources/css/swiper.min.css">
    <link rel="stylesheet" href="resources/css/font-awesome.min.css">
    
    <!-- 웹 폰트 -->
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&subset=korean" rel="stylesheet">
      
    <title>Hello, world!</title>
	<style>
   		#boardlist{
   			width : 50%;
   			height : 300px;
   			margin : 3% auto;
   			margin-top : 7%;
   			table-layout: fixed;
   			padding-bottom: 10px;
   			margin-right : 17%;
   			font-size : 13px;
   		}
   		
   		#drbtn{
   			margin-left : 79.2%; 
   			margin-top : -3%;
   		}
   		
   		#listgroup{
			width: 300px;
            height: 500px;
            float: left; width: 15%;
            margin-left: 9%;
            border-radius: 10px;
            margin-top : 7%;
   		}
   		
   		#navilist{
   		margin-left : 50%;
   		margin-top : -2.5%;
   		padding-bottom : 10px;
   		}
   		
   		body {
   		display:block; 
   		top:0;
   		left:0; 
   		width:100%; 
   		height:100%; 
   		background-image: url("./resources/image/bg02.png"); 
   		z-index:-1;"
   		}
   		
   	</style>
  </head>
  <body>
    <div id="Header" style="background-color: darkgrey; height: 90px;">
        <div class="logoWrap">
            <a href="./"><img src="resources/image/logo.png" alt="로고" title=""></a>
        </div>
        <div class="login">
            <button onclick="openModal(1)">Login</button>
        </div>
        <div id="id01" class="modal">
            <form name="loginForm" class="modal-content animate" action="login" method="post">            
                <div class="modal-container">
                    <label for="id"><b>아이디</b></label>
                    <input type="text" placeholder="아이디를 입력해주세요." name="id" required>
                    <label for="pw"><b>패스워드</b></label>
                    <input type="password" placeholder="패스워드를 입력해주세요." name="pw" required>                
                    <button class="modal-button">로그인</button>
                </div>

                <div class="modal-container">
                    <button  type="button" onclick="document.getElementById('id01').style.display='none'" class="cancelbtn">취소</button>
                    <p class = "p33">회원이 아니시라면  <span style="text-decoration: underline; cursor: pointer;" onclick="openModal(2)">회원가입</span> 하세요. <p>
                </div>

            </form>
        </div>

        <div id="id02" class="modal">
            <form name="joinForm" class="modal-content animate" action="join" method="post">
                <div class="modal-container">
                    <label for="id"><b>아이디</b></label>
                    <input type="text" placeholder="아이디를 입력해주세요." id="newId" name="id" onblur="checkedID()" required>
                    <input type="hidden" name="checked" value="" />
                    <label for="pw"><b>패스워드</b></label>
                    <input type="password" placeholder="패스워드를 입력해주세요." name="pw" required>
                    
                    <label for="name"><b>이름</b></label>
                    <input type="text" placeholder="이름을 입력해주세요." name="name" required>
                    
                    <label for="age"><b>나이</b></label>
                    <input type="text" placeholder="나이를 입력해주세요." name="age" required>
                    
                    <label for="gender"><b>성별</b></label>
                    <input type="text" placeholder="성별을 입력해주세요." name="gender" required>
                    
                    <label for="email"><b>이메일</b></label>
                    <input type="text" placeholder="이메일을 입력해주세요." name="email" required>
                    
                    <button class="modal-button">회원가입</button>
                </div>

                <div class="modal-container">
                    <button type="button" onclick="document.getElementById('id02').style.display='none'" class="cancelbtn">취소</button>
                </div>
            </form>
        </div>
        <div class="hamWrap2">
            <div id="ham" class="ham ham2">
                <span style="top: 0px;"></span>
                <span style="overflow: hidden; width: 24px; left: 0px;"></span>
                <span style="top: 20px;"></span>
            </div>	
        </div>
        <div class="hamNavibar" style="right: -1903px;">
            <div class="inner-box">
                <div class="menu-wr">
                    <ul class="Mmain_menu">
                        <li class="item-has-children" style="top: 50px; opacity: 0;">
                            <a href="FreeBoardlist">공지사항</a>
                        </li>
                        <li class="item-has-children" style="top: 50px; opacity: 0;">
                            <a href="rts">실시간 현황</a>
                        </li>
                        <li class="item-has-children" style="top: 50px; opacity: 0;">
                            <a href="relocation">재배치 분석</a>
                        </li>
                    </ul>
                    
	                <div class="hamNavi-bottom-wr">
	                    <a href="#" class="hammenu-brochure">
	                        빅데이터 플랫폼(Java, Spring)
	                    </a>
	                    <div class="HamBottom">
	                        <p>kjy3309@gmail.com</p>
	                        <p>010-9263-3309</p>
	                    </div>
	                </div>

                </div>
            </div>
        </div>
    </div>
    <!-- //header -->
    
	<div class="list-group" id = listgroup >
	  <a href="FreeBoardlist" class="list-group-item list-group-item-action active">자유 게시판</a>
	  <a href="NoticeBoardlist" class="list-group-item list-group-item-action">공지 게시판</a>
	</div>
   <!-- 테이블 -->	
	<div style = float: left; width: 85%; >
	<table class="table table-hover table-bordered" id="boardlist">
	  <thead class="thead-dark">
	    <tr>
	      <th scope="col" style = width:7%;>번호</th>
	      <th scope="col" style = width:50%;>제목</th>
	      <th scope="col" style = width:10%;>작성자</th>
	      <th scope="col" style = width:20%;>작성일</th>
	      <th scope="col" style = width:10%;>조회수</th>
	    </tr>
	  </thead>
		<tbody style="background: #fff;">
			<c:forEach items = "${FreeBoardlist}" var = "bbs">
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
  </div>
  <table>
  		<button id = "drbtn" type="button" class="btn btn-dark" onclick = "location.href='FreeBoardwriteForm'">글쓰기</button>
  </table>
  <!-- 테이블 끝-->
    <!-- Optional JavaScript; choose one of the two! -->
		<nav aria-label="Page navigation example" id = navilist>
		  <ul class="pagination">
		    <li class="page-item"><a class="page-link" href="#">이전</a></li>
		    <li class="page-item"><a class="page-link" href="#">1</a></li>
		    <li class="page-item"><a class="page-link" href="#">2</a></li>
		    <li class="page-item"><a class="page-link" href="#">3</a></li>
		    <li class="page-item"><a class="page-link" href="#">다음</a></li>
		  </ul>
		</nav>
    <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
    <!-- <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script> -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>

    <!-- Option 2: jQuery, Popper.js, and Bootstrap JS
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
    -->
    <script>
	    var swiper = new Swiper('.swiper-container-mainvisual', {
	        
	        pagination: {
	            el: '.swiper-pagination',
	            clickable: true,
	        },
	        navigation: {
	            nextEl: '.vs-swiper-button-next',
	            prevEl: '.vs-swiper-button-prev',
	        },
	        on: {
	            slideChangeTransitionStart: function(){
	            $('.stit').css({opacity:0, top:'-30px'});
	            $('.tit').css({opacity:0, left:'-30px'});
	            $('.gomore').css({opacity:0, marginTop:'-0px'});
	            },
	            slideChangeTransitionEnd: function(){
	            $('.img-wr').delay(300).animate({opacity:1},500);
	            $('.stit').stop()
	            $('.tit').stop()
	            $('.gomore').stop()
	            $('.stit').delay(300).animate({opacity:1, top:0},500);
	            $('.tit').delay(650).animate({opacity:1, left:0},500);
	            $('.gomore').delay(1000).animate({opacity:1, marginTop:'-30px'},500);
	
	            },
	        },
	
	        speed : 1500,
	        loop: true
	    });
	
	    var modal = document.getElementById('id01');
	    var modal1 = document.getElementById('id02');
	
	
	    function openModal(type){
	        if(type === 1){
	            modal.style.display = "block";
	        }else {
	            modal1.style.display = "block";
	        }
	    }
		</script>
    <div id="Footer">
        <ul class="Ft-list">
            <li><a href="#">Notice</a><span style="margin-left:20px; cursor:default;">·</span></li>
            <li><a href="#">Message</a></li>
        </ul>
        <p>서울특별시 금천구 가산디지털2로 , 구디아카데미<br>대표이사 : 정현승&nbsp;&nbsp;&nbsp;사업자등록번호 : 111-11-11111&nbsp;&nbsp;&nbsp;개인정보보호책임자 : 유가희<br>E-mail : kjy3309@gmail.com&nbsp;&nbsp;&nbsp;Tel : 010-1111-2222<br>Copyright ⓒ 2019 따릉이. All rights reserved</p>
    </div>
  </body>

</html>