<%@ page language="java" pageEncoding="UTF-8" %>
<% response.setStatus(200);%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>信息提示页</title>
<link href="<%= path%>/common/css/error.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%= path%>/www/js/common.js"></script>
<style type="text/css">
 .wn-back{position: absolute;top: 50%;left: 50%;margin-top: 70px;margin-left: 30px;}
</style>
</head>
<body class="error-page">
<div class="error-notice"><img src="<%= path%>/common/images/error.gif" alt="错误" /></div>
<span class="fr wn-back"><a href="javascript:void(-1);" onclick="back();" class="error-btn">返回首页</a></span></div>
</body>
<script>
	function back(){
		top.location.href=get_local_url();
	}
</script>
</html>
