


var msts=0;// 0-DT, 1-�е�, 2-�����
if($(window).width() > 470 && $(window).width() <= 770 ){msts=1;}//����ϻ��º�ȯ
if($(window).width()<=470){msts=2;}//����ϻ��º�ȯ

var mcwa=0;
if($(window).width() > 670 && $(window).width()<=1200 ){mcwa=1;}//����ϻ��º�ȯ
if($(window).width()<=670){mcwa=2;}//����ϻ��º�ȯ

$(function(){
	setTimeout(function(){
        $('html, body').scrollTop(0);
    }, 10);
	
	
	// �ε��� ani & css �ʱ⼳��

	if(mcwa===0){// 1200 ~ 1920
		// sub works ani
		$(".works-ani:eq(0)").delay(500).animate({"top":"0",opacity:1},1300);		
		$(".works-ani:eq(1)").delay(500).animate({"top":"-50",opacity:1},1300);		
		$(".works-ani:eq(2)").delay(500).animate({"top":"0",opacity:1},1300);			
	}// 1200 ~ 1920
	if(mcwa===1){// 670 ~ 1200
		// sub works ani
		$(".works-ani:eq(0)").delay(500).animate({"top":"0",opacity:1},1300);		
		$(".works-ani:eq(1)").delay(500).animate({"top":"50",opacity:1},1300);		
	}// 670 ~ 1200
	if(mcwa===2){// 0 ~ 670
		// sub works ani
		$(".works-ani:eq(0)").delay(500).animate({"top":"0",opacity:1},1300);		
	}// 0 ~ 670

	
	// sub title ani
	$(".subtitle-box").delay(0).animate({"bottom":"50",opacity:1},1300);

	// sub about ani
	$(".sa-ani").delay(500).animate({"top":"0",opacity:1},1100);
	
	// sub news ani
	$("#fboardlist").delay(500).animate({"top":"0",opacity:1},1100);
	
	// sub contact ani
	$(".contact-wrap").delay(500).animate({"top":"0",opacity:1},1100);

	
	
}); //jQ-reday


// ��ũ�� �ִϸ��̼� 
var scSt = 0	
$(window).scroll(function(event){
	var scTop = $(this).scrollTop();


	if(scTop > 0){
		// ���
		$("#Header").css({backgroundColor:"rgba(1,1,1,0.8)", height:"70px"});
		$(".hamWrap").css({top:"7.5px"});
		//ž��ư
		$("#top_btn").css({opacity:"1", bottom:"20px"},300);	
		
	}
	else{
		// ���
		$("#Header").css({backgroundColor:"rgba(1,1,1,0)", height:"110px"});
		$(".hamWrap").addClass('Fixed');
		//ž��ư
		$("#top_btn").css({opacity:"0", bottom:"120px"},300);
	}

	if(msts===0){// PC
		if(scTop < 250){
			//���κ��־�
			$(".pager_list li").css({top:"45px"});
		}else{
			//���κ��־�
			$(".pager_list li").css({top:"0px"});	
		}
	}
	if(msts===1){// �е�
		if(scTop < 100){
			//���κ��־�
			$(".pager_list li").css({top:"45px"});
		}else{
			//���κ��־�
			$(".pager_list li").css({top:"0px"});	
		}
	}
	if(msts===2){// �����
		if(scTop < 250){
		}else{
		}
	}


	
	if(mcwa===0){// 1200 ~ 1920
		if(scTop>250){
			// main works
			$(".ani:lt(3)").addClass("in-view");				
		}
		if(scTop>500){
			// sub works ani
			$(".works-ani:eq(3)").animate({"top":"0",opacity:1},1300);		
			$(".works-ani:eq(4)").animate({"top":"-50",opacity:1},1300);		
			$(".works-ani:eq(5)").animate({"top":"0",opacity:1},1300);		
		}
		if(scTop>850){
			// main works
			$(".ani:gt(2)").addClass("in-view");	
		}
		if(scTop>1300){
			// sub works ani
			$(".works-ani:eq(6)").animate({"top":"0",opacity:1},1300);		
			$(".works-ani:eq(7)").animate({"top":"-50",opacity:1},1300);		
			$(".works-ani:eq(8)").animate({"top":"0",opacity:1},1300);		
		}
		
		if(scTop>1700){			
			// main conts2
			$(".mc2-ani").addClass("in-view");		
			
		}
		
		if(scTop>2300){
			// main conts4
			$(".mc3-ani").animate({opacity:1},600);		
			$(".mc3-ani li").animate({"top":"0",opacity:1},600);		
		}
		
		if(scTop>3000){
			// main conts3
			$(".mc4-ani01").animate({"top":"0",opacity:1},600);		
			$(".mc4-ani02").delay(300).animate({"top":"0",opacity:1},600);		
			$(".mc4-ani03").delay(600).animate({"top":"0",opacity:1},600);		
		}		
	}// 1200 ~ 1920
	if(mcwa===1){// 670 ~ 1200
		if(scTop>200){
			// sub works ani
			$(".works-ani:eq(2)").animate({"top":"0",opacity:1},1300);		
			$(".works-ani:eq(3)").animate({"top":"50",opacity:1},1300);	
		}
		if(scTop>350){
			// main works
			$(".ani").eq(0).addClass("in-view");		
			$(".ani").eq(1).addClass("in-view");	
		}
		if(scTop>750){
			// main works
			$(".ani").eq(2).addClass("in-view");		
			$(".ani").eq(3).addClass("in-view");		
		}
		if(scTop>800){
			// sub works ani
			$(".works-ani:eq(4)").animate({"top":"0",opacity:1},1300);		
			$(".works-ani:eq(5)").animate({"top":"50",opacity:1},1300);	
		}
		if(scTop>1150){
			// main works
			$(".ani").eq(4).addClass("in-view");		
			$(".ani").eq(5).addClass("in-view");		
		}
		
		if(scTop>1400){
			// sub works ani
			$(".works-ani:eq(6)").animate({"top":"0",opacity:1},1300);		
			$(".works-ani:eq(7)").animate({"top":"50",opacity:1},1300);	
		}
		
		if(scTop>1900){
			// main conts2
			$(".mc2-ani").addClass("in-view");		
		}
		
		if(scTop>2000){
			// sub works ani
			$(".works-ani:eq(8)").animate({"top":"0",opacity:1},1300);		
			$(".works-ani:eq(9)").animate({"top":"50",opacity:1},1300);	
		}
		if(scTop>2600){
			// main conts4
			$(".mc3-ani").animate({opacity:1},600);		
			$(".mc3-ani li").animate({"top":"0",opacity:1},600);		
		}
		
		if(scTop>3200){
			// main conts3
			$(".mc4-ani01").animate({"top":"0",opacity:1},600);		
			$(".mc4-ani02").delay(300).animate({"top":"0",opacity:1},600);		
			$(".mc4-ani03").delay(600).animate({"top":"0",opacity:1},600);				
		}
	}// 670 ~ 1200
	if(mcwa===2){// 0 ~ 670
		if(scTop>50){
			// main works
			$(".ani").eq(0).addClass("in-view");
		}
		if(scTop>350){
			// sub works ani
			$(".works-ani:eq(1)").animate({"top":"0",opacity:1},1300);			
		}
		if(scTop>550){
			// main works
			$(".ani").eq(1).addClass("in-view");
		}
		if(scTop>930){
			// sub works ani
			$(".works-ani:eq(2)").animate({"top":"0",opacity:1},1300);		
		}
		if(scTop>1100){
			// main works
			$(".ani").eq(2).addClass("in-view");	
		}
		if(scTop>1510){
			// sub works ani
			$(".works-ani:eq(3)").animate({"top":"0",opacity:1},1300);			
		}
		if(scTop>1600){
			// main works
			$(".ani").eq(3).addClass("in-view");
		}
		if(scTop>2090){
			// sub works ani
			$(".works-ani:eq(4)").animate({"top":"0",opacity:1},1300);			
		}
		if(scTop>2100){
			// main works
			$(".ani").eq(4).addClass("in-view");
		}
		if(scTop>2600){
			// main works
			$(".ani").eq(5).addClass("in-view");
		}
		
		if(scTop>2670){
			// sub works ani
			$(".works-ani:eq(5)").animate({"top":"0",opacity:1},1300);			
		}
		if(scTop>3250){
			// sub works ani
			$(".works-ani:eq(6)").animate({"top":"0",opacity:1},1300);			
		}
		if(scTop>3400){
			// main conts2
			$(".mc2-ani").addClass("in-view");		
		}
		if(scTop>3830){
			// sub works ani
			$(".works-ani:eq(7)").animate({"top":"0",opacity:1},1300);			
		}		
		if(scTop>3900){
			// main conts4
			$(".mc3-ani").animate({opacity:1},600);		
			$(".mc3-ani li").animate({"top":"0",opacity:1},600);		
		}
		if(scTop>4410){
			// sub works ani
			$(".works-ani:eq(8)").animate({"top":"0",opacity:1},1300);		
		}
		
		if(scTop>4900){
			// main conts3
			$(".mc4-ani01").animate({"top":"0",opacity:1},600);		
			$(".mc4-ani02").delay(300).animate({"top":"0",opacity:1},600);		
			$(".mc4-ani03").delay(600).animate({"top":"0",opacity:1},600);			
		}
	}// 0 ~ 670
	

});

