<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<html lang="en">
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

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    
      
    <title>Hello, world!</title>
		<style>
			table,th,td{
				border : 1px solid black;
				border-collapse: collapse;
				
			}
			#mainContent{
			width:90%;
			margin-top:5%;
	
   
			}
			#replContent{
			width:90%;
			margin-top:5%;
			margin-bottom:5%;
		
			}
			
			#detailpack{
			position:relative;
			left:7%;
			}
			
			#Header{
			background-color: gray;
			height:200px;
			}
			footer{
			background-color: gray;
			height:200px;
			margin-top:15%;
		     
			}
			#content{
			width:85%;
			}
			.b{
			    position: relative; 	  
			    padding: 15px;
			    width:10px;
			    
			}
			th.a{
			    position: relative; 	  
			    padding: 15px;
			    text-align:center;
			    height:50%;
			    background-color: lightgray;
			  
			}
			.replContent{
			width:60%;
			
			}
			.replTextArea{
			background-color: rgba(1,1,1,0.1);/*히히 이거 어떡하쥐  */
			}
		
			
		</style>
		<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
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
        
        <!--  -->
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

        

	<div class="container">
		<div id="detailpack">
		
		
			<table id="mainContent" >
				<input type="hidden" name="b_idx" value="${info.b_idx}"/>
				<tr>
					<th class="a" width="10%">작성자</th><td class="b">${info.id}</td>
					<th class="a" width="10%">조회수</th><td class="b">${info.bHit}</td>
				</tr>
				
				<tr><th class="a" width="10%">제목</th><td colspan="3">${info.subject}</td></tr>
				<tr><th class="a" width="10%">내용</th><td colspan="3">${info.content}	</td></tr>
			</table>
			
			<div>
				<a href = "boardList?category=${category}&&page=${page}">목록보기</a>
				<a href="boardDelete?idx=${info.b_idx}&&category=${category}&&page=${page}">삭제</a>
				<a href="boardUpdateForm?idx=${info.b_idx}&&category=${category}&&page=${page}">수정</a>
			</div>
			
			<table id="replContent" class="table table-striped table-bordered table-hover table-condensed"  >
				<tr>
					<td colspan="4">
						<input type="hidden" id="id" name="id" value="${session.loginId}"/><!-- sessionScope해가지고? 아니면 session값 가져와서..★★★바로고치기 -->
						<!--  <input type="hidden" id="id" name="id" value="${session.getid}"/><!-- 로그인할때 세션에 저장된 아이디 가져와서 넣는다.-->
						댓글:&nbsp;&nbsp;<input type="text" name="content" id="content" placeholder="댓글을 작성해주세요."/>
						<input type="button" id="re_btn" value="작성"  />
					</td>
				</tr>
				<tr>
					<th>아이디</th>
					<th class="replContent">내용</th>
					<th>날짜</th>
					<th colspan="2"></th>
				</tr>
				
				<c:forEach var ="repl" items="${repl_list}" >
					<tr>
						<td>${repl.id}</td>
						
						<td>
							<input type="text"  id="${repl.r_idx}" value="${repl.r_comment}" style="border:0px" readonly class="replTextArea"/> 
							<td id="repl_Oridate">${repl.r_reg_date}
						</td>
							
						<td>
							<input type="button" id="update${repl.r_idx}" value="수정"   onclick="replyUpdate1(${repl.r_idx})"/>
							<input type="button" id="confirm${repl.r_idx}" value="확인" style="display:none"    onclick="replyUpdate2(${repl.r_idx})" />
							<input type="button" id="re_delete" onclick="replyDelete(${repl.r_idx})" value="삭제" />
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
		<input type="hidden" id="category" value="${category}" />
		<input type="hidden" id="page" value="${page}" />
	
	<div id="Footer">
        <ul class="Ft-list">
            <li><a href="#">Notice</a><span style="margin-left:20px; cursor:default;">·</span></li>
            <li><a href="#">Message</a></li>
        </ul>
        <p>서울특별시 금천구 가산디지털2로 , 구디아카데미<br>대표이사 : 정현승&nbsp;&nbsp;&nbsp;사업자등록번호 : 111-11-11111&nbsp;&nbsp;&nbsp;개인정보보호책임자 : 유가희<br>E-mail : kjy3309@gmail.com&nbsp;&nbsp;&nbsp;Tel : 010-1111-2222<br>Copyright ⓒ 2019 따릉이. All rights reserved</p>
    </div>

</body>
<script>
	
		$("#re_btn").click(function(){
			var param ={};
			param.b_idx = ${info.b_idx};//이게되나?
			param.id = $("#id").val();
			param.content = $("#content").val();
			
			$.ajax({
		         type:'POST',
		         url:'reply',
		         data:param,
		         dataType:"JSON",
		         success:function(d){
		        	 console.log(d);
		        	 //alert("댓글 작성 완료");
		        	 location.href='boardDetail?idx='+${info.b_idx}+'&&category='+${category}+'&&page='+${page};
		        	 //listCall(); 
		        	
		         },
		         error:function(e){
		        	 console.log(e);
		        	 alert("댓글 작성 실패");
		         }
		      });
		})
				
	
		//댓글수정1
		 function replyUpdate1(idx){
			var upcomment = '#'+idx;
			var update = '#update'+idx;
			var confirm = '#confirm'+idx;
			//$("#real_repl").attr('readonly', false);
			/* $("#real_repl").css('display','none');
			$(upcomment).css('display', 'block'); */
			console.log($(upcomment));
			$(upcomment).attr('readonly', false);
			$(upcomment).css('border', '1px solid black');
			
			$(update).css('display','none');
			$(confirm).css('display','block');
			
		}
		 
		//댓글수정 완료2
		function replyUpdate2(idx){
			var upcomment = '#'+idx;
			var update = '#update'+idx;
			var confirm = '#confirm'+idx;
			
			var param ={};
			param.b_idx = ${info.b_idx};
			param.r_idx = idx;
			param.r_comment = $(upcomment).val();
			param.category = $("#category").val();
			param.page = $("#page").val();
			
			$.ajax({
		         type:'POST',
		         url:'replyUpdate',
		         data:param,
		         dataType:"JSON",
		         success:function(d){
		        	 console.log(d);
		        	 //alert("댓글 수정 완료");
		        	 location.href='boardDetail?idx='+${info.b_idx}+'&&category='+${category}+'&&page='+${page};

		         },
		         error:function(e){
		        	 console.log(e);
		        	 alert("댓글 수정 실패");
		         }
		      });
		}
		 
		//댓글삭제
		
		function replyDelete(rIdx){
			var param ={};
			param.b_idx = ${info.b_idx};
			param.r_idx = rIdx;
			
			$.ajax({
		         type:'GET',
		         url:'replyDelete',
		         data:param,
		         dataType:"JSON",
		         success:function(d){
		        	 console.log(d);
		        	 alert("댓글 삭제");
		        	 location.href='boardDetail?idx='+${info.b_idx}+'&&category='+${category}+'&&page='+${page};
		        	 

		         },
		         error:function(e){
		        	 console.log(e);
		        	 alert("댓글 삭제 실패");
		         }
		      });
		}
		
		
		
		
		
		
		
	
	
	
	
			
	//리스트띄우기- 필요없는 코드-----------------------------------
	function listCall(){
		
		var param ={};
		param.b_idx = ${info.b_idx};//이게되나?
		
		$.ajax({
			type:'GET',
			url:'boardDetail',
			data:param,
			dataType:'JSON',
			success:function(s){
				console.log('List성공했을까?');//원래는 여기로 와야되는데 안온단말이지.. 왜일까 왔다아! boolean값으로 반환했더니.
			},error:function(e){
				console.log(e);
			}
		});
	}
	
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
</html>