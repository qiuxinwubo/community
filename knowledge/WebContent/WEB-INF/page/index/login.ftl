<!DOCTYPE HTML>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>用户登录</title>
	<script src="${base}/common/js/jquery.min.js"></script>
</head>
<body>
	<div class="w-confirm">
		<form id="fm" method="post" action="${base}/login/login.action">
		<div>
			<span class="s-label">用户名：</span>
			<input type="text" id="userName"  name="userName" class="in-txt">
		</div>
		<div>
			<span class="s-label">密码：</span>
			<input type="password" id="password" name="password" class="in-txt">
		</div>
		<div>
			<span class="s-label"></span>
			<a href="javascript:void(0)" onclick="dologin()" class="login-btn">登录</a>
		</div>
		</form>
	</div>
</body>
<script>
function dologin(){
	var username = $("#userName").val();
	if(username == ""){
		$("#error").html("请输入用户名");
		return false;
	}
	var password = $("#password").val();
	if(password == ""){
		$("#error").html("请输入密码");
		return false;
	}
	var form = document.getElementById("fm");
  	form.submit();
}
document.onkeydown=function(e){//网页内按下回车触发
	switch ((window.event)?event.keyCode:e.which){
		case 13:
			dologin();
			break;
		default:
			break;
	}
}
</script>
</html>