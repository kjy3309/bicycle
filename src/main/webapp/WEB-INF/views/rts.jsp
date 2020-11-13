<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=0,maximum-scale=10,user-scalable=yes">
    
    <title>따릉이를 부탁해</title>
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
    
    <style>
    	/* 실시간 현황 */
		.new {padding-bottom: 30px; position: relative;}
		.new .new_top {position: relative; height: 800px; background-size: cover; margin-bottom: 30px;}
		.new .new_bottom {display: none; position: relative;  height: 100%; padding-top: 150px;}
		.new .new_bottom .br_name {font-size: 40px;}
		.new .new_bottom .parkingBikeTotCnt {font-size: 40px;}
		
		
		/* input style */
		input {background-image: none;}
		input[type=button],
		input[type=reset],
		input[type=text],
		input[type=password],
		input[type=submit],
		input[type=search],
		input[type=tel],
		input[type=email] {
		    -webkit-appearance: none;
		    border-radius: 0
		}
		input[type=search]::-webkit-search-cancel-button,
		input[type=search]::-webkit-search-decoration {
		    -webkit-appearance: none
		}
		input:checked[type=checkbox] {
		    background-color: #666;
		    -webkit-appearance: checkbox
		}

		/* 셀렉트 메뉴 메인 스타일 */
		.ui_select2 {
		    width: 150px;
		    height: 55px;
		    box-sizing: border-box;
		    padding: 10px 15px;
		    background: transparent;
		    color: #fff;
		    display: inline-block;
		    border-radius: 4px;
		    margin-left: 10px;
		    font-family: inherit;
		    font-size: inherit;
		    vertical-align: middle;
		    text-align: left;
		    white-space: nowrap;
		    background: #2c2f34 url(resources/image/down.svg) no-repeat right 10px center;
		    background-size: 10px;
		    -webkit-appearance: none;
		    -moz-appearance: none;
		    appearance: none;
		}
		
		/* iframe display */
		#real_iframe{
			display: none;
		}
    </style>
    
    <!-- 웹 폰트 -->
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&subset=korean" rel="stylesheet">
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
    </div>
    <!-- //header -->
    
	<div id="sub-Wrap">
		<div class="container_wr" style="display:block; top:0;left:0; width:100%; height:100%; background: url(&quot;resources/image/bg01.png&quot;) no-repeat top/100% auto; z-index:-1;">
			<div id="sub-Visual" class="sub-visual" style="height: 250px;">
				<div class="inner-box cen1400">
					<div class="subtitle-box">
						<h3 id="contents-tit">
							<span class="line"></span>
							<span title="CONTACT">Real-time Status</span>
						</h3>
						<p id="contents-stit">
							공공자전거 실시간 현황 & 대여 예측 분석
						</p>
					</div>
				</div>
			</div>
			
			<div class="cen1400" style="position:relative;">
				<!-- <!-- <p class="contact-text" style="text-align: right;"><span class="main-color">대여소</span>를 선택해주세요.</p> --> -->
				<div class="new">
				
					<div class="new_top">
						<div id="map" style="width:1400px;height:-webkit-fill-available; border: 5px solid #ebc166;"></div>
					</div>
					
					<div class="new_bottom">
						<div class="search1">
							<p id="contents-stit" style="font-size:35px; text-align:center; margin-bottom: 100px;">
								선택하신 <span class="main-color br_name"></span> 대여소에는 현재 <span class="main-color parkingBikeTotCnt"></span> 대의 따릉이가 대여 가능하네요!
							</p>
							
							<p class="contact-text" style="text-align: center;">
								대여소에 도착했을 때 따릉이가 없어 빌리지 못했던 적이 있으신가요? <br><br>
								따릉이를 부탁해는 최근 2주 반납 및 대여 데이터를 분석하여 시간별 대여소의 잔여 따릉이 갯수를 예측해드립니다. <br><br>
								원하는 시간대를 선택해주세요. (10분 간격 선택 가능)
							</p>
							<div class="form-group col-xs-12" style="text-align: center; margin-top: 100px;">
								<select id="hour" name="hour" class="ui_select2">
									<option value="06">오전 6시</option>
									<option value="07">오전 7시</option>
									<option value="08">오전 8시</option>
									<option value="09">오전 9시</option>
									<option value="10">오전 10시</option>
									<option value="11">오전 11시</option>
									<option value="12">오전 12시</option>
									<option value="13">오후 1시</option>
									<option value="14">오후 2시</option>
									<option value="15">오후 3시</option>
									<option value="16">오후 4시</option>
									<option value="17">오후 5시</option>
									<option value="18">오후 6시</option>
									<option value="19">오후 7시</option>
									<option value="20">오후 8시</option>
									<option value="21">오후 9시</option>
								</select>

								<select id="min" name="min" class="ui_select2">
									<option value="00">0분</option>
									<option value="10">10분</option>
									<option value="20">20분</option>
									<option value="30">30분</option>
									<option value="40">40분</option>
									<option value="50">50분</option>
								</select>
							</div>
								
								
							<div class="sendBtn" style="text-align:center;">
								<div class="form-group col-xs-12">
									<button type="button" class="btn btn-success btn-lg btn-lg-custom" onclick="rdataSearch()">검색하기</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
				 
   				<iframe id="real_iframe" src="" width="50%" height="300px" ></iframe>
   				<button type="button" class="btn btn-success btn-lg btn-lg-custom" onclick="rGraph()">테스트버튼</button>
		</div>
	</div>



	<div id="Footer">
        <ul class="Ft-list">
            <li><a href="#">Notice</a><span style="margin-left:20px; cursor:default;">·</span></li>
            <li><a href="#">Message</a></li>
        </ul>
        <p>서울특별시 금천구 가산디지털2로 , 구디아카데미<br>대표이사 : 정현승&nbsp;&nbsp;&nbsp;사업자등록번호 : 111-11-11111&nbsp;&nbsp;&nbsp;개인정보보호책임자 : 유가희<br>E-mail : kjy3309@gmail.com&nbsp;&nbsp;&nbsp;Tel : 010-1111-2222<br>Copyright ⓒ 2019 따릉이. All rights reserved</p>
        <button type="button" id="top_btn">
    		<img src="resources/image/icon_sctbtn.png" alt="상단버튼">
	    </button>
	    <script>
	    $(function() {
	        $("#top_btn").on("click", function() {
	            $("html, body").animate({scrollTop:0}, '500');
	            return false;
	        });
	    });
	    </script>
    </div>


    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6ab62b1cf209eb782fab63d74ff76590"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6ab62b1cf209eb782fab63d74ff76590&libraries=LIBRARY"></script>
    <script>
	    var cont = $(".new_bottom");
		var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
		   center: new kakao.maps.LatLng(37.477923, 126.879088), //지도의 중심좌표.
		   level: 4 //지도의 레벨(확대, 축소 정도)
		  };
		
		var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
		
		// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
		function makeOverListener(map, marker, infowindow) {
		    return function() {
		        infowindow.open(map, marker);
		    };
		}

		// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
		function makeOutListener(infowindow) {
		    return function() {
		        infowindow.close();
		    };
		}
		
		/* 현승 추가 코드*/
		var br_idx;
		// 대여소정보를 그리는 함수....
		function makeRentalBikeStatus() {
		 	return function() {
		 		var id = this.id; // 대여소 idx 값 변수에 저장
		 		br_idx = this.id;
		 		realTimeBicycleStatus(id); // 대여소 명, 실시간 자전거 개수를 표시해주는 함수..
		 		
		    };
		}
		
		function realTimeBicycleStatus(id) {
			$.ajax({
				url:'rts/realTimeBicycleStatus',
				type:'GET',
				dataType:'JSON',
				data:{"id":id},
				success:function(d){
					var target = $(this);
			        var index = target.index();
			        var section = cont.eq(index);
			        var offset = section.offset().top;
			        $("html,body").animate({ scrollTop:offset },1000,"easeInOutExpo");
					$('.br_name').html(d.br_name);
					$('.parkingBikeTotCnt').html(d.parkingBikeTotCnt);
					console.log(d);
				},
				error:function(e){
					console.log(e);
				}
			});
			
	        
	        $('.new_bottom').fadeIn(4000);
		}
		
		function bicycleRental(){
			$.ajax({
				url:'rts/bicycleRental'
				,type:'GET'
				,dataType:'JSON'
				,success:function(rentalData){
					for (var i = 0; i < rentalData.length; i ++) {
					    // 마커를 생성합니다
					    var marker = new kakao.maps.Marker({
					        map: map, // 마커를 표시할 지도
					        position: new kakao.maps.LatLng(rentalData[i].letitude, rentalData[i].longitude), // 마커의 위치
					    });
						
					    marker.id = rentalData[i].br_idx // 대여소의 idx 값 저장...
					    
					    // 마커에 표시할 인포윈도우를 생성합니다 
					    var infowindow = new kakao.maps.InfoWindow({
					        content: rentalData[i].br_name // 인포윈도우에 표시할 내용
					    });
					    
					    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
					    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
					    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
					    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
					    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
					    kakao.maps.event.addListener(marker, 'click', makeRentalBikeStatus());
					}
				}
				,error:function(e){
					console.log(e)
				}
			});
		}
		
		bicycleRental();

        var modal = document.getElementById('id01');
        var modal1 = document.getElementById('id02');


        function openModal(type){
            if(type === 1){
                modal.style.display = "block";
            }else {
                modal1.style.display = "block";
            }
		}
		
		/*
		$('.btn').click(function(){
			$('.search1').fadeOut(500); // search1 결
		});
		*/
		
		function rdataSearch(){
			//var $br_name = $(".br_name").html();
			//console.log($br_name);
			var params = {};
			var hour = $("#hour").val();
			var min = $("#min").val();
			//console.log(min);
			var time = hour + ":"+min;
			if(min=="00"){
				hour = hour-1;
				himin ="59";
				if(hour<10){
					hour = "0"+hour;
				}
			}else{
				var himin = min-1;
				if(himin<10){
					himin ="0"+himin;
				}
			}
			var hidden = hour +":"+himin;
			//console.log(hour);
			//console.log(himin);
			params.time = time;
			params.br_idx = br_idx;
			params.hidden = hidden;
			//console.log(br_idx);
			//console.log(time);
			
			$.ajax({
                type:"get",
                url:"rdata",
                data:params,
                dataType:"JSON",
                success:function(d){
                   console.log(d);
                   real_iframe.style.display="block";
                   $('#real_iframe').attr("src","/rlnk/real_remain.html")
                   
                },error:function(e){
                    console.log(e);
                }
            });
			
		}
		
		
		function rGraph(){
			var hour = $("#hour").val();
			
			location.href="rGraph?br_idx="+br_idx+"&&hour="+hour;
		}
		
    </script>
</body>

</html>