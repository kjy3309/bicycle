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
        <link rel="stylesheet" href="./resources/css/reset.css">
        <link rel="stylesheet" href="./resources/css/style.css">
        <link rel="stylesheet" href="./resources/css/swiper.css">

        <!-- 웹 폰트 -->
        <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&subset=korean" rel="stylesheet">
        
    </head>
    <body>
        
        <header id="header">
            <div class="container">
                <div class="row">
                    <div class="header clearfix">
                        <h1>
                            <a href="#">
                                <h2><strong>이미지하나..필요</strong></h2>
                            </a>    
                        </h1>
                        <nav class="nav">                            
                            <ul class="clearfix">
                                <li><a href="#">Notice</a></li>
                                <li><a href="#">Login</a></li>
                            </ul>
                        </nav>    
                    </div>
                </div>
            </div>
        </header>
        <!-- //header -->
        
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
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide ss3">
                        <div class="container">
                            <div class="row">
                                <h3>공공자전거 재배치 분석</h3>
                                <p>빅데이터 기반 효율적 자전거 재배치 분석 제안 </p>
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
        <script src="../views/resources/js/jquery.min_1.12.4.js"></script>
        <script src="../views/resources/js/modernizr-custom.js"></script>
        <script src="../views/resources/js/swiper.min.js"></script>
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
        </script>
    </body>
</html>