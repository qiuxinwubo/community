function get_www_url(){
	var url = "http://localhost:8080";
	return url;
}
 
function get_url(){
	var url = "/knowledge";
	return url;
}
function verifyUserName(){
	var value=$("#accountNumber").val();
	if(value.length>20){
		$("#verifyusername").html("用户名不能大于20个字符！");
		return false;
	}
	var reg=/^[a-zA-Z0-9]+$/;
	if(!reg.test(value)){
		$("#verifyusername").html("用户名只能是英文字母或数字！");
		return false;
	}
	var sign=false;
	$.ajax({
		url : get_url()+"/sysuseraction/verifysysuser.action",
		type: 'POST',
		async:false,
		data:{username:value},
		success : function(data) {
			data=$.trim(data);
			if(data=="1"){
				sgin=false;
				$("#verifyusername").html("用户名已经存在！");
				
			}else{
				sgin=true;
				$("#verifyusername").html("用户名正确！");
			}
		}
	});
	if(sgin){
		$("#verifyusername").html("用户名正确！");
	}
	return sgin;
}
function verifyphone(){
	var phone=$("#phoneNumber").val();
	var reg=/^1(3|4|5|7|8)\d{9}$/;
	if(phone==""){
		$("#verifyphone").html("手机号不能为空！");
		return false;
	}
	if(!reg.test(phone)){
		$("#verifyphone").html("手机号格式错误！");
		return false;
	}
	var sgin=false;
	$.ajax({
		url : get_url()+"/sysuseraction/verifyphone.action",
		async:false,
		type: 'POST',
		data:{phone:phone},
		success : function(data) {
			data=$.trim(data);
			if(data=="1"){
				$("#verifyphone").html("手机号已经注册！");
				sgin=false;
			}else{
				$("#verifyphone").html("请填写国内手机号");
				sgin=true;
			}
		}
	});
	if(sgin){
		$("#verifyphone").html("手机号正确！");
	}
	return sgin;
}
function verifpass(){
	var value=$("#password").val();
	if(value==""){
		$("#verifypass").html("密码不能为空！");
		return false;
	}
	if(value.length>16){
		$("#verifypass").html("密码不能大于16个字符！");
		return false;
	}
	var reg=/^[a-zA-Z0-9]+$/;
	if(!reg.test(value)){
		$("#verifypass").html("密码只能包含英文或数字！");
		return false;
	}
	$("#verifypass").html("密码正确！");
	return true;
}
function verifrepass(){
	verifpass();
	var pass=$("#password").val();
	var value=$("#passwordAgain").val();
	if(value!=pass){
		$("#verifyrepass").html("确认密码和密码不同！");
		return false;
	}
	$("#verifyrepass").html("确认密码正确！");
	return true;
}
function register(){
	if(verifyUserName()&&verifyphone()&&verifrepass()){
		var form = document.getElementById("form");
	  	form.submit();
	}
}