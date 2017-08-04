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
		<input type="hidden" id="menu" value="5">
        <div class="top" id="top"></div>
<div class="container">
         <div class="left"  id="left"></div>
  <div class="right">
        <div class="position">当前位置&nbsp;&nbsp;>&nbsp;&nbsp;平台管理员账户&nbsp;&nbsp;>&nbsp;&nbsp;<span>在线留言</span></div>
        <form id="form" action="${base}/show.action?code=ba_leave_word_list" method="post">
			<input type="hidden" id="pageNo" name="pageNo" value="1" />
		<table class="table03" border="0">
          <tr>
            <th width="100">前台显示</th>
            <th width="150">时间</th>
            <th width="150">账号</th>
            <th>留言</th>
            <th width="100">操作</th>
          </tr>
          <#list data.ds1 as record>
	          <tr>
	            <td><input name="" type="checkbox" value="${record.if_show?if_exists}" <#if '${record.if_show?if_exists}'=='1'>checked</#if> onclick="changeshow('${record.id?if_exists}',this);"/></td>
	            <td>${record.create_time?string("yyyy-MM-dd")}</td>
	            <td>
	            	<#if '${record.phone?if_exists}'!=''>${record.phone?if_exists}
	            	<#else>${record.user_name?if_exists}
	            	</#if>
	            </td>
	            <td class="text01">${record.content?if_exists}</td>
	            <td><a href="#" onclick="del('${record.id?if_exists}')">删除</a></td>
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

function changeshow(id,obj){
	var opera=$(obj);
	var value=opera.val();
	$.ajax({
		type : "POST",  
		url:"${base}/backstagemerchant/baleavewordchangeshow.action",
		data:{id:id,state:value},
		async:false,
		success:function(data){
			opera.val(data);
			if(data=="1"){
				opera.attr("checked",'true');
			}else{
				opera.removeAttr("checked");
			}
			art.dialog.alert('操作成功！');
		},
		error:function(){
			art.dialog.alert('操作失败，请于管理员联系！');
		}
	});
}
function del(id){
	art.dialog.confirm('请确认，您是否要删除？', function(){
		window.location.href ="${base}/backstagemerchant/baleaveworddel.action?id="+id;
	});
	return true;
}
</script>
</html>
