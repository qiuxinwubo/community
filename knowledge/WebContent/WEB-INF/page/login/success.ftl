<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache,must-revalidate">
<META HTTP-EQUIV="Expires" CONTENT="0">
<script src="${base}/common/js/jquery.min.js" type="text/javascript"></script>
<script type="text/javascript" src="${base}/common/artdialog/artDialog.js?skin=opera"></script>
<script type="text/javascript" src="${base}/common/artdialog/plugins/iframeTools.js"></script>
</head>
<script type="text/javascript">
$(document).ready(function(){
	art.dialog({
				title: '提示信息',
				content: '${ems?if_exists}成功！',
				icon: 'succeed',
				lock:true,
				time:1.5,
				close:function(){
			     art.dialog.close();
			     <#if  '${url?if_exists}'!=''>
					var myUrl = '${url?if_exists}';
			     	window.location = window.decodeURIComponent(myUrl);
			     <#elseif '${code?if_exists}'!=''>
					window.location = '${base}/receptionaction/show.action?code=${code?if_exists}';
				 <#else>
					window.location = '${base}/receptionaction/show.action?code=re_index';
				 </#if>
				},
				 success:function(){
				  art.dialog.close();
				 <#if '${code?if_exists}'!=''>
					window.location = '${base}/receptionaction/show.action?code=${code?if_exists}';
				 </#if>
     }
		});
	});
</script>
<body>