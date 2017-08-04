function get_www_url(){
	var url = "http://localhost:8080";
	return url;
}
 
function get_url(){
	var url = "/knowledge";
	return url;
}
//function verifyUserName(){
//	var value=$("#username").val();
//	$.ajax({
//		url : get_url()+"/sysuseraction/verifysysuser.action",
//		type: 'POST',
//		data:{username:value},
//		success : function(data) {
//			data=$.trim(data);
//			if(data=="1"){
//				$("#sgin").val("1");
//				$("#phonediv").css("display","none");
//				
//			}else{
//				$("#sgin").val("0");
//				$("#phonediv").show();
//			}
//		}
//	});
//}
//function verifyphone(){
//	if($("#sgin").val()=="1"){
//		return true;
//	}else{
//		var phone=$("#phone").val();
//		var reg=/^1(3|4|5|7|8)\d{9}$/;
//		if(phone==""){
//			$(".sl_loginBox #verifyphone").html("手机号不能为空！").css("display","inline-block");
//			return false;
//		}
//		if(!reg.test(phone)){
//			$(".sl_loginBox #verifyphone").html("手机号格式错误！").css("display","inline-block");
//			return false;
//		}
//		var sgin=false;
//		$.ajax({
//			url : get_url()+"/sysuseraction/verifyphone.action",
//			async:false,
//			type: 'POST',
//			data:{phone:phone},
//			success : function(data) {
//				data=$.trim(data);
//				if(data=="1"){
//					$("#verifyphone").html("手机号已经注册！").css("display","inline-block");
//					sgin=false;
//				}else{
//					$("#verifyphone").html("").css("display","none");
//					sgin=true;
//				}
//			}
//		});
//		if(sgin){
//			$("#verifyphone").html("");
//		}
//		return sgin;
//	}
//}
function login(){
	var form = document.getElementById("form");
  	form.submit();
}