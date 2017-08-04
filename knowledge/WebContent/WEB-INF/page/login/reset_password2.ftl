<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>知识产权</title>
	<link href="${base}/knowledge/css/sl_style.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="${base}/common/js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="${base}/common/js/koala.min.1.5.js"></script>
	<script src="${base}/knowledge/js/reset_password.js"></script>
</head>
<body style='background:none;'>
	<form id="form" method="post" action="${base}/sysuseraction/repassword.action">
	<input type="hidden" name="username" value="${username?if_exists}">
	<div class="sl_registerMain">
		<div class="sl_mainTop">
			<div class="sl_logoBox">
				&nbsp;
			</div>
			<div class="sl_regusterLogin">
				<span>我已注册，现在就</span>
				<a href="${base}/LoginIpAction/loginbefore.action">登录</a>
			</div>
		</div>
		<div class="sl_mainContent">
			<div class="sl_inputMain">
				<div class="sl_inputBox">
					<label for="password">密码</label>
					<input type="password" id='password' placeholder='请输入密码' name="password" onblur="verifypassword();">
				</div>
				<div class="sl_alertBox" id="verifypass">
					密码为不大于16个字符的英文或数字
				</div>
				<div class="sl_inputBox">
					<label for="passwordAgain">确认密码</label>
					<input type="password" id='passwordAgain' placeholder='请再次输入密码' name="repassword" onblur="verifyrepassword();">
				</div>
				<div class="sl_alertBox" id="verifyrepass">
					确认密码为不大于16个字符的英文或数字且与密码相同
				</div>
				<a href="#" class='sl_registerBtn'  onclick="submit2();">提交</a>
			</div>
			<div class="sl_weiChatBox">
				<div class="sl_weiTitle">
					关注我们
				</div>
				<div class="sl_erweimaBox">
					<img src="${base}/knowledge/images/sl_erweima_03.png" alt="">
				</div>
			</div>
		</div>
	</div>
	<form>
</body>
</html>
