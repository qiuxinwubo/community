// 王宁
$(document).ready(function(){
	$(".Media .info .title li").click(function(event) {
		$(".Media .info .title li a").removeClass('active');
		$(this).find('a').addClass('active');
		var index = $(this).index();
		$(".Media .content .onPlay").hide();
		$(".Media .content .onPlay").eq(index).show();
	});
});
// 高秀玲
$(function(){
	$(".user").mouseover(function() {
		$(".hid").css('display','block');
		
	});
	$('.hid').mouseleave(function(){
		$(".hid").css('display','none');
	})
	
})
	

// 苏良
$(function(){
	$.each($('.liveName'),function(index,value){
		$('.liveName').mouseover(function(event){
			$(this).addClass('color');
			$(this).parent().find(".data").css('color','#fff').css('text-decoration','underline');
		});
		$('.liveName').mouseout(function(event){
			$(this).removeClass('color');
			$(this).parent().find(".data").css('color','#cdcbcb').css('text-decoration','none');
		});
	})
})
// 921修改开始
$(function(){
	$.each($('.tabNav li'),function(index,value) {
		$('.tabNav li').eq(0).addClass('on').css('border-bottom', 'none').css('height', 55);
		$('.link').eq(0).css('color', '#007fe4').css('font-weight', '600');
		$('.tabBox').eq(0).css('display', 'block');
		$('.tabNav li').mouseover(function(event) {
			var a=$(this).index();
			$('.tabNav li').removeClass('on').css('border-bottom', '1px solid #ece7e7').css('height', 54);
			$('.link').css('color', '#010101').css('font-weight', 'normal');
			$('.tabBox').css('display', 'none');
			$(this).addClass('on').css('border-bottom', 'none').css('height', 55);
			$('.link').eq(a).css('color', '#007fe4').css('font-weight', '600');
			$('.tabBox').eq(a).css('display', 'block');
		});
	});
	
})
// 921修改结束
// 王思从
$(document).ready(function(){
	if(parseInt($(".wsc-content .main-right").height()) < parseInt($(window).height())){
		$(".wsc-content .nav-left").height($(window).height()-80);
	}else {
		$(".wsc-content .nav-left").height($(".wsc-content .main-right").height()+45);
	}
	
	$(".wsc-content .main-right").width($(window).width()-211-30);

//	$(".wsc-content .nav-left > ul > .nav-son > ul > li > a").click(function(){
//		if($(this).children().hasClass("open")){
//			$(this).next("ul").css("display","none");
//			$(this).children().removeClass("open");
//			$(this).children().addClass("close");
//		}else if($(this).children().hasClass("close")){
//			$(this).next("ul").css("display","block");
//			$(this).children().removeClass("close");
//			$(this).children().addClass("open");
//		}
//	});

	$(".wsc-content .nav-left > ul > .nav-son > ul a").click(function(){
		
		if($(this).next().html()==""){
			$(this).addClass("nav-on");
			$(".wsc-content .nav-left > ul > .nav-son > ul a").removeClass("nav-on");
		}
	});

	for(var i=0,leng = $(".wsc-content .main-right .live-list tr").length;i<leng;i++){
		if(i%2!=0){
			$(".wsc-content .main-right .live-list tr").eq(i).css("background","#F2F2F2");
		}
	}

	$(".wsc-head .u-center > a").mouseenter(function(){
		$(".wsc-head .u-center > div").css("display","block");
	});
	$(".wsc-head .u-center > a").mouseleave(function(){
		$(".wsc-head .u-center > div").css("display","none");
	});

	$(".wsc-head .u-center > div").mouseenter(function(){
		$(".wsc-head .u-center > div").css("display","block");
	});
	$(".wsc-head .u-center > div").mouseleave(function(){
		$(".wsc-head .u-center > div").css("display","none");
	});

	$(".wsc-content .main-right .live-list .list-bd .upTop").click(function(){
		$(".cover-box").css("display","block");
		$(".cover-bg").css("display","block");
	});
	$(".cover-box .content > div .goback").click(function(){
		$(".cover-box").css("display","none");
		$(".cover-bg").css("display","none");
	});
	
	// 新建会议选中撤销
	// 选中
	$(document).on("click",".wsc-content .main-right .person-box .alternate span",function(){
		if(!$(this).hasClass("p-select")){
			$(this).addClass("p-select");
		}else {
			$(this).removeClass("p-select");
		}
	});
	$(document).on("click",".wsc-content .main-right .person-box .selected span",function(){
		
		if(!$(this).hasClass("p-select")){
			$(this).addClass("p-select");
		}else {
			$(this).removeClass("p-select");
		}
	});
	$(".wsc-content .main-right .person-box .select-btn .sel-btn").click(function(){

		$(".wsc-content .main-right .person-box .alternate span").each(function(){
			
			if($(this).hasClass("p-select")){
				$(".wsc-content .main-right .person-box .selected").append("<div>"+$(this).parent().html()+"</div>");
				$(this).parent().remove();
			}

		});
	});
	// 撤销
	$(".wsc-content .main-right .person-box .select-btn .cancel").click(function(){
		$(".wsc-content .main-right .person-box .selected span").each(function(){
			
			if($(this).hasClass("p-select")){
				$(".wsc-content .main-right .person-box .alternate").append("<div>"+$(this).parent().html()+"</div>");
				$(this).parent().remove();
			}

		});
	});
//	$(document).on("click",".wsc-content .main-right > .preserve",function(){
//		var arrayId = '';
//		$(".wsc-content .main-right .person-box .selected span").each(function(){
//			arrayId = arrayId +','+$(this).attr("id");
//		});
//	});
		
});

function navShow(){
	if($(".nav-show").children("em").hasClass("open")){
		$(".nav-show").next("ul").css("display","none");
		$(".nav-show").children().removeClass("open");
		$(".nav-show").children().addClass("close");
	}else if($(".nav-show").children("em").hasClass("close")){
		$(".nav-show").next("ul").css("display","block");
		$(".nav-show").children().removeClass("close");
		$(".nav-show").children().addClass("open");
	}
}