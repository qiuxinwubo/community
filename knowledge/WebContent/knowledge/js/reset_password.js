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
	if(value==""){
		$("#verifyusername").html("用户名不能为空！");
		return false;
	}
	var sgin=false;
	$.ajax({
		url : get_url()+"/sysuseraction/verifysysuser.action",
		type: 'POST',
		async:false,
		data:{username:value},
		success : function(data) {
			data=$.trim(data);
			if(data=="1"){
				$("#verifyusername").html("用户名为不大于20个字符的英文或数字");
				sgin=true;
			}else{
				$("#verifyusername").html("该用户不存在！");
				sgin=false;
			}
		}
	});
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
		url : get_url()+"/sysuseraction/verifyusernameandpass.action",
		async:false,
		type: 'POST',
		data:{username:$("#accountNumber").val(),phone:phone},
		success : function(data) {
			data=$.trim(data);
			if(data=="1"){
				sgin=true;
			}else{
				$("#verifyphone").html("手机号与用户名不匹配！");
				sgin=false;
			}
		}
	});
	if(sgin){
		$("#verifyphone").html("手机号为国内手机号");
	}
	return sgin;
}
function doSearch(){
	var form = document.getElementById("form");
  	form.submit();
}
function submit1(){
	if(verifyUserName()&&verifyphone()){
		doSearch();
	}
}
function verifypassword(){
	var password=$("#password").val();
	if(password==""){
		$("#verifypass").html("密码不能为空！");
		return false;
	}
	if(password.length>16){
		$("#verifypass").html("密码长度不能大于16位！");
		return false;
	}
	var reg=/^[a-zA-Z0-9]+$/;
	if(!reg.test(password)){
		$("#verifypass").html("密码只能包含数字或字母！");
		return false;
	}
	$("#verifypass").html("密码为不大于16个字符的英文或数字");
	return true;
}
function verifyrepassword(){
	var password=$("#password").val();
	var repassword=$("#passwordAgain").val();
	if(repassword==""){
		$("#verifyrepass").html("确认密码不能为空！");
		return false;
	}
	if(repassword!=password){
		$("#verifyrepass").html("确认密码与密码不同！");
		return false;
	}
	$("#verifyrepass").html("确认密码为不大于16个字符的英文或数字且与密码相同");
	return true;
}
function submit2(){
	if(verifypassword()&&verifyrepassword()){
		doSearch();
	}
}