<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    
    <!-- css -->
    <link rel="stylesheet" href="resources/css/reset.css">
    <link rel="stylesheet" href="resources/css/style.css">
    
    <style>
    	/* 실시간 현황 */
		.new {padding: 100px 0; position: relative;}
		.new h2 {font-size: 30px; font-weight: 500; margin-bottom: 20px;}
		.new .new_left {position: relative; margin-right: 423px; height: 500px; background-size: cover;}
		.new .new_right {position: absolute; right: 0; top: 165px; width: 400px; height: 500px; padding: 34px; box-sizing: border-box; background: #f0f0f0;}
		.new .new_right .br_name {font-size: 28px; color: #000;}
		.new .new_right .available {font-size: 12px; color: #333;}
		.new .new_right .parkingBikeTotCnt {font-size: 14px; color: deeppink; text-decoration: underline; text-shadow: #2c2f34;}
		
		.new .new_right .summary {font-size: 14px;}
		.new .new_right .genre {padding-bottom: 3px;}
		.new .new_right .age {padding-bottom: 10px;}
		.new .new_right .desc {margin-bottom: 20px; height: 108px; overflow: hidden;}
		
		.new .new_right .select {overflow: hidden;}
		.new .new_right .select .s1 {float: left; width: 49%; background: #000; margin-right: 2%;}
		.new .new_right .select .s2 {float: left; width: 49%; background: #000;}
		.new .new_right .select .s3 {float: left; width: 100%; margin-top: 2%;}
		.new .new_right .btn {overflow: hidden; margin-top: 2%; text-align: center;}
		.new .new_right .btn a {float: left; width: 49%; box-sizing: border-box; display: block; padding: 10px 30px 12px 30px;}
		.new .new_right .btn a.white {background-color: #fff; margin-right: 2%; color: #3a0e6a; border: 1px solid #3a0e6a;}
		.new .new_right .btn a.purple {background-color: #3a0e6a; color: #fff; border: 1px solid #6e40c4;}
		
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
		    width: 100%; box-sizing: border-box;
		    background: #2c2f34; color: #fff;
		    display: inline-block; height: 36px;
		    border: 0 none; padding: 0 10px; margin: 0;
		    font-family: inherit; font-size: inherit;
		    vertical-align: middle; text-align: left;
		    white-space: nowrap;
		    background: #2c2f34 url(resources/image/down.svg) no-repeat right 10px center;
		    background-size: 10px;
		    -webkit-appearance: none;
		    -moz-appearance: none;
		    appearance: none;
		}
		
		/* 메인 텍스트 박스 스타일1 */
		.ui_input3 {
		    background: #2c2f34; color: #fff; border: 0; width: 100%; height: 36px; padding: 0 10px; cursor: pointer;
		}
    </style>
    
    <!-- 웹 폰트 -->
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&subset=korean" rel="stylesheet">
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
                            <li><a href="#">Notice</a></li>
                            <li><button>Login</button></li>
                        </ul>
                    </nav>    
                </div>
            </div>
        </div>
    </header>
    <!-- //header -->
	
	<div class="container">
		<div class="row">
			<div class="new">
				<h2>실시간 현황</h2>
				<div class="new_left">
					<div id="map" style="width:-webkit-fill-available;height:-webkit-fill-available;"></div>
				</div>
				<div class="new_right">
					<h3 class="br_name">대여소 이름</h3>
					<li class="available">현재 대여 가능한 따릉이 : <span class="parkingBikeTotCnt"></span> 대</li>
					
					<div class="select">
						<li class="ts-comment">빌릴 수 있는 따릉이의 갯수를 예측해서 알려드려요. </li>
						<li>시간대를 선택하세요.</li>
						<div class="s1">
							<select id="hour" name="hour" class="ui_select2">
								<option value="6">오전 6시</option>
								<option value="7">오전 7시</option>
								<option value="8">오전 8시</option>
								<option value="9">오전 9시</option>
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
						</div>
						<div class="s2">
							<select id="min" name="min" class="ui_select2">
								<option value="0">0분</option>
								<option value="10">10분</option>
								<option value="20">20분</option>
								<option value="30">30분</option>
								<option value="40">40분</option>
								<option value="50">50분</option>
							</select>
						</div>
						<div class="s3">
							<input type="button" id="utext" name="utext" class="ui_input3" value="검색하기">
						</div>
					</div>
					
					<ul class="summary">
						<li class="desc">잔여량 추이 영역</li>
					</ul>
					
				</div>
			</div>
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


    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6ab62b1cf209eb782fab63d74ff76590"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6ab62b1cf209eb782fab63d74ff76590&libraries=LIBRARY"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script>
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
		
		// 대여소정보를 그리는 함수....
		function makeRentalBikeStatus() {
		 	return function() {
		 		var id = this.id; // 대여소 idx 값 변수에 저장
		 		realTimeBicycleStatus(id); // 대여소 명, 실시간 자전거 개수를 표시해주는 함수..
		 		
		    };
		}
		
		function realTimeBicycleStatus(id) {
			$.ajax({
				url:'realTimeBicycleStatus',
				type:'GET',
				dataType:'JSON',
				data:{"id":id},
				success:function(d){
					console.log(d);
					$('.br_name').html(d.br_name);
					$('.parkingBikeTotCnt').html(d.parkingBikeTotCnt);
				},
				error:function(e){
					console.log(e);
				}
			});
		}
		
		function bicycleRental(){
			$.ajax({
				url:'bicycleRental'
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
    </script>
</body>

</html>