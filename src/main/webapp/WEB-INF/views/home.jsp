<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>따릉따릉</title>
    
        <!-- css -->
        <link rel="stylesheet" href="resources/css/reset.css">
        <link rel="stylesheet" href="resources/css/style.css">
        <link rel="stylesheet" href="resources/css/swiper.css">

        <!-- 웹 폰트 -->
        <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&subset=korean" rel="stylesheet">

        <!-- J-Query -->
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        
        <style>
        	/* Full-width input fields */
        	input[type="text"],
			input[type="password"] {
			  width: 100%;
			  padding: 12px 20px;
			  margin: 8px 0;
			  display: inline-block;
			  border: 1px solid #ccc;
			  box-sizing: border-box;
			}
        </style>
        
    </head>
    <body>
        
        <header id="header">
            <div class="container">
                <div class="row">
                    <div class="header clearfix">
                        <h1>
                            <a href="./">
                                <em><img src="resources/image/logo2.png" alt="logo"></em>
                            </a>    
                        </h1>
                        <nav class="nav">                            
                            <ul class="clearfix">
                                <li><a href="FreeBoardlist">Notice</a></li>
                                <li><button onclick="openModal(1)">Login</button></li>
                            </ul>
                        </nav>    
                    </div>
                </div>
            </div>
        </header>
        <!-- //header -->

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
                    <input type="text" placeholder="성별을입력해주세요." name="gender" required>
                    
                    <label for="email"><b>이메일</b></label>
                    <input type="text" placeholder="이메일을 입력해주세요." name="email" required>
                    
                    <button class="modal-button">회원가입</button>
                </div>

                <div class="modal-container">
                    <button type="button" onclick="document.getElementById('id02').style.display='none'" class="cancelbtn">취소</button>
                </div>
            </form>
        </div>

        
        <div class="slider">            
            <div class="swiper-container">
                <div class="swiper-wrapper">
                    <div class="swiper-slide ss1">
                        <div class="container">
                            <div class="row">
                                <h3>세상을 놀라게 하는 따릉이</h3>
                                <p>'저탄소 녹색 성장' 국가 주도 산업 실현 </p>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide ss2">
                        <div class="container">
                            <div class="row">
                                <h3>공공자전거 실시간 현황</h3>
                                <p>실시간 현황 및 자전거 대수 예측 서비스</p>
                                <li class="total"><a href="rts">더 알아보기</a></li>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide ss3">
                        <div class="container">
                            <div class="row">
                                <h3>공공자전거 재배치 분석</h3>
                                <p>빅데이터 기반 효율적 자전거 재배치 분석 제안 </p>
                                <li class="total"><a href="relocation">더 알아보기</a></li>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="swiper-pagination"></div>
                <div class="swiper-button-prev"></div>
                <div class="swiper-button-next"></div>
            </div>
        </div>
        

        <footer id="footer">
            <div id="footer_sns">
                <div class="container">

                </div>
            </div>
            <div id="footer_infor">
                <div class="container">
                    <div class="row">
                        <div class="footer_infor">
                            <h2><img src=""></h2>
                            <ul>
                                <li><a href="#">회사소개</a></li>                                
                                <li><a href="#">제휴/광고/부대사업 문의</a></li>
                                <li><a href="#">이용약관</a></li>
                                <li><a href="#">개인정보처리방침</a></li>
                                <li><a href="#">고객센터</a></li>
                                <li><a href="#">윤리경영</a></li>
                            </ul>
                            <address>
                                <p>서울특별시 금천구 가산대로 156, 8층 구디아카데미 (가산동, 대륭테크노타운)<br><span class="bar2">대표자명 정현승</span> 개인정보보호 책임자 경영지원실 실장 유가희<br><span class="bar2">사업자등록번호 111-11-1111111</span> 통신판매업신고번호 제 111호</p>
                                <p>Copyright 2014 by MegaboxJoongAng Inc. All right reserved</p>
                            </address>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <!-- //footer -->
        <!-- 자바스크립트 라이브러리 -->
        <script src="resources/js/jquery.min_1.12.4.js"></script>
        <script src="resources/js/modernizr-custom.js"></script>
        <script src="resources/js/swiper.min.js"></script>
        <script>
            var swiper = new Swiper('.swiper-container',{
                pagination: {
                    el: '.swiper-pagination',
                },
                navigation: {
                    nextEl: '.swiper-button-next',
                    prevEl: '.swiper-button-prev',
                },
                autoplay: {
                    delay: 5000,
                },
            });

            $(".hover").mouseleave(
            function () {
                $(this).removeClass("hover");
                }
            );
            
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
    </body>
</html>