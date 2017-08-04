<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>知识产权</title>
	<link rel="shortcut icon" type="image/x-icon" href="${base}/common/images/icon.ico" media="screen" />
    <link href="${base}/knowledge/css/style.css" rel="stylesheet" type="text/css" />
	<script type='text/javascript' src='${base}/common/js/jquery.min.js'></script>
	<script type='text/javascript' src='${base}/knowledge/js/common.js'></script>
    <!-- 弹出层 -->
    <script type="text/javascript" src="${base}/common/artdialog/artDialog.js?skin=opera"></script>
    <script type="text/javascript" src="${base}/common/artdialog/plugins/iframeTools.js"></script>
</head>
<body>
        <div class="top" id="top"></div>
<div class="container">
         <div class="left"  id="left"></div>
  <div class="right">
        <div class="position">当前位置&nbsp;&nbsp;>&nbsp;&nbsp;平台管理员账户&nbsp;&nbsp;>&nbsp;&nbsp;<span>商家管理</span></div>
        <form id="form" action="${base}/show.action?code=ba_ent_list" method="post">
			<input type="hidden" id="pageNo" name="pageNo" value="1" />
			<input type="hidden" id="menu"  value="4" />
			<center><input name="name" type="text" value="${args.name?if_exists}" /><input  class="btn01" type="submit" value="搜索">
			<a href="${base}/backstagemerchant/baentadd.action" style="width: 120px;height: 30px;text-align: center;line-height: 30px;display: inline-block;background: #428bca;color: #fff;text-decoration: none">新增</a></center>
        <table class="table01" border="0">
                  <tr>
                          <th>商家名称</th>
                          <th>咨询链接</th>
                          <th style="width:100px;">创建时间</th>
                          <th style="width:80px;">状态</th>
                          <th style="width:80px;">操作</th>
                  </tr>
                  <#list data.ds1 as record>
                   <tr> 
                          <td class="text_long2" style="height:60px;text-align:left;padding-left:10px;">${record.ent_name?if_exists}</td>
                          <td style="word-wrap: break-word;word-break:break-all;text-align:left;padding-left:10px;">${record.advisory_url?if_exists}</td>
                          <td style="padding-left:10px;">${record.create_time?string("yyyy-MM-dd")}</td>
                          <td <#if '${record.state?if_exists}'=='2'>style="color:#0c0"<#else>style="color:#F00"</#if>>
	                          	<#if '${record.state?if_exists}'=='1'>停用中
	                          	<#else>使用中
                          		</#if>
                          	</td>
                          <td>
                          		<#if '${record.state?if_exists}'=='1'> 
                          			<a href="${base}/backstagemerchant/baentchangestate.action?id=${record.id?if_exists}&sign=2">使用</a>
                          			<a href="${base}/backstagemerchant/baentalter.action?id=${record.id?if_exists}">修改</a>
                          		<#else>
                          			<a href="${base}/backstagemerchant/baentchangestate.action?id=${record.id?if_exists}&sign=1">停用</a>
                          		</#if>
	                          		<a href="#" onclick="del('${record.id?if_exists}')">删除</a>
                          </td>
                   </tr>
                  </#list>
        </table> 
		</form>
        <div class="page">
        	<#include "/common/paging.ftl">
        </div>
    <div id="under"></div>
  </div>
    
</div>
  
</body>
<script>
function del(id){
	art.dialog.confirm('请确认，您是否要删除？', function(){
		window.location.href ="${base}/backstagemerchant/baentdel.action?id="+id;
	});
	return true;
}
</script>
</html>
