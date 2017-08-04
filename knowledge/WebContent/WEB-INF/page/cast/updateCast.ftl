<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>视频互联互通系统  设置视频信息</title>
<link rel="stylesheet" type="text/css" href="${base}/vms/css/index.css">
<script type="text/javascript" src="${base}/common/js/jquery.min.js"></script>
<script type="text/javascript" src="${base}/common/js/jquery.form.min.js"></script>
<script type="text/javascript" src="${base}/vms/js/index.js"></script>
<script type="text/javascript" src="${base}/vms/js/common.js"></script>
<script type="text/javascript" src="${base}/vms/js/castCheck.js"></script>
<script type="text/javascript" src="${base}/common/artdialog/artDialog.js?skin=opera"></script>
<script type="text/javascript" src="${base}/common/artdialog/plugins/iframeTools.js"></script>
<script type='text/javascript' src="${base}/common/wdatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="${base}/ltrjs/lrz.pc.min.js"></script>
<script type="text/javascript" src="${base}/ltrjs/fulongImgPro.min.js"></script>

</head>
<body>
	<div class="wsc-head clearfix"><#include "/frame/show_top_bar.ftl"></div>
	<div class="wsc-content clearfix">
		<#include "/frame/menu2.ftl">
		<div class="main-right">
			<div class="u-location">
				<span>您的位置：</span> <span>视频点播</span> <span>&gt;</span> <span>视频点播监管</span>
				<span>&gt;</span> <span>设置点播视频信息</span>
			</div>

			<div class="live-msg">
				<span>点播信息</span>
			</div>
			<form id="form1" action="${base}/cast/saveUpdateCast.action" method="post" >
				<input type="hidden" name="id" value="${vmsCastInfo.id?if_exists}">
				<input type="hidden" id="cover" name="cover" value="${vmsCastInfo.cover?if_exists}">
				<div class="msg-box">
					<div class="col-state">
						<span>点播标题 ：</span>
					</div>
					<div class="col-fill">
						<span> <input type="text" class="itxt" name="name" id="name" value="${vmsCastInfo.name?if_exists}" onblur="checkSubject();"> 
						<em class="tips">*</em>
						<em class="tips" id="subjectError"></em>
						</span>
					</div>
					<div class="clear"></div>
					<div class="col-state">
						<span>主讲人：</span>
					</div>
					<div class="col-fill">
						<span> <input type="text" class="itxt" name="speaker" value="${vmsCastInfo.speaker?if_exists}"onblur="checkSpeaker();"> 
						<em class="tips">*</em>
						<em class="tips" id="speakerInfoError"></em>
						</span>
					</div>
					<div class="clear"></div>
					<div class="col-state">
						<span>是否登录用户观看：</span>
					</div>
					<div class="col-fill">
						<span> 
							<em class="choice"><input type="radio" name="ifLogin" value="1">是</em> 
							<em class="choice"><input type="radio" name="ifLogin" checked="checked" value="2">否</em>
						</span>
					</div>
				<div class="clear"></div>
				<div class="col-state">
					<span>视频标签：</span>
				</div>
				<div class="col-fill">
					<span>
						<#assign index = 1>
						<#list vmsDicTagsList as vmsDicTags>
						<em class="choice"><input type="checkbox" class="" value="${vmsDicTags.tagsCode?if_exists}" name="vmsDicTagsValues" <#if VmsCastTagsValues?index_of(vmsDicTags.tagsCode) != -1>checked</#if>>${vmsDicTags.tagsName?if_exists}</em>
						<#if index%5 == 0>
							<div class="clear"></div>
						</#if>
						<#assign index = index +1>
						</#list>
						<em class="tips">*</em>
						<em class="tips" id="vmsDicTagsError"></em>
					</span>
				</div>
				<div class="clear"></div>
					<div class="col-state">
						<span>所属视频分类：</span>
					</div>
					<div class="col-fill">
						<span> 
							<select name="serviceType" id="ServiceType" onblur="checkServiceType();">
								<option value="">--请选择--</option>
								<#list VmsDicServiceTypeList as serviceType>
									<option value="${serviceType.serviceTypeCode?if_exists}" <#if '${serviceType.serviceTypeCode?if_exists}' == '${vmsCastInfo.serviceType?if_exists}'>selected</#if>>${serviceType.serviceTypeName?if_exists}</option>
								</#list>
							</select> 
							<em class="tips">*</em>
							<em class="tips" id="serviceTypeError"></em>
						</span>
					</div>
					<div class="clear"></div>
					<div class="col-state">
						<span>视频说明：</span>
					</div>
					<div class="col-fill">
						<span> 
							<textarea name="explain" value="${vmsCastInfo.explain?if_exists}" onblur="checkDescription();">${vmsCastInfo.explain?if_exists}</textarea> 
							<em class="tips" id="descriptionError"></em>
						</span>
					</div>
					<div class="clear"></div>
				</div>
			</form>
				<div class="video-set">
					<span style='width:350px;'>点播设置（上传即提交，无需保存）</span>
				</div>
				<div class="set-box">
					<div class="col-state">
						<span>点播封面：</span>
					</div>
					<div class="col-fill">
					    <input type="file" id="file" style="display: none;" >
						<a href="javascript:void(0)" class="up-pic" onclick="document.getElementById('file').click();">上传图片(500*300px)</a>
					<span >
						<img id="imgShow" <#if '${vmsCastInfo.cover?if_exists}' == ''>src="${base}/vms/images/cast-detail.png"<#else>src="${base}/${vmsCastInfo.cover?if_exists}/cast-detail.jpeg"</#if>>
						<em style="color:red;display:inline-block*display:inline;*zoom:1;vertical-align:top;">*</em>
						<em class="tips" id="coverError"></em>
					</span>	
					</div>
					<div class="clear"></div>
					<div class="col-state">
						<span>添加附件：</span>
					</div>
						<div class="col-fill">
						   <form id="filesForm" action="${base}/cast/saveFiles.action" method="post" multiple="multiple" >
						    <input type="hidden" name="type" value="2"><!-- 直播1点播2 -->
						    <input type="hidden" name="vid" value="${vmsCastInfo.id?if_exists}"><!-- 直播/点播的id-->
							<input type="file" id="uploadFile" name = "uploadFile"  style="display:none;"><!-- 附件文件 -->
						   </form>
							<a href="javascript:void(0)" class="up-pic" onclick="document.getElementById('uploadFile').click();">上传文档</a>
							<div class="ppt-check" id="uploaded">
								<#list vmsFilesList as vmsFile>
									<span id="${vmsFile.id?if_exists}"><em>${vmsFile.fileName?if_exists}</em><a href="javascript:void(0)" onclick="delThis('${vmsFile.id?if_exists}')">删除</a></span>
								</#list>
							</div>
						</div>
					<div class="clear"></div>
				</div>
			<a href="javascript:void(0)" class="preserve" onclick="doPost1();">保存</a>
			<a href="${base}/show.action?code=cast_list" class="goBack" >返回</a>
			<div class="footer">
			</div>
		</div>
	</div>

<script type="text/javascript">
function checkSubject(){
	var val=$("#name").val();
	if(val==""){
		$("#subjectError").html("点播视频名称不能为空");
		return false;
	}
	if(val.length>128){
		$("#subjectError").html("点播视频名称不能超过128个字符");
		return false;
	}
	
	$("#subjectError").html("");
	return true;
}
//页面初始化
$(document).ready(function(){
	$(".wsc-content .nav-left > ul > .nav-son > ul a").removeClass("nav-on");
	$(".wsc-content .nav-left #video-manage").addClass("nav-on");
})
//提交信息form
function doPost1() {
	if(checkSubject()&&checkSpeaker()&&checkServiceType()&&checkCover()&&checkDescription()&&checkTags()){
		var val=$("#name").val();
		$.ajax({
			url:"${base}/cast/verifyNameCast.action",
			data:{name:val,id:'${vmsCastInfo.id?if_exists}'},
			success:function(data){
				if(data=="1"){
					$("#subjectError").html("点播视频名称已经存在！");
				}else{
					$("#form1").submit();
				}
			 },
			 error:function(){
					art.dialog.alert('操作失败，请于管理员联系！');
			 }
		});
	}
}
//上传封面
$("#file").change(function(){
    var file =$(this)[0].files[0];
    $.fulongImgLrz(file,"uploadImages/cast/${vmsCastInfo.id?if_exists}/","cast","${base}",returnImgPath,"cast");
}); 

returnImgPath = function(ret){
	$("input[name='covre']").val(ret);
		var src1="${base}/"+ret+"?t="+Math.random()*5;
		$("#imgShow").attr("src",src1);
		$("#cover").val("uploadImages/cast/${vmsCastInfo.id?if_exists}");
}
//上传附件
$("#uploadFile").change(function(){
	//获取文件名称
    var file = document.getElementById("uploadFile").value;
    var strFileName=file.replace(/^.+?\\([^\\]+?)(\.[^\.\\]*?)?$/gi,"$1");  //正则表达式获取文件名，不带后缀
	var FileExt=file.replace(/.+\./,"");   //正则表达式获取后缀
	if(FileExt == "sh" || FileExt == "bat" || FileExt == "exe" || FileExt == "SH" || FileExt == "BAT" || FileExt == "EXE"){
		art.dialog.alert('系统不支持该类型附件！');
	}else{
		//上传并获得文件id
		$("#filesForm").ajaxSubmit(
				{
					type:'POST',
					success:function(id){
							var htmldm = "<span id='"+id+"'><em>"+strFileName+"."+FileExt+"</em><a href='javascript:void(0)' onclick=delThis('"+id+"')>删除</a></span>";
					  		$("#uploaded").append(htmldm);
	  				},
	  				error:function(){}
	  	});
	}
}); 
//ajax删除附件
function delThis(id){
	$.post("${base}/cast/delFile.action",{id:id},function(){
		$("#"+id).remove();
  	});
}
</script>
</body>
</html>
