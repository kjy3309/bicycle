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
	<script>
		var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
			center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
			level: 3 //지도의 레벨(확대, 축소 정도)
		};
	
		var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
	</script>
</body>

</html>