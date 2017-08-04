<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>视频互联互通系统  点播详情</title>
	<link rel="stylesheet" type="text/css" href="${base}/vms/css/index.css">
	<script type="text/javascript" src="${base}/vms/js/jquery.min.js"></script>
	<script type="text/javascript" src="${base}/vms/js/index.js"></script>
</head>
<body>
	<div class="wsc-head clearfix">
	<#include "/frame/show_top_bar.ftl">
	</div>
	<div class="wsc-content clearfix">
	<#include "/frame/menu2.ftl">
		<div class="main-right">
			<div class="u-location">
				<span>您的位置：</span>
				<span>点播</span>
				<span>&gt;</span>
				<span>点播详情</span>
			</div>
			<#list data.ds1 as record>
			<div class="live-msg">
				<span>点播视频信息</span>
			</div>
			<div class="msg-box">
				<div class="col-state">
					<span>点播名称：</span>
				</div>
				<div class="col-fill">
					<span>${record.name?if_exists}</span>
				</div>
				<div class="clear"></div>
				<div class="col-state">
					<span>主讲人：</span>
				</div>
				<div class="col-fill">
					<span>${record.speaker?if_exists}</span>
				</div>
				<div class="clear"></div>
				<div class="col-state">
					<span>视频上传时间：</span>
				</div>
				<div class="col-fill">
					<span>${record.vid_createtime?if_exists}</span>
				</div>
				<div class="clear"></div>
				<div class="col-state">
					<span>是否登录用户观看：</span>
				</div>
				<div class="col-fill">
					<span><#if '${record.if_login?if_exists}'=='1'>是<#else>否</#if></span>
				</div>
				<div class="clear"></div>
				<div class="col-state">
					<span>视频标签：</span>
				</div>
				<div class="col-fill">
					<span><#list data.ds3 as record>${record.TAGS_CODE?if_exists}&nbsp;&nbsp;&nbsp;&nbsp;</#list></span>
				</div>
				<div class="clear"></div>
				<div class="col-state">
					<span>所属视频分类：</span>
				</div>
				<div class="col-fill">
					<span>${record.service_type?if_exists}</span>
				</div>
				<div class="clear"></div>
				<div class="col-state">
					<span>视频说明：</span>
				</div>
				<div class="col-fill">
					<span>${record.explain?if_exists}</span>
				</div>
				<div class="clear"></div>
			</div>
			<div class="video-set">
				<span>视频设置</span>
			</div>
			<div class="set-box">
				<div class="col-state">
					<span>点播视频封面：</span>
				</div>
				<div class="col-fill">
					<span>
						<img <#if '${record.cover?if_exists}' != ''>src="${base}/${record.cover?if_exists}/cast-detail.jpeg" onclick="showMaxImg();"<#else>src="${base}/vms/images/cast-detail.png"</#if>>
					</span>
				</div>
				<div class="clear"></div>
				<div class="col-state">
					<span>附件：</span>
				</div>
				<div class="col-fill">
					<#list data.ds2 as records>
					<span><a href="${base}/cast/download.action?fileId=${records.id?if_exists}">${records.file_name?if_exists}</a></span>
					</#list>
				</div>
				<div class="clear"></div>
			</div>
			</#list>
			<a href="javascript:void(0)" onclick="self.location=document.referrer;" class="del-back">返回</a>
			<div class="footer">
			</div>
		</div>
	</div>
	<div class="barrier" style="display: none;"></div>
	<div class="large-img" style="display: none;">
	<#list data.ds1 as record>
		<#if '${record.cover?if_exists}'!=""> <img id="imgMax" onclick="showMinImg();" src="${base}/${record.cover?if_exists}/cast_max.jpeg">
		<#else> <img id="imgMax" onclick="showMinImg();" src="${base}/vms/images/cast-detail.png"> </#if>
	</#list>
	</div>
</body>
</html>
<script>
$(".wsc-content .nav-left > ul > .nav-son > ul a").removeClass("nav-on");
$(".wsc-content .nav-left #video-manage").addClass("nav-on");
function showMinImg() {
	$("div.barrier").hide();
	$("div.large-img").hide();
}

function showMaxImg() {
	$("div.barrier").show();
	$("div.large-img").show();
}
</script>