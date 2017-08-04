<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>视频互联互通系统  创建直播</title>
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
	<div class="wsc-head clearfix" >	
	<#include "/frame/show_top_bar.ftl">
	</div>
	<div class="wsc-content clearfix">
		<#include "/frame/menu2.ftl">
		<div class="main-right">
			<div class="u-location">
				<span>您的位置：</span> <span>直播</span> <span>&gt;</span> <span>我管理的直播</span>
				<span>&gt;</span> <span>新建直播</span>
			</div>

			<div class="live-msg">
				<span>直播信息</span>
			</div>
			<form  id="form1" action="${base}/live/createLiver.action" method="post"  enctype="multipart/form-data">
				<input type="hidden" id="id" name="id" value="" />
				<div class="msg-box">
					<div class="col-state">
						<span>直播主题<em class="tips">*</em>：</span>
					</div>
					<div class="col-fill">
						<span> <input type="text" class="itxt" name="subject"
							onblur="checkSubject();">  <em
							class="tips" id="subjectError"></em>
						</span>
					</div>
					<div class="clear"></div>
					<div class="col-state">
						<span>直播开始时间<em
							class="tips">*</em>：</span>
					</div>
					<div class="col-fill">
						<span><input type="text" class="itxt" name="startTime"
							readonly="readonly" id="startTime" onblur="checkStartTime();"
							onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"> <em class="tips" id="startTimeError"></em> </span>
					</div>
					<div class="clear"></div>
					<div class="col-state">
						<span>直播结束时间<em
							class="tips">*</em>：</span>
					</div>
					<div class="col-fill">
						<span><input type="text" class="itxt" name="endTime"
							readonly="readonly" onblur="checkEndTime();" id="endTime"
							onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"> <em class="tips" id="endTimeError"></em> </span>
					</div>
					<div class="clear"></div>
					<div class="col-state">
						<span>是否登录用户观看：</span>
					</div>
					<div class="col-fill">
						<span> <em class="choice"><input type="radio"
								name="ifLogin" value="1">是</em> <em class="choice"><input
								type="radio" name="ifLogin" checked="checked"
								value="2">否</em>
						</span>
					</div>
					<div class="clear"></div>
					<div class="col-state">
						<span>直播描述：</span>
					</div>
					<div class="col-fill">
						<span> <textarea name="description"
								onblur="checkdescription();"></textarea>
			 <em class="tips" style="display:none"
							id="descriptionError"></em>
						</span>
					</div>
					<div class="clear"></div>
					<div class="col-state">
						<span>直播议程：</span>
					</div>
					<div class="col-fill">
						<span> <textarea name="plan" onblur="checkplan();"></textarea>
							<em class="tips" style="display:none" id="planError"></em>
						</span>
					</div>
					<div class="clear"></div>
					<div class="col-state">
						<span>演讲者：</span>
					</div>
					<div class="col-fill">
						<span> <textarea name="speakerInfo"
								onblur="checkspeakerInfo();"></textarea> <em  style="display:none" class="tips"
							id="speakerInfoError"></em>
						</span>
					</div>
					<div class="clear"></div>
				</div>
				<input type="hidden"name="covre"> 
			</form>
				<div class="video-set">
					<span>视频设置</span>
				</div>
				<div class="set-box">
					<div class="col-state">
						<span>直播封面：</span>
					</div>
					<div class="col-fill">
						 <a
							href="javascript:void(0)" class="up-pic"
							onclick="document.getElementById('file').click();">上传图片(500*300px)</a>
						<span> <img id="imgShow"  width="120px" height="90px" onclick="showMaxImg();"  src="">
						<form  id="coverForm"action="${base}/live/uploadCovre.action" method="post" multiple="multiple">
						 <input type="hidden" name="id"  id="coverId" value="">
						<input type="file" id="file" name="file" accept="image/*" style="display: none;">
						</form>
						</span>
					</div>
					<div class="clear"></div>
					<div class="col-state">
						<span>添加附件：</span>
					</div>
					<div class="col-fill">
					       <form id="filesForm" action="${base}/cast/saveFiles.action" method="post" multiple="multiple" >
						    <input type="hidden" name="type" value="1"><!-- 直播1点播2 -->
						    <input type="hidden" name="vid" value=""><!-- 直播/点播的id-->
							<input type="file" id="uploadFile" name = "uploadFile" style="display: none;" ><!-- 附件文件 -->
						   </form>
						<a href="javascript:void(0)" class="up-pic" onclick="document.getElementById('uploadFile').click();">上传文档</a>
						<div class="ppt-check" id="uploaded" >
							
						</div>
					</div>
					<div class="clear"></div>
				</div>
			
			
			<a href="javascript:void(0)" class="preserve" onclick="doPost1();">保存</a>
			<a href="javascript:void(0)" onClick="history.go(-1)" class="goBack">返回</a>

			<div class="footer" id="under">
			</div>
		</div>
	</div>

<div class="barrier" style="display: none;"></div>
	<div class="large-img" style="display: none;">
		 <img id="imgMax"  width="551px" height="330px" onclick="showMinImg();"
			src=""> 
	</div>
	<script type="text/javascript">
		$(document).ready(
				function() {
					var uuid = getUuid();
					$("#id").val(uuid);
					$("input[name='vid']").val(uuid);
					$("#coverId").val(uuid);
					window.uuid = uuid;
					$(".wsc-content .nav-left > ul > .nav-son > ul a")
							.removeClass("nav-on");
					$(".wsc-content .nav-left #my-manage-live").addClass(
							"nav-on");

				})
$("#file").change(function(){
	$("#coverForm").ajaxSubmit(
			{
				type:'POST',
				success:function(ret){
					alert(ret);
  				    $("#imgShow").attr("src",'${base}/'+ret+"?t="+Math.random()*5);
  			    	$("#imgMax").attr("src",'${base}/'+ret+"?t="+Math.random()*5);
  			    	$("input[name='covre']").val(ret);
				},
  				error:function(){
  					
  					alert("error");
  				}
  	});
})

	//上传附件
$("#uploadFile").change(function(){
	//获取文件名称
    var file = document.getElementById("uploadFile").value;
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
  				error:function(){
  					
  					alert("error");
  				}
  	});
}); 
//ajax删除附件
function delThis(id){
	$.post("${base}/cast/delFile.action",{id:id},function(){
		$("#"+id).remove();
  	});
}

		function doPost1() {
			if (timeSearch() && checkSubject() && checkStartTime()
					&& checkEndTime() && checkdescription() && checkplan()
					&& checkspeakerInfo()) {
				$("#form1").submit();
			}
		}
	</script>
	
</body>
</html>
