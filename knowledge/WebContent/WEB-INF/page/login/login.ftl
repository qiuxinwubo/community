<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>知识产权</title>
	<link href="${base}/knowledge/css/sl_style.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="${base}/common/js/jquery.min.js"></script>
	<script type="text/javascript" src='${base}/knowledge/js/sl_style.js'></script>
	<script type="text/javascript" src='${base}/knowledge/js/login.js'></script>
</head>
<body style='background:none;'>
	<form id="form" method="post" action="${base}/LoginIpAction/login.action">
	<div class="sl_registerMain">
		<div class="sl_mainTop">
			<div class="sl_logoBox">
				<a href='${base}/receptionaction/show.action?code=re_index'>
					<img src='${base}/knowledge/images/sl_loginLogo_02.png'>
				</a>
			</div>
			<div class="sl_regusterLogin">
				<span>我没有注册，现在就</span>
				<a href="${base}/LoginIpAction/registerbefore.action">注册</a>
			</div>
		</div>
		<div class="sl_mainContent">
			<div class="sl_inputMain">
				<div style="margin-left: 180px;color: red;">${ems?if_exists}</div>
				<div class="sl_inputBox">
					<label for="accountNumber">账户</label>
					<input type="text" id='accountNumber' name="username" placeholder='请设置用户名' value="${username?if_exists}">
				</div>
				<div class="sl_inputBox" style="margin-top:10px;">
					<label for="password">密码</label>
					<input type="password" id='password' name="pass" placeholder='请输入密码' value="${pass?if_exists}">
				</div>
				<a href="#" class='sl_registerBtn' onclick="login();" style="margin-top:10px;">登录</a>
				<a href="${base}/sysuseraction/repasswordbefore.action" class='sl_registerBtn' style="margin-top:10px;">重置密码</a>
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
	</form>
</body>
</html>