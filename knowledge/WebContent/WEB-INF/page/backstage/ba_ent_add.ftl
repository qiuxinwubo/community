<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>知识产权</title>
	<link rel="shortcut icon" type="image/x-icon" href="${base}/common/images/icon.ico" media="screen" />
    <link href="${base}/knowledge/css/style.css" rel="stylesheet" type="text/css" />
	<script type='text/javascript' src='${base}/common/js/jquery.min.js'></script>
	<script type='text/javascript' src='${base}/common/js/jquery.form.js'></script>
	<script type='text/javascript' src='${base}/knowledge/js/common.js'></script>
    <!-- 弹出层 -->
    <script type="text/javascript" src="${base}/common/artdialog/artDialog.js?skin=opera"></script>
    <script type="text/javascript" src="${base}/common/artdialog/plugins/iframeTools.js"></script>
<body>
		<div class="top" id="top"></div>
<div class="container">
        <div class="left"  id="left"></div>
  <div class="right">
        <div class="position">当前位置&nbsp;&nbsp;>&nbsp;&nbsp;平台管理员账户&nbsp;&nbsp;>&nbsp;&nbsp;<span>商品上传</span></div>
        <form id="form"  action="${base}/backstagemerchant/baentsave.action"  method="post">
        <input type="hidden" id="menu"  value="4" />
        <input type="hidden" id="sign" name="sign" value="${sign}" />
        <input type="hidden" id="id" name="id"  value="${ipEnterprise.id}" />
                    <div>
                    <label><span style="color:red">*</span>企业名称：</label>
                    <input name="entName" type="text" value="${ipEnterprise.entName}" onblur="verifyname();" id="name"/>
                    <span class="verify" id="verifyname"  style="width:180px;"></span>
                    </div>
                    <div>
                    <label><span style="color:red">*</span>咨询链接：</label>
                    <input name="advisoryUrl" type="text" value="${ipEnterprise.advisoryUrl}" onblur="verifyadvisoryurl();" id="advisoryUrl"/>
                    <span class="verify" id="verifyadvisoryUrl" style="width:180px;"></span>
                    </div>
                    <div>
                    		<a href="javascript:void(0)" onclick="submit();" class="save" style="margin-left:208px;">保存</a>
                    		<a href="javascript:history.go(-1);" class="save">返回</a>
                    </div>
        </form>
    	<form  id="fileForm"  method="post" multiple="multiple">
    		 <input type="file" onchange="fileUpload(this)"class='noExecute' id="file" hidden="hidden" name="docFile">
		</form>
     <div id="under"></div>
  </div>
</div>
</body>
	<script type='text/javascript'>
	function verifyname(){
		var name=$("#name");
		var value=name.val();
		if(value==""){
			$("#verifyname").html("企业名称不能为空！");
			return false;
		}
		if(value.length>30){
			$("#verifyname").html("企业名称不能大于30个字符！");
			return false;
		}
		$("#verifyname").html("");
		return true;
	}
	function verifyadvisoryurl(){
		var name=$("#advisoryUrl");
		var value=name.val();
		if(value==""){
			$("#verifyadvisoryUrl").html("咨询链接不能为空！");
			return false;
		}
		if(value.length>512){
			$("#verifyadvisoryUrl").html("咨询链接不能大于512个字符！");
			return false;
		}
		$("#verifyadvisoryUrl").html("");
		return true;
	}
	function submit(){
		if(verifyname()&&verifyadvisoryurl()){
			doSearch();
		}
	}
	</script>
</html>
