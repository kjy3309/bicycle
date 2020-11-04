(function($){
	function prefix(el){
		var prefixes = ["Webkit", "Moz", "O", "ms"];
		for (var i = 0; i < prefixes.length; i++){
			if (prefixes[i] + "Transition" in el.style){
				return '-'+prefixes[i].toLowerCase()+'-'; 
			};
		}; 
		return "transition" in el.style ? "" : false;
	};
	var methods = {
		init: function(settings){
			return this.each(function(){
				var config = {
					slideDur: 7000,
					fadeDur: 800
				};
				if(settings){
					$.extend(config, settings);
				};
				this.config = config;
				var $container = $(this),
					slideSelector = '.slide',
					slideSelector2 = '.slide2',
					fading = false,
					slideTimer,
					activeSlide,
					newSlide,
					$slides = $container.find(slideSelector),
					$slides2 = $container.find(slideSelector2),
					totalSlides = $slides.length,
					totalSlides2 = $slides2.length,
					$pagerList = $container.find('.pager_list');
					prefix = prefix($container[0]);
				function animateSlides(activeNdx, newNdx){
					function cleanUp(){
						$slides.eq(activeNdx).removeAttr('style');
						$slides2.eq(activeNdx).removeAttr('style');
						activeSlide = newNdx;
						fading = false;
						waitForNext();
					};
					if(fading || activeNdx == newNdx){
						return false;
					};
					fading = true;
					$pagers.removeClass('active').eq(newSlide).addClass('active');
					$slides.eq(activeNdx).css('z-index', 3);
					$slides.eq(newNdx).css({
						'z-index': 2,
						'opacity': 1
					});
					$slides2.eq(activeNdx).css('z-index', 3);
					$slides2.eq(newNdx).css({
						'z-index': 2,
						'opacity': 1
					});
					if(!prefix){
						$slides.eq(activeNdx).animate({'opacity': 0}, config.fadeDur,
						function(){
							cleanUp();
						});
						$slides2.eq(activeNdx).animate({'opacity': 0}, config.fadeDur,
						function(){
							cleanUp();
						});
					} else {
						var styles = {};
						styles[prefix+'transition'] = 'opacity '+config.fadeDur+'ms';
						styles['opacity'] = 0;
						$slides.eq(activeNdx).css(styles);
						$slides2.eq(activeNdx).css(styles);
						var fadeTimer = setTimeout(function(){
							cleanUp();
						},config.fadeDur);
					};
				};
				function changeSlides(target){
					if(target == 'next'){
						newSlide = activeSlide + 1;
						if(newSlide > totalSlides - 1){
							newSlide = 0;
						}
						if(newSlide > totalSlides2 - 1){
							newSlide = 0;
						}
					} else if(target == 'prev'){
						newSlide = activeSlide - 1;
						if(newSlide < 0){
							newSlide = totalSlides - 1;
						};
						if(newSlide < 0){
							newSlide = totalSlides2 - 1;
						};
					} else {
						newSlide = target;
					};
					animateSlides(activeSlide, newSlide);
				};
				function waitForNext(){
					slideTimer = setTimeout(function(){
						changeSlides('next');
					},config.slideDur);
				};
				for(var i = 0; i < totalSlides; i++){
					$pagerList
						//.append('<li class="page" data-target="'+i+'">'+i+'</li>');
						.children('li').addClass('page');

				};
				for(var i = 0; i < totalSlides2; i++){
					$pagerList
						//.append('<li class="page" data-target="'+i+'">'+i+'</li>');
						.children('li').addClass('page');

				};
				$container.find('.page').bind('click',function(){
					var target = $(this).attr('data-target');
					clearTimeout(slideTimer);
					changeSlides(target);
				});
				var $pagers = $pagerList.find('.page');
				$slides.eq(0).css('opacity', 1);
				$slides2.eq(0).css('opacity', 1);
				$pagers.eq(0).addClass('active');
				activeSlide = 0;
				waitForNext();
			});
		}
	};
	$.fn.easyFader = function(settings){
		  return methods.init.apply(this, arguments);
	};

	
})(jQuery);

$(function(){
	$('#Fader').easyFader({
		slideDur: 3000,
		fadeDur: 800
	});

//	$('.pager_list li').hover(function(){
//		$(this).addClass('pager_list_hover');
//	}, function(){
//		$(this).removeClass('pager_list_hover');	
//	});
//
//	$('.pager_list li').mouseover(function(){
//		$(this).addClass('pager_list_hover');
//	});
//	$('.pager_list li').mouseout(function(){
//		$(this).removeClass('pager_list_hover');
//	});
});

