<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<script src="${base}/common/js/jquery.min.js"></script>
<script src="${base}/common/artdialog/artDialog.js?skin=opera"></script>
<script type="text/javascript" src="${base}/common/artdialog/plugins/iframeTools.js"></script>
</head>
<body>
</body>
<script>
top.art.dialog({
	 content: '<#if msg?exists>  <#if '${msg?if_exists}'==''>操作成功 <#else> ${msg?if_exists} </#if><#else>操作成功</#if>',
	 icon: 'succeed',
	 lock:true,
	 time:2,
	 window : 'top',
	 close:function(){
	 	if('${url?if_exists}'==''){
			window.location.href="${base}/frame.action";
		}else{
			window.location.href="${base}/${url?if_exists}";
		}
     }
});
</script>
</html>
