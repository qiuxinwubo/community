$(function(){
	$('.liveName').mouseover(function(event) {
		$(this).addClass('color');
		var a = $(this).index();
	});
	$('.liveName').mouseout(function(event) {
		$(this).removeClass('color');
	});	
})
$(function(){
	$('.tabNav li').mouseover(function(event) {
		$('.tabBox').css('display', 'none');
		$(this).addClass('on').css('color', '#007fe4');
		var a = $(this).index();
		$('.tabBox').eq(a).css('display', 'block');
	});
	$('.tabNav li').mouseout(function(event) {
		$(this).removeClass('on').css('color', '#010101');
	});
})
