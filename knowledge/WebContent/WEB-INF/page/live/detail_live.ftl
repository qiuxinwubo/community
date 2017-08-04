<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>视频互联互通系统  直播详情</title>
<link rel="stylesheet" type="text/css" href="${base}/vms/css/index.css">
<script type="text/javascript" src="${base}/common/js/jquery.min.js"></script>
<script type="text/javascript" src="${base}/vms/js/index.js"></script>
<script type="text/javascript" src="${base}/vms/js/common.js"></script>
<script type="text/javascript"
	src="${base}/common/artdialog/artDialog.js?skin=opera"></script>
<script type="text/javascript"
	src="${base}/common/artdialog/plugins/iframeTools.js"></script>
<script type='text/javascript'
	src="${base}/common/wdatePicker/WdatePicker.js"></script>
</head>
<body>
	<div class="wsc-head clearfix"><#include
		"/frame/show_top_bar.ftl"></div>
	<div class="wsc-content clearfix">
		<#include "/frame/menu2.ftl"> <input type="hidden" id="role"
			value="${user.roleCode}" />
		<div class="main-right">
			<div class="u-location">
				<span>您的位置：</span> <span>直播</span> 
				<span>&gt;</span> <span>直播详情</span>
			</div>

			<div class="live-msg">
				<span>直播信息</span>
			</div>
			<div class="msg-box">
				<div class="col-state">
					<span>直播主题：</span>
				</div>
				<div class="col-fill">
					<span>${data.ds1.subject?if_exists}</span>
				</div>
				<div class="clear"></div>
				<div class="col-state">
					<span>直播开始时间：</span>
				</div>
				<div class="col-fill">
					<span>${data.ds1.start_time?if_exists}</span>
				</div>
				<div class="clear"></div>
				
				<div class="col-state">
						<span>直播结束时间：</span>
					</div>
					<div class="col-fill">
						 <span>${data.ds1.end_time?if_exists}</span>
					</div>
				<div class="clear"></div>
				<div class="col-state">
					<span>是否登录用户观看：</span>
				</div>
				<div class="col-fill">
					<span><#if data.ds1.if_Login =='1'> 是 <#else> 否 </#if></span>
				</div>
				<div class="clear"></div>
				<div class="col-state">
					<span>直播描述：</span>
				</div>
				<div class="col-fill">
					<span>${data.ds1.description?if_exists}</span>
				</div>
				<div class="clear"></div>
				<div class="col-state">
					<span>直播议程：</span>
				</div>
				<div class="col-fill">
					<span>${data.ds1.plan?if_exists}</span>
				</div>
				<div class="clear"></div>
				<div class="col-state">
					<span>演讲者：</span>
				</div>
				<div class="col-fill">
					<span>${data.ds1.speaker_info?if_exists}</span>
				</div>
				
				<div class="clear"></div>
				
				<#if '${data.ds1.if_status?if_exists}'=='3'>
				<div class="col-state">
					<span>审核意见：</span>
				</div>
				<div class="col-fill">
					<span>${data.ds1.audit_comment?if_exists}</span>
				</div>
				
				<div class="clear"></div>
				</#if>
			</div>
			<div class="video-set">
				<span>视频设置</span>
			</div>
			<div class="set-box">
				<div class="col-state">
					<span>直播封面：</span>
				</div>
				<div class="col-fill">
					<span> <#if '${data.ds1.covre?if_exists}'!=""> <img
						id="imgShow" onclick="showMaxImg();"
						src="${base}/${data.ds1.covre?if_exists}/live-detail.jpeg">
						<#else> <img id="imgShow" onclick="showMaxImg();"
						src="${base}/vms/images/live-detail.jpeg"> </#if>
					</span>
				</div>
				<div class="clear"></div>
				<div class="col-state">
					<span>附件：</span>
				</div>
				<div class="col-fill">
					<#list data.ds2 as record> 
					<span>
					<a href="${base}/cast/download.action?fileId=${record.id?if_exists}">${record.file_name}</a>
					</span>
					</#list>
				</div>
				<div class="clear"></div>
			</div>
			<a href="${base}/show.action?code=${args.supCode?if_exists}" class="del-back">返回</a>
			<div class="footer" id="under"></div>
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
</body>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						var roleCode = $("#role").val();
						$(".wsc-content .nav-left > ul > .nav-son > ul a")
								.removeClass("nav-on");
						if (roleCode == '6') {
							$(".wsc-content .nav-left #live-manage").addClass(
									"nav-on");
						} else {
							$(".wsc-content .nav-left #my-manage-live")
									.addClass("nav-on");
						}
					})
	function showMinImg() {
		$("div.barrier").hide();
		$("div.large-img").hide();
	}

	function showMaxImg() {
		$("div.barrier").show();
		$("div.large-img").show();
	}
</script>
</html>