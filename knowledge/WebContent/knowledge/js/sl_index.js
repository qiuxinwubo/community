$(function(){
	$('.sl_pageBox2 a').mouseover(function(event) {
		$(this).css('background', '#0f70a7').css('color', '#fff');
	});
	$('.sl_pageBox2 a').mouseout(function(event) {
		$(this).css('background', 'none').css('color', '#656464');
	});
})
$(function(){
	$('.sl_pageBox2 a').eq(2).css('background', '#0f70a7').css('color', '#fff');
	$('.sl_pageBox2 a').mouseover(function(event) {
		$('.sl_pageBox2 a').eq(2).css('background', 'none').css('color', '#24578e');
		$(this).css('background', '#0f70a7').css('color', '#fff');
	});
	$('.sl_pageBox2 a').mouseout(function(event) {
		$(this).css('background', 'none').css('color', '#24578e');
	});

	// 2017-06-21
	// 服务项目菜单栏
	$('.sl_navBanList ul li').mouseover(function(event) {
		$(this).find('.sl_navBanner').css('display', 'block');
	}).mouseout(function(event) {
		$(this).find('.sl_navBanner').css('display', 'none');
	});

	// 头部菜单栏
	$('.sl_navListBtn').click(function(event) {
		if(!$(this).hasClass('hiddenStyle')){
			$('.sl_navBanList').css('display', 'block');
			$(this).addClass('hiddenStyle');
		}else{
			$('.sl_navBanList').css('display', 'none');
			$(this).removeClass('hiddenStyle');
		}
	});

	// 在线客服
	setInterval(function(){
		if(!$(".sl_onlineService").hasClass("changeBg")){
			$(".sl_onlineService").css('background', '#64aeff url(../knowledge/images/service.png) no-repeat 20px center');
			$(".sl_onlineService").addClass("changeBg");
		}else{
			$(".sl_onlineService").css('background', '#337ccb url(../knowledge/images/service.png) no-repeat 20px center');
			$(".sl_onlineService").removeClass("changeBg");
		}
	},800);


	$('.sl_weichat').mouseover(function(event) {
		$(this).find('span').css('display', 'block');
	});
	$('.sl_weichat').mouseout(function(event) {
		$(this).find('span').css('display', 'none');
	});


	var week; 
	    if(new Date().getDay()==0) week="星期日"
	    if(new Date().getDay()==1) week="星期一"
	    if(new Date().getDay()==2) week="星期二" 
	    if(new Date().getDay()==3) week="星期三"
	    if(new Date().getDay()==4) week="星期四"
	    if(new Date().getDay()==5) week="星期五"
	    if(new Date().getDay()==6) week="星期六"
	    $(".sl_timeBox").html(new Date().getFullYear()+"年"+(new Date().getMonth()+1)+"月"+new Date().getDate()+"日 "+week);
})