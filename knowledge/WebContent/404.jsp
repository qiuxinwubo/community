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
</head>
<body class="error-page">
<div class="error2">
 <span class="fl"><img src="<%= path%>/common/images/404.gif" width="382" height="253" /></span>
 <span class="fr"><img src="<%= path%>/common/images/notice1.gif" class="margin06" width="477" height="98" />
 <a href="javascript:void(-1);" onclick="back();" class="error-btn">返回首页</a></span>
</div>
</body>
<script>
	function back(){
		top.location.href=get_local_url();
	}
</script>
</html>
