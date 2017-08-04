<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>知识产权</title>
	<link href="${base}/knowledge/css/sl_style.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="${base}/common/js/jquery.min.js"></script>
	<script type="text/javascript" src="${base}/knowledge/js/register.js"></script>
	<script type="text/javascript" src="${base}/common/js/koala.min.1.5.js"></script>
</head>
<body style='background:none;'>
	<form id="form" method="post" action="${base}/LoginIpAction/register.action">
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
					<input type="text" id='accountNumber' placeholder='请设置用户名' name="username" onblur="verifyUserName();">
				</div>
				<div class="sl_alertBox" id="verifyusername">
					用户名为不大于20个字符的英文或数字
				</div>
				<div class="sl_inputBox">
					<label for="phoneNumber">手机号</label>
					<input type="text" id='phoneNumber' placeholder='可用于登录和找回密码'  name="phone"  onblur="verifyphone();">
				</div>
				<div class="sl_alertBox" id="verifyphone">
					请填写国内手机号
				</div>
				<div class="sl_inputBox">
					<label for="password">密码</label>
					<input type="password" id='password' placeholder='请输入密码' name="pass" onblur="verifpass();">
				</div>
				<div class="sl_alertBox" id="verifypass">
					密码为不大于16个字符的英文或数字
				</div>
				<div class="sl_inputBox">
					<label for="passwordAgain">确认密码</label>
					<input type="password" id='passwordAgain' placeholder='请再次输入密码' name="repass" onblur="verifrepass();">
				</div>
				<div class="sl_alertBox" id="verifyrepass">
					确认密码为不大于16个字符的英文或数字且与密码相同
				</div>
				<a href="#" class='sl_registerBtn'  onclick="register();">注册</a>
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