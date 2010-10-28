$(function(){
	$('#slider').cycle();
	
	$('#images').cycle({
		timeout: 0,
		pager:  '#slider-pager',
		pagerAnchorBuilder: function(idx, slide) { 		
		   return '#slider-pager li:eq(' + idx + ') a'; 
		} 
	});	

	
	$('.project a').hover(function(){
		$(this).find ('.bg').show(); 
	},function(){
		$(this).find ('.bg').hide(); 
	});
	
	var top = $('#contact').offset().top;
	
	$(window).scroll(function (event) {
	  // what the y position of the scroll is
	  var y = $(this).scrollTop();
	
	  // whether that's below the form
	  if (y >= top) {
		// if so, ad the fixed class
		$('#contact').addClass('fixed');
	  } else {
		// otherwise remove it
		$('#contact').removeClass('fixed');
	  }
	});
	
	
	
});