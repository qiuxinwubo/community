<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>知识产权系统</title>
	<script type='text/javascript' src='${base}/common/js/jquery.min.js'></script>
	<script type='text/javascript'>
	$(function(){
		var myDate = new Date();
		$("#time").html("系统时间："+myDate.toLocaleString());
	});
	</script> 
</head>
<body>
<div class="top">
      <div class="logo">知识产权频道后台系统</div>
      <div class="date" id="time"> </div>
      <div class="text"><a href="${base}/LoginIpAction/logout.action">退出</a></div>
      <div class="text">欢迎您 !<span> ${user.userName?if_exists}</span></div>
</div>
</body>
</html>