<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>知识产权</title>
	<link href="${base}/knowledge/css/sl_style.css" rel="stylesheet" type="text/css" />
	<script src="${base}/common/js/jquery.min.js"></script>
	<script type="text/javascript" src="j${base}/common/js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="${base}/common/js/koala.min.1.5.js"></script>
	<script src="${base}/knowledge/js/reset_password.js"></script>
</head>
<body style='background:none;'>
	<form id="form" method="post" action="${base}/sysuseraction/retrievepassword.action">
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
					<label for="accountNumber">账户</label>
					<input type="text" id='accountNumber' placeholder='请填写用户名' name="username" onblur="verifyUserName();">
				</div>
				<div class="sl_alertBox" id="verifyusername">
					用户名为不大于20个字符的英文或数字
				</div>
				<div class="sl_inputBox">
					<label for="phoneNumber">手机号</label>
					<input type="text" id='phoneNumber' placeholder='请填写手机号'  name="phone"  onblur="verifyphone();">
				</div>
				<div class="sl_alertBox" id="verifyphone">
					手机号为国内手机号
				</div>
				<a href="#" class='sl_registerBtn'  onclick="submit1();">提交</a>
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

