<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=0,maximum-scale=10,user-scalable=yes">

    <title>따릉이를 부탁해</title>
    <link rel="stylesheet" href="resources/css/default.css">
    <link rel="stylesheet" href="resources/css/style.css">

    <script src="resources/js/jquery-1.8.3.min.js"></script>
    <script src="resources/js/jquery.menu.js"></script>
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
    <script src="resources/js/jquery.easing.1.3.js"></script>
    <link rel="stylesheet" href="resources/css/main.css">
    <link rel="stylesheet" href="resources/css/swiper.css">
    <link rel="stylesheet" href="resources/css/swiper.min.css">
    <link rel="stylesheet" href="resources/css/font-awesome.min.css">
</head>
<body>
    <div id="Header" style="background-color: rgba(1, 1, 1, 0); height: 110px;">
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
                            <a href="FreeBoardlist?category=1">공지사항</a>
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
        <!-- 뭐하는건지 잘 모르겠음.. -->
        <!-- <span id="Logo" style="display:none;">
            <a href="/index.php"><img src="/images/logo.png" alt="로고"></a>
        </span>
        <div class="hamWrap2" style="display:none;">
            <div id="ham" class="ham ham2">
                <span></span>
                <span></span>
                <span></span>
            </div>
        </div> -->
    </div>

    <!-- 메인페이지 -->
    <!-- 메인콘텐츠 시작 { -->
        
    <div id="Wrap">
        <div class="container_wr">
            <div id="Visual" class="swiper-container-mainvisual lt_bn swiper-container-initialized swiper-container-horizontal">
                <div class="inner-box swiper-wrapper" style="transition-duration: 0ms; transform: translate3d(-3806px, 0px, 0px);">
                        <div class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="2" style="width: 1903px;"></div>
                        <!-- <div class="img-wr" id="img-wr04" style="opacity: 1;"></div>                                                          -->

                        <div class="swiper-slide swiper-slide-prev" data-swiper-slide-index="0" style="width: 1903px;">
                            <div class="img-wr" style="background: url(&quot;resources/image/main2.jpg&quot;) center center / cover no-repeat; opacity: 0.7;"></div>
                            <div class="text-wr">
                                <p class="stit" style="opacity: 1; top: 0px;"># 따릉이 # 공공 자전거</p>
                                <p class="tit" style="opacity: 1; left: 0px;">자전거와 함께<br>발전하는 녹색도시</p>
                            </div>
                        </div>

                        <div class="swiper-slide swiper-slide-active" data-swiper-slide-index="1" style="width: 1903px;">
                            <div class="img-wr" id="img-wr01" style="background: url(&quot;resources/image/main1.jpg&quot;) center center / cover no-repeat;"></div>
                            <div class="text-wr">
                                <p class="stit" style="opacity: 1; top: 0px;"># 실시간현황 # 대여예측</p>
                                <p class="tit" style="opacity: 1; left: 0px;">빅데이터 기반<br>공공자전거 대여 예측 서비스</p>
                                <a href="rts" class="gomore" style="opacity: 1; margin-top: -30px;">
                                    더 알아보기
                                    <span class="line"><span class="arrow"></span></span>
                                </a>
                            </div>
                        </div>

                        <div class="swiper-slide swiper-slide-next" data-swiper-slide-index="2" style="width: 1903px;">
                            <div class="img-wr" id="img-wr02" style="background: url(&quot;resources/image/main4.jpg&quot;) center center / cover no-repeat;"></div>
                            <div class="text-wr">
                                <p class="stit" style="opacity: 1; top: 0px;"># 재배치분석</p>
                                <p class="tit" style="opacity: 1; left: 0px;">공공데이터 기반<br>공공자전거 재배치분석 제안</p>
                                <a href="relocation" class="gomore" style="opacity: 1; margin-top: -30px;">
                                    더 알아보기
                                    <span class="line"><span class="arrow"></span></span>
                                </a>
                            </div>
                        </div>

                        <div class="swiper-slide swiper-slide-duplicate swiper-slide-duplicate-prev" data-swiper-slide-index="0" style="width: 1903px;">
                            <div class="img-wr" style="background: url(&quot;/images/posco.jpg&quot;) center center / cover no-repeat; opacity: 1;"></div>

                            </div>
                        </div>
                
                    <div class="swiper-button-next vs-swiper-button-next swiper-button-white hidden770" tabindex="0" role="button" aria-label="Next slide"></div>
                    <div class="swiper-button-prev vs-swiper-button-prev swiper-button-white hidden770" tabindex="0" role="button" aria-label="Previous slide"></div>
                    
            <span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
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
</html>
