$(function(){
	$(window).resize(function(){
		var width = window.innerWidth;
		//console.log(width);


		if(width > 770){
			$('#slide1 img').attr('src', '/images/visual_img01.jpg')
			$('#slide2 img').attr('src', '/images/visual_img02.jpg')
			$('#slide3 img').attr('src', '/images/visual_img03.jpg')
			$('#slide4 img').attr('src', '/images/visual_img04.jpg')
		}

		else if(width > 470 && width < 770){

			$('#slide1 img').attr('src', '/images/visual_Pimg01.jpg')
			$('#slide2 img').attr('src', '/images/visual_Pimg02.jpg')
			$('#slide3 img').attr('src', '/images/visual_Pimg01.jpg')
			$('#slide4 img').attr('src', '/images/visual_Pimg02.jpg')

		}

		else{
			$('#slide1 img').attr('src', '/images/visual_Mimg01.jpg')
			$('#slide2 img').attr('src', '/images/visual_Mimg02.jpg')
			$('#slide3 img').attr('src', '/images/visual_Mimg01.jpg')
			$('#slide4 img').attr('src', '/images/visual_Mimg02.jpg')
		}

	}).resize();

}); 
//jQ-reday  ////////////////////////////////////////////////////////////////////////////////////