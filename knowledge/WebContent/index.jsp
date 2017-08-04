<%@ page language="java" pageEncoding="UTF-8" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
	<base href="<%=basePath%>"> 
	<script>window.top.location.href='<%=basePath%>receptionaction/show.action?code=re_index';</script>
	<body></body>
</html>