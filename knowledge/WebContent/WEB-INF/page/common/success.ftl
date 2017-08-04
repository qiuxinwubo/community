<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="${base}/common/js/jquery.min.js"></script>
<script src="${base}/common/artdialog/artDialog.js?skin=opera"></script>
<script type="text/javascript" src="${base}/common/artdialog/plugins/iframeTools.js"></script>
</head>
<body>
</body>
<script>
	//art.dialog.alert('${msg?if_exists}');	
	art.dialog({
		 content: "${msg?if_exists}",
		 icon: 'succeed',
		 lock:true,
		 time:1,
		 window: 'top',
		 close:function(){
	 		window.location.href="${base}/${url?if_exists}";
	     }
	});
	

</script>
</html>