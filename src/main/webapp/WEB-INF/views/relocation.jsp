<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width">
    
    <title>재배치분석</title>
    <link href="https://fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i'" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Abel" rel="stylesheet">
    
    <!-- css -->
    <link rel="stylesheet" href="resources/css/style.css">
    
    <!-- 웹 폰트 -->
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&subset=korean" rel="stylesheet">

    <style>
        /* reset */
        * {margin:0; padding:0; font-family: 'Lato';}
        li {list-style: none;}
        a {text-decoration: none;}
        
        /* 폰트 초기화 */
		.footer_infor a,
		.footer_infor p{
		  font-family: "Noto Sans KR", AppleSDGothicNeo-Regular, "Malgun Gothic",
		    "맑은 고딕", dotum, "돋움", sans-serif;
		  color: #222;
		  font-size: 13px;
		  line-height: 1.5;
		}
		
		/* 폰트 스타일 초기화 */
		em,
		address {
		  font-style: normal;
		}
		
		

        /* nav */
        #nav {position: fixed; left: 0; top: 0; width: 100%; background-color: rgba(255,255,255,0.3);}
		#nav h1 {float: left; color: #fff; font-size: 40px; padding: 5px 5px 5px 15px; font-family: 'Abel' }
		#nav .menu {float: right; padding-right: 10px; }
		#nav .menu li {display: inline; }
		#nav .menu li a {display: inline-block; padding: 20px 15px; color: #fff; font-weight: bold; font-family: 'Abel'; text-transform: capitalize;}
		#nav .menu li.active a {color: #111;}
		#nav .mNav {display: none; position: absolute; top: 7px; right: 10px; width: 65px; height: 45px; cursor: pointer;/*background-color: rgba(255,255,255,0.3);*/}
		
		/* icon-menu */
		.icon-wrap {padding-left: 10px;}
		.icon-wrap .icon, 
		.icon-wrap .icon:before, 
		.icon-wrap .icon:after {width: 45px; height: 4px; background: #fff;}
		.icon-wrap .icon {position: relative; margin-top:20px;}
		.icon-wrap .icon:before {content:'';position: absolute; left: 0; bottom: 10px; }
		.icon-wrap .icon:after {content:''; position: absolute; left: 0; top: 10px;}
		
		/* contents */
		#contents {text-align: center; color: #fff;}
		#contents > div {height: 100vh; line-height: 100vh;}
		#contents > div h2 {font-size: 90px; font-weight: 200; text-transform: uppercase;}
		#contents > div h2 strong {font-weight: 700; font-style: italic;}
		
		/* section */
		#section1 {background:radial-gradient(ellipse farthest-corner at center top, #cbf49a, #1ea623);}
		#section2 {background:radial-gradient(ellipse farthest-corner at center top, #f39264 0%, #f2606f 100%); }
		#section3 {background:radial-gradient(ellipse farthest-corner at center top, #ffee75, #ff8930);}
		#section4 {background:radial-gradient(ellipse farthest-corner at center bottom, #6beace, #2e9aa4);}
		#section5 {background:radial-gradient(ellipse farthest-corner at center bottom, #69d2fb 0%, #20438E 100%);}
		#section6 {background:radial-gradient(ellipse farthest-corner at center top, #6CEBCF 0%, #38a7aa 100%);}
    </style>
</head>
<body>
    <nav id="nav">
        <a href="./"><h1>따릉이를 부탁해</h1></a>
        <div class="mNav">
            <div class="icon-wrap">
                <div class="icon"></div>
            </div>
        </div>

        <ul class="menu">
            <li class="active"><a href="#section1">시간대 분석</a></li>
            <li><a href="#section2">대여소 분석</a></li>
            <li><a href="#section3">대여소 분석</a></li>
            <li><a href="#section4">대여소 분석</a></li>
            <li><a href="#section5">재배치 제안</a></li>
        </ul>   
    </nav>

    <div id="contents">
        <div id="section1"><h2><strong>시간대 분석</strong></h2></div>
        <div id="section2"><h2><strong>대여소 분석</strong></h2></div>
        <div id="section3"><h2><strong>대여소 분석</strong></h2></div>
        <div id="section4"><h2><strong></strong> 대여소 분석</h2></div>
        <div id="section5"><h2><strong></strong> 재배치 제안</h2></div>
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
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <script>
        var nav = $("#nav ul li");
        var cont = $("#contents > div");

        nav.click(function(e){
            e.preventDefault();
            var target = $(this);
            var index = target.index();
            //alert(index);
            var section = cont.eq(index);
            var offset = section.offset().top;
            $("html,body").animate({ scrollTop:offset },600,"easeInOutExpo");
        });

        $(window).scroll(function(){
            var wScroll = $(this).scrollTop();
            
            if(wScroll >= cont.eq(0).offset().top){
                nav.removeClass("active");
                nav.eq(0).addClass("active");
            }
            if(wScroll >= cont.eq(1).offset().top){
                nav.removeClass("active");
                nav.eq(1).addClass("active");
            }
            if(wScroll >= cont.eq(2).offset().top){
                nav.removeClass("active");
                nav.eq(2).addClass("active");
            }
            if(wScroll >= cont.eq(3).offset().top){
                nav.removeClass("active");
                nav.eq(3).addClass("active");
            }
            if(wScroll >= cont.eq(4).offset().top){
                nav.removeClass("active");
                nav.eq(4).addClass("active");
            }
        });
        
        $(".mNav").click(function(){
            //$(".menu").css("display","block");
            //$(".menu").show();
            //$(".menu").fadeIn();
            //$(".menu").slideDown();
            $(".menu").toggle();
            //$(".menu").fadeToggle();
            //$(".menu").slideToggle();
        });

        $(window).resize(function(){
            var wWidth = $(window).width();
            //화면 크기가 960 이상일 때 style="display:none" 삭제
            if(wWidth > 960 && $(".menu").is(":hidden") ){
                $(".menu").removeAttr("style");
            }
        });
    </script>
</body>
</html>