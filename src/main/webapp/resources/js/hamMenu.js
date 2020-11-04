$(function(){

	//  햄버거 메뉴  ////////////////////////////
	var hamWidth = $(".hamNavibar").width();
	var hamSt = 0;
	


	$(".ham").click(function(){
		if(hamSt===0){
			$("span",this).eq(0).animate({
				rotate:"45deg",
				top:"10px"
			},200);
			$("span",this).eq(1).animate({
				width:"0px",
				left:"16px"
			},200);
			$("span",this).eq(2).animate({
				rotate:"-45deg",
				top:"10px"
			},200);
			
			$(".hamNavibar").stop();
			
			if(mcwa===0){// 1200 ~ 1920
				$(".hamNavibar").animate({right:"0"},1500, 'easeOutCubic', function(){
					$(".item-has-children:nth-child(1)").delay(100).animate({
						top:0,
						opacity: 1,
					},700,'easeOutQuart');
					$(".item-has-children:nth-child(2)").delay(200).animate({
						top:0,
						opacity: 1,
					},700,'easeOutQuart');
					$(".item-has-children:nth-child(3)").delay(300).animate({
						top:0,
						opacity: 1,
					},700,'easeOutQuart');
					$(".item-has-children:nth-child(4)").delay(400).animate({
						top:0,
						opacity: 1,
					},700,'easeOutQuart');
				});	
			}// 1200 ~ 1920
			if(mcwa===1){// 670 ~ 1200
				$(".hamNavibar").animate({right:"0"},1000, 'easeOutCubic', function(){
					$(".item-has-children:nth-child(1)").delay(100).animate({
						top:0,
						opacity: 1,
					},600,'easeOutQuart');
					$(".item-has-children:nth-child(2)").delay(200).animate({
						top:0,
						opacity: 1,
					},600,'easeOutQuart');
					$(".item-has-children:nth-child(3)").delay(300).animate({
						top:0,
						opacity: 1,
					},600,'easeOutQuart');
					$(".item-has-children:nth-child(4)").delay(400).animate({
						top:0,
						opacity: 1,
					},600,'easeOutQuart');
				});	
			}// 670 ~ 1200
			if(mcwa===2){// 0 ~ 670
				$(".hamNavibar").animate({right:"0"},800, 'easeOutCubic', function(){
					$(".item-has-children:nth-child(1)").delay(100).animate({
						top:0,
						opacity: 1,
					},500,'easeOutQuart');
					$(".item-has-children:nth-child(2)").delay(200).animate({
						top:0,
						opacity: 1,
					},500,'easeOutQuart');
					$(".item-has-children:nth-child(3)").delay(300).animate({
						top:0,
						opacity: 1,
					},500,'easeOutQuart');
					$(".item-has-children:nth-child(4)").delay(400).animate({
						top:0,
						opacity: 1,
					},500,'easeOutQuart');
				});	
			}// 0 ~ 670

			hamSt=1;
		}		
		else if(hamSt===1){
			$("span",this).eq(0).animate({
				rotate:"0deg",
				top:"0px"
			},200);
			$("span",this).eq(1).animate({
				width:"24px",
				left:"0px"
			},200);
			$("span",this).eq(2).animate({
				rotate:"0deg",
				top:"20px"
			},200);

			$(".hamNavibar").stop();

			if(mcwa===0){// 1200 ~ 1920
				$(".hamNavibar").animate({right:-hamWidth},1500, 'easeOutCubic', function(){
					$(".item-has-children").animate({
						top:'50px',
						opacity: 0,
					});
				});
			}// 1200 ~ 1920
			if(mcwa===1){// 670 ~ 1200
				$(".hamNavibar").animate({right:-hamWidth},1000, 'easeOutCubic', function(){
					$(".item-has-children").animate({
						top:'50px',
						opacity: 0,
					});
				});
			}// 670 ~ 1200
			if(mcwa===2){// 0 ~ 670
				$(".hamNavibar").animate({right:-hamWidth},800, 'easeOutCubic', function(){
					$(".item-has-children").animate({
						top:'50px',
						opacity: 0,
					});
				});
			}// 0 ~ 670
			hamSt=0;
		}
	});



	//  햄버거 메뉴 > 서브 메뉴  ////////////////////////////
//	var sMenuSt = 0;
//	$(".subMenu").children("a").click(function(){
//		if(hamSt===0){return}
//		//alert("성공");
//		$(this).toggleClass("submenu-open")
//			.next(".sbMenu").slideToggle(200).end()
//			.parent(".subMenu").siblings(".subMenu").children("a").removeClass("submenu-open")
//			.next(".sbMenu").slideUp(200)		
//		;
//	});

}); 
//jQ-reday  ////////////////////////////////////////////////////////////////////////////////////