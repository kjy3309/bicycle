$(window).load(function(){
	$('.loading-wrap').delay(700).fadeOut(200);
	setTimeout(function() {
//		alert('Works!')
	}, 3000);
});

var mcsa=0;// Main Contents3 Service Action 1-모바일, 0-DT
if($(window).width()<=980){mcsa=1;}//모바일상태변환


var pcmo=0;// Main Contents3 Service Action 1-모바일, 0-DT
if($(window).width()<=768){pcmo=1;}//모바일상태변환

$(function(){

	// 마우스 아이콘 클릭시 스크롤 애니메이션
	$('a.scroll-link').click(function(e){
		e.preventDefault();
		$id = $(this).attr('href');
		$('body,html').animate({
			scrollTop: $($id).offset().top
		}, 750);
	});

	// Main Contents3 Service Action
	if(mcsa===0){// pc
		$(".cont3-li")
			.css({transition:"width .3s ease-out",  cursor: "pointer"})

			.click(function(){
				$(this).css({width: "50%"})
				.siblings().css({width: "25%"});

				$(".hoverAction").css({opacity:"0", right: "-170px"});
				$(this).find(".hoverAction").css({opacity: "1", right:"10px"});
		});

	}// pc

	if(mcsa===1){
	}


	if(pcmo===0){// 768 ~ 1920
		
		$(".pic_lt li a")
			.mouseenter(function(){
				$(this).children('.latest_cover').css({opacity: 1});
		}); // li mouseenter
		$(".pic_lt li a")
			.mouseleave(function(){
				$(this).children('.latest_cover').css({opacity: 0});
		}); // li mouseenter
		
	}// 768 ~ 1920
	if(pcmo===1){// 0 ~ 768
		$('.latest_cover').css({display: 'none'});
	}// 0 ~ 768




		
});

