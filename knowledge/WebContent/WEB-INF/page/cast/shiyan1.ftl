<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>视频互联互通系统  操作成功</title>
<script src="${base}/common/js/jquery.min.js"></script>
<script src="${base}/knowledge/css/index.css"></script>
<script src="${base}/common/artdialog/artDialog.js?skin=opera"></script>
<script type="text/javascript" src="${base}/common/artdialog/plugins/iframeTools.js"></script>
<script>
</script>
</head>
<body>
<table>
<#list data.ds2 as record>
<tr>
	<td>id:</td><td>${record.id}</td>
</tr>
<tr>
	<td>图片地址：</td><td>${record.IMAGE_URL}</td>
</tr>
</#list>
</table>
123132123123484
</body>
</html>
