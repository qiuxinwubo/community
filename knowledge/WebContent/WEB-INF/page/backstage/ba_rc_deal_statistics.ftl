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
        <div class="position">当前位置&nbsp;&nbsp;>&nbsp;&nbsp;平台管理员账户&nbsp;&nbsp;>&nbsp;&nbsp;<span>成交产品信息</span></div>
        <form id="form" action="${base}/show.action?code=ba_rc_deal_statistics" method="post">
			<input type="hidden" id="pageNo" name="pageNo" value="1" />
			<input type="hidden" id="menu"  value="7" />
			<center><input name="name" type="text" value="${args.name?if_exists}" /><input  class="btn01" type="submit" value="搜索">
        <table class="table01" border="0">
                  <tr>
                          <th>返回商家</th>
                          <th>购买者电话</th>
                          <th>成交数量</th>
                          <th>成交日期</th>
                          <th>跳转日期</th>
                          <th>创建日期</th>
                          <th>操作</th>
                  </tr>
                  <#list data.ds1 as record>
                   <tr>
                          <td><div class="text_long2"><#if '${record.company?if_exists}'=='1'>路浩<#elseif '${record.company?if_exists}'=='2'>知呱呱<#else>未知</#if></div></td>
                          <td>${record.phone?if_exists}</td>
                          <td>${record.product_num?if_exists}</td>
                          <td><#if record.deal_date?if_exists>${record.deal_date?string("yyyy-MM-dd")}<#else></#if></td>
                          <td><#if record.trans_date?if_exists>${record.trans_date?string("yyyy-MM-dd")}<#else></#if></td>
                          <td><#if record.create_time?if_exists>${record.create_time?string("yyyy-MM-dd")}<#else></#if></td>
                          <td><a href="${base}/show.action?code=ba_rc_deal_product_statistics&id=${record.id?if_exists}">查看详情</a></td>
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
</html>
