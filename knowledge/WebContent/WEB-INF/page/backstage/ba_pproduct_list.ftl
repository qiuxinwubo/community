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
        <div class="position">当前位置&nbsp;&nbsp;>&nbsp;&nbsp;平台管理员账户&nbsp;&nbsp;>&nbsp;&nbsp;<span>产品管理</span></div>
        <form id="form" action="${base}/show.action?code=ba_pproduct_list" method="post">
			<input type="hidden" id="pageNo" name="pageNo" value="1" />
			<input type="hidden" id="menu"  value="3" />
			<center><input name="name" type="text" value="${args.name?if_exists}" /><input  class="btn01" type="submit" value="搜索">
        <table class="table01" border="0">
                  <tr>
                          <th>服务产品名称</th>
                          <th>创建时间</th>
                          <th>状态</th>
                          <th>操作</th>
                  </tr>
                  <#list data.ds1 as record>
                   <tr>
                          <td><div class="text_long2">${record.name?if_exists}</div></td>
                          <td>${record.create_time?string("yyyy-MM-dd")}</td>
                          <td <#if '${record.state?if_exists}'=='2'>style="color:#428bca"<#elseif '${record.state?if_exists}'=='3'>style="color:#0c0"</#if>>
	                          	<#if '${record.state?if_exists}'=='2'>待审核
	                          	<#elseif '${record.state?if_exists}'=='3'>上架
                          		</#if>
                          	</td>
                          <td>
	                          		<a href="${base}/show.action?code=ba_pproduct_audit&id=${record.id?if_exists}"">审核</a>
	                          		<a href="${base}/show.action?code=ba_pproduct_detail&id=${record.id?if_exists}">查看</a>
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

function present(id){
	window.location.href ="${base}/backstagemerchant/baporductpresent.action?id="+id;
}
function del(id){
	art.dialog.confirm('请确认，您是否要删除？', function(){
		window.location.href ="${base}/backstagemerchant/baporductdel.action?id="+id;
	});
	return true;
}
</script>
</html>
