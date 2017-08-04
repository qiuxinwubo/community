<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>视频互联互通系统  修改直播</title>
<link rel="stylesheet" type="text/css" href="${base}/vms/css/index.css">
<script type="text/javascript" src="${base}/common/js/jquery.min.js"></script>
<script type="text/javascript" src="${base}/common/js/jquery.form.min.js"></script>
<script type="text/javascript" src="${base}/vms/js/index.js"></script>
<script type="text/javascript" src="${base}/vms/js/common.js"></script>
<script type="text/javascript" src="${base}/common/js/uuid.js"></script>
<script type="text/javascript"
	src="${base}/common/artdialog/artDialog.js?skin=opera"></script>
<script type="text/javascript"
	src="${base}/common/artdialog/plugins/iframeTools.js"></script>
<script type='text/javascript'
	src="${base}/common/wdatePicker/WdatePicker.js"></script>
	<script type='text/javascript' src="${base}/vms/js/liveTimeCheck.js"></script>
	<script type="text/javascript" src="${base}/ltrjs/lrz.pc.min.js"></script>
	<script type="text/javascript" src="${base}/ltrjs/fulongImgPro.min.js"></script>
</head>
<body>
	<div class="wsc-head clearfix" id="top"></div>
	<div class="wsc-content clearfix">
		<#include "/frame/menu2.ftl">
		<div class="main-right">
			<div class="u-location">
				<span>您的位置：</span> <span>直播</span> <span>&gt;</span> <span>我管理的直播</span>
				<span>&gt;</span> <span>直播修改</span>
			</div>

			<div class="live-msg">
				<span>直播信息</span>
			</div>
			<form  id="form1"action="${base}/live/updateLive.action" method="post">
				<input type="hidden" name="id" id="id" value="${data.ds1.id?if_exists}">
				<div class="msg-box">
					<div class="col-state">
						<span>直播主题：</span>
					</div>
					<div class="col-fill">
						<span> <input type="text" name="subject" class="itxt" 
							value="${data.ds1.subject?if_exists}" onblur="checkSubject();">
						    <em class="tips">*</em><em class="tips" id="subjectError"></em>
						</span>
					</div>
					<div class="clear"></div>
					<div class="col-state">
						<span>直播开始时间：</span>
					</div>
					<div class="col-fill">
						<span><input type="text" id="startTime" name="startTime" onblur="checkStartTime1();" class="itxt" 
								value="${data.ds1.start_time?if_exists}"
								onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})">
									<em class="tips">*</em><em class="tips" id="startTimeError"></em>
								</span>
					</div>
					<div class="clear"></div>
					<div class="col-state">
						<span>直播结束时间：</span>
					</div>
					<div class="col-fill">
						 <span><input type="text" name="endTime" id="endTime" class="itxt" 
								onblur="checkEndTime();"value="${data.ds1.end_time?if_exists}"
								onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})">
									<em class="tips">*</em><em class="tips" id="endTimeError"></em>
								</span>
					</div>
					<div class="clear"></div>
					<div class="col-state">
						<span>是否登录用户观看：</span>
					</div>
					<div class="col-fill">
						<span> <em class="choice"><input type="radio"
								name="ifLogin" value="1"<#if
								data.ds1.if_Login  =='1'>checked="checked"</#if> >是</em> <em
							class="choice"><input type="radio" name="ifLogin"
								value="2"<#if data.ds1.if_Login=='2'>checked="checked"</#if>>否</em>
						</span>
					</div>
					<div class="clear"></div>
					<div class="col-state">
						<span>直播描述：</span>
					</div>
					<div class="col-fill">
						<span> <textarea name="description" onblur="checkdescription();">${data.ds1.description?if_exists}</textarea>
						<em class="tips" style="display:none"
							id="descriptionError"></em>
						</span>
					</div>
					<div class="clear"></div>
					<div class="col-state">
						<span>直播议程：</span>
					</div>
					<div class="col-fill">
						<span> <textarea name="plan" onblur="checkplan();">${data.ds1.plan?if_exists}</textarea>
						<em class="tips" style="display:none"id="planError"></em>
						</span>
					</div>
					<div class="clear"></div>
					<div class="col-state">
						<span>演讲者：</span>
					</div>
					<div class="col-fill">
						<span> <textarea name="speakerInfo" onblur="checkspeakerInfo();">${data.ds1.speaker_info?if_exists}</textarea>
						 <em class="tips"
							id="speakerInfoError" style="display:none"></em>
						</span>
					</div>
					<div class="clear"></div>
				</div>
				  <input type="hidden" name="covre" value="${data.ds1.covre?if_exists}">
				</form>
				<div class="video-set">
					<span style='width:350px;'>视频设置（上传即提交，无需保存）</span>
				</div>
				<div class="set-box">
					<div class="col-state">
						<span>直播封面：</span>
						
					</div>
					<div class="col-fill">
					
						<a href="javascript:void(0)" class="up-pic" onclick="document.getElementById('file').click();">上传图片(500*300px)</a> 
						<span>
						<#if '${data.ds1.covre?if_exists}'!="">
						<img id="imgShow" onclick="showMaxImg();" src="${base}/${data.ds1.covre?if_exists}/live-detail.jpeg">
						 <#else>
						<img id="imgShow" onclick="showMaxImg();" src="${base}/vms/images/live-detail.jpeg">
						 </#if>
					</span>	
					</div>
					<div class="clear"></div>
					<div class="col-state">
						<span>添加附件：</span>
					</div>
					<div class="col-fill">
					<form id="filesForm" action="${base}/cast/saveFiles.action" method="post" multiple="multiple" >
						    <input type="hidden" name="type" value="1"><!-- 直播1点播2 -->
						    <input type="hidden" name="vid" value="${data.ds1.id?if_exists}"><!-- 直播/点播的id-->
							<input type="file" id="uploadFile" name = "uploadFile" style="display: none;" ><!-- 附件文件 -->
				   </form>
				   	<a href="javascript:void(0)" class="up-pic" onclick="document.getElementById('uploadFile').click();">上传文档</a>
						<div class="ppt-check" id="uploaded">
							<#list data.ds2 as record>
									<span id="${record.id?if_exists}"><em>${record.FILE_NAME?if_exists}</em><a href="javascript:void(0)" onclick="delThis('${record.id?if_exists}')">删除</a></span>
							</#list>
						</div>
					</div>

					<div class="clear"></div>
				</div>
				
				 <input  type="file" id="file" accept="image/*" style="display: none;" >
					 <a href="javascript:void(0)" class="preserve" onclick="doPost1();">保存</a>
			         <a href="javascript:void(0)"onClick="history.go(-1)" class="goBack">返回</a>
			<div class="footer" id="under">
			</div>
		</div>
	</div>
	<div class="barrier" style="display: none;"></div>
	<div class="large-img" style="display: none;">
		<#if '${data.ds1.covre?if_exists}'!=""> <img id="imgMax"
			onclick="showMinImg();"
			src="${base}/${data.ds1.covre?if_exists}/live_max.jpeg">
		<#else> <img id="imgMax" onclick="showMinImg();"
			src="${base}/vms/images/live_max.jpeg"> </#if>
	</div>
	<script type="text/javascript">
	
	function doPost1(){
		if(checkSubject()  && checkStartTime() && checkEndTime() && timeSearch()&&  checkdescription()	&& checkplan() && checkspeakerInfo()){
			$("#form1").submit();
			}
	}
	function checkStartTime1(){
		var val=$("input[name='startTime']").val();
		if(val==""){
			$("#startTimeError").html("开始时间不能为空");
			return false;
		}
		$("#startTimeError").html("");
		return true;
	}
	
	$(document).ready(function(){
		$(".wsc-content .nav-left > ul > .nav-son > ul a").removeClass("nav-on");
		$(".wsc-content .nav-left #my-manage-live").addClass("nav-on");
		var id = getUuid();
		$("#id1").val(id);
	})
	</script>
	<script>
	$("#file").change(function(){
	        var file =$(this)[0].files[0];
	    //alert("uuid"+uuid);
	fulongImgLrz(file,"uploadImages/live/${data.ds1.id?if_exists}/","live","${base}",returnImgPath,"live");
	}); 
	
	returnImgPath = function(ret){
		var n=ret.lastIndexOf("/");
		var bbn=ret.substring(0,n);
		$("input[name='covre']").val(bbn);
		var src1="${base}/"+ret+"?t="+Math.random()*5;
		var src2="${base}/"+bbn+"/live_max.jpeg?t="+Math.random()*5;
		$("#imgShow").attr("src",src1);
		$("#imgMax").attr("src",src2);
	}
	
	//上传附件
	$("#uploadFile").change(function(){
		//获取文件名称
	    var file = document.getElementById("uploadFile").value;
	    if(!isRightFileType(file,new Array("sh", "bat","exe"))){
	    var strFileName=file.replace(/^.+?\\([^\\]+?)(\.[^\.\\]*?)?$/gi,"$1");  //正则表达式获取文件名，不带后缀
		var FileExt=file.replace(/.+\./,"");   //正则表达式获取后缀
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
	    }else{
			art.dialog.alert('系统不支持该类型附件！');
		}}); 
	//ajax删除附件
	function delThis(id){
		$.post("${base}/cast/delFile.action",{id:id},function(){
			$("#"+id).remove();
	  	});
	}
</script>
</body>
</html>
