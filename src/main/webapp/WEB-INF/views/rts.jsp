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
                            <li><button>Login</button></li>
                        </ul>
                    </nav>    
                </div>
            </div>
        </div>
    </header>
    <!-- //header -->
    <div id="map" style="width:500px;height:400px;"></div>

    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6ab62b1cf209eb782fab63d74ff76590"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=LIBRARY"></script>
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
		
		function bicycleRentalInfo(marker) {
			
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
					        position: new kakao.maps.LatLng(rentalData[i].letitude, rentalData[i].longitude) // 마커의 위치
					    });

					    // 마커에 표시할 인포윈도우를 생성합니다 
					    var infowindow = new kakao.maps.InfoWindow({
					        content: rentalData[i].br_name+rentalData[i].br_idx // 인포윈도우에 표시할 내용
					    });
					    
					    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
					    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
					    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
					    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
					    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
					    kakao.maps.event.addListener(marker, 'click', function(){
					    	infowindow.open(map, marker);
					    });
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