<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width">

    <title>Parallax</title>
    <link rel="stylesheet" href="resources/css/style.css">
    <link href="https://fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i'" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Abel" rel="stylesheet">

    <style>
        /* reset */
        * {margin:0; padding:0; font-family: 'Lato';}
        li {list-style: none;}
        a {text-decoration: none;}
    </style>
</head>
<body>
    <nav id="nav">
        <h1>따릉따릉</h1>
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