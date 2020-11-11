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
    <link rel="stylesheet" href="resources/css/boardStyle.css">

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
   		.write_button {
			right: 0;
		    position: absolute;
		    font-size: 16px;
		    top: 0;
   		}
   	</style>
  </head>
  <body>
    <div id="Header" style="background-color: rgba(1, 1, 1, 0); height: 90px;">
        <div class="logoWrap">
            <a href="./"><img src="resources/image/logo.png" alt="로고" title=""></a>
        </div>
        <c:if test="${empty sessionScope.loginId }">
        	<div class="login">
           		<button onclick="openModal(1)">Login</button>
	        </div>
        </c:if>
        
        <c:if test="${not empty sessionScope.loginId }">
        	<div class="login">
           		<button onclick="">${sessionScope.loginId} 님</button>
	        </div>
        </c:if>
        
        <div id="id01" class="modal">
            <div name="loginForm" class="modal-content animate" >            
                <div class="modal-container">
                	<dd>
	                    <label for="id"><b>아이디</b></label>
	                    <input type="text" placeholder="아이디를 입력해 주세요." id="loginId" name="id" required>
	                    <label for="pw"><b>패스워드</b></label>
	                    <input type="password" placeholder="패스워드를 입력해 주세요." id="loginPw" name="pw" required>
	                    <p class="msg dont"></p>
	                    <button class="modal-button login_button">로그인</button>
	                </dd>               
                </div>
                
                <div class="modal-container">
                    <button  type="button" onclick="document.getElementById('id01').style.display='none'" class="cancelbtn">취소</button>
                    <p class = "p33">회원이 아니시라면  <span style="text-decoration: underline; cursor: pointer;" onclick="openModal(2)">회원가입</span> 하세요. <p>
                </div>
            </div>
        </div>

        <div id="id02" class="modal">
            <div name="joinForm" class="modal-content animate">
                <div class="modal-container">
                    <label for="id"><b>아이디</b></label>
                    <dd>
	                    <input type="text" placeholder="아이디를 입력해 주세요." id="newId" name="id" required>
	                    <p class="msg">영문/숫자 4자 이상을 입력해 주세요.</p>
					</dd>
					
                    <label for="pw"><b>비밀번호</b></label>
                    <dd>
	                    <input type="password" placeholder="비밀번호를 입력해 주세요." id="newPw" name="pw" required>
	                    <p class="msg">8 ~ 20자의 영문 대/소문자, 숫자, 특수문자를 사용하세요.</p>
                    </dd>
                    
                    <label for="pwConfirm"><b>비밀번호 재확인</b></label>
                    <dd>
	                    <input type="password" placeholder="비밀번호를 다시한번 입력해 주세요." id="newPwConfirm" name="pw" required>
	                    <p class="msg"></p>
                    </dd>
                    
                    <label for="name"><b>이름</b></label>
                    <dd>
                    	<input type="text" placeholder="이름을 입력해 주세요." id="newName" name="name" required>
                    	<p class="msg">이름을 입력해주세요.</p>
                    </dd>
                    
                    <label for="birth"><b>생년월일</b></label>
                    <dd class="date">
                 		<select name="year" id="year" style="width:39.3%">
                 		</select>
                 		<select name="month" id="month" style="width:30%">
                 		</select>
                 		<select name="day" id="day" style="width:30%">
                 		</select>
                 		<p class="msg"></p>
                    </dd>
                    
                    <label for="gender"><b>성별</b></label>
				    <dd class="two_selector">
				        <label class="selector"><input type="radio" name="gender" value="M"><span>남자</span></label>
				        <label class="selector"><input type="radio" name="gender" value="F"><span>여자</span></label>
				        <p class="msg"></p>
				    </dd>
				    
                    
                    <label for="email"><b>이메일</b></label>
                    <dd>
	                    <input type="text" placeholder="이메일을 입력해 주세요." name="email" id="email" required>
	                    <p class="msg">이메일을 입력해주세요.</p>
	                    <button class="btn_send_mail" style="display: none;">인증메일 전송하기</button>
	                    <div class="auth_mail_box" style="display: none">
				            <div class="input">
				                <input id="certCode" type="text" class="number" maxlength="6" oninput="maxLengthCheck(this)" placeholder="인증번호">
				            </div>
				            <input type="button" class="btn_mail_auth" value="확인"> 
				        </div>
				        <p class="msg "></p>
                    </dd>
                    
                    <button class="regist_button modal-button">회원가입</button>
                    <form name="complete" action="./" method="get" target="_self"></form>
                </div>

                <div class="modal-container">
                    <button type="button" onclick="document.getElementById('id02').style.display='none'" class="cancelbtn">취소</button>
                </div>
            </div>
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
    <div class="sub_visual" style="background-image:url(resources/image/sv_notice.png);">
		<dl>
			<dt>Event &amp; News</dt>
			<dd><img src="../images/home_icon.png" alt="" /><span>/</span>Event &amp; News<span>/</span>뉴스 &amp; 공지</dd>
		</dl>
	</div>

	<div class="sub_p_nav">
		<ul class="page_nav nav_sec2">
			<li>
				<a href="boardList?category=0&&page=1" class="active_p_nav">뉴스 &amp; 공지</a>
			</li>
			<li>
				<a href="boardList?category=1&&page=1" >자유게시판</a>
			</li>
		</ul>
	</div>
    
    <div class="container">
		<dl class="sub_title">
			<dt>News &amp; Notice</dt>
			<dd>따릉이를 부탁해의 새로운 소식과 공지사항을 확인해주세요.</dd>
		</dl>
	
		<div class="bbs_list">
			<div class="bbs_top">
				<p class="total">총 16건</p>
				<form name="formSearch" action="notice_list.asp#container">
					<div class="write_button">
						<button style="background: #fff; padding: 16px;">글쓰기</button>
					</div>
				</form>
			</div>
			<div class="list_table bd_b">
				<table summary="공지사항 리스트">
					<caption>공지사항 리스트입니다.</caption>
					<colgroup>
						<col style="width:7%"/>
						<col style="width:10%"/>
						<col />
						<col style="width:15%"/>
					</colgroup>
					<tbody>
						<c:forEach items = "${boardList}" var = "bbs">	
							<tr>
								<td>${bbs.b_idx}</td>
								<td class="td_left">
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
			<div class="paging">
				
				<c:if test="${currPage ne 1}">
					<a href="boardList?category=${category }&&page=1" class="page_btn"><img src="resources/image/page_first.png" title="더 이상 페이지가 없습니다." /></a>
					<a href="boardList?category=${category }&&page=${currPage-1 }" class="page_btn"><img src="resources/image/page_prev.png" title="더 이상 페이지가 없습니다." /></a>
				</c:if>
				<p class="page_num"><strong>${currPage}</strong>
				<c:if test="${currPage ne endPage}">
					</p><a href="boardList?category=${category }&&page=${currPage+1 }" class="page_btn"><img src="resources/image/page_next.png" title="다음으로" /></a>
					<a href="boardList?category=${category }&&page=${endPage }" class="page_btn"><img src="resources/image/page_last.png" title="마지막으로" /></a>
				</c:if>
				
			</div>
		</div>
	</div>

    <div id="Footer">
        <ul class="Ft-list">
            <li><a href="#">Notice</a><span style="margin-left:20px; cursor:default;">·</span></li>
            <li><a href="#">Message</a></li>
        </ul>
        <p>서울특별시 금천구 가산디지털2로 , 구디아카데미<br>대표이사 : 정현승&nbsp;&nbsp;&nbsp;사업자등록번호 : 111-11-11111&nbsp;&nbsp;&nbsp;개인정보보호책임자 : 유가희<br>E-mail : kjy3309@gmail.com&nbsp;&nbsp;&nbsp;Tel : 010-1111-2222<br>Copyright ⓒ 2019 따릉이. All rights reserved</p>
    </div>
  </body>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
  <script>
	  var modal = document.getElementById('id01');
	  var modal1 = document.getElementById('id02');
	
	
	  function openModal(type){
	      if(type === 1){
	          modal.style.display = "block";
	      }else {
	          modal1.style.display = "block";
	      }
	  }
	  
	  var today = new Date();
	  var toyear = parseInt(today.getFullYear ());
	  var start = toyear;
	  var end = toyear - 60;

	  $('#year').append("<option selected>년도</option>");
	  for (i=start;i>=end;i--) $('#year').append("<option value="+i+">"+i+"</option>");

	  $('#month').append("<option selected>월</option>");
	  for (i=1;i<=12;i++) $('#month').append("<option value="+i+">"+i+"</option>");

	  $('#day').append("<option selected>일</option>");
	  for (i=1;i<=31;i++) $('#day').append("<option value="+i+">"+i+"</option>");

	  function maxLengthCheck(object){
	      if (object.value.length > object.maxLength){
	        //object.maxLength : 매게변수 오브젝트의 maxlength 속성 값입니다.
	        object.value = object.value.slice(0, object.maxLength);
	      }    
	  }
	  
	  var currPage = ${currPage};
	  var endPage = ${endPage};
	  
	  if(currPage==1){
	     document.getElementById("prevPage").style.display="none";
	  }
	  if(currPage >1 && currPage < endPage){
	     document.getElementById("prevPage").style.display="inline";
	     document.getElementById("nextPage").style.display="inline";
	  }
	  
	  if(currPage == endPage){
	     document.getElementById("nextPage").style.display="none";
	  }    
  </script>
  <script src="resources/js/passcheck.js"></script>
  <script src="resources/js/join.js"></script>
</html>