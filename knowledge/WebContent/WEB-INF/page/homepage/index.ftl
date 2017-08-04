<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>正在播放：<#if '${videoType?if_exists}' == '1'>${vmsLiveInfo.subject?if_exists}</#if><#if '${videoType?if_exists}' == '2'>${vmscastinfo.name?if_exists}</#if></title>
	<link rel="stylesheet" type="text/css" href="${base}/vms/css/index.css">
	<script type="text/javascript" src="${base}/vms/js/jquery.min.js"></script>
	<script type="text/javascript" src="${base}/vms/js/index.js"></script>
	<script type="text/javascript" src="http://live.smebj.cn/webcast/static/sdk/js/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="http://live.smebj.cn/webcast/static/sdk/js/gssdk.js"></script>
	<script type="text/javascript" src="http://live.smebj.cn/webcast/static/sdk/js/json2.js"></script>
	<script type="text/javascript" src="http://live.smebj.cn/webcast/static/sdk/js/tester.js"></script>
	<script type="text/javascript" src="${base}/common/artdialog/artDialog.js?skin=opera"></script>
	<script type="text/javascript" src="${base}/common/artdialog/plugins/iframeTools.js"></script>
</head>
<style>
	.Media .Container .wnmain .info .content .onPlay p{word-break:break-all;}
	.Media .Container .wnmain .info .content .onPlay p span.left{display:inline-block;*display:inline;*zoom:1;width:100px;text-align:right;vertical-align:top;}
	.Media .Container .wnmain .info .content .onPlay p span.right{display:inline-block;*display:inline;*zoom:1;vertical-align:top;width:207px;word-break:break-all;}
	.Media .Container .wnmain .info .content{overflow:auto;}
	.Media .Container .wnmain .info .shoucang{bottom:0px;right:25px;}
</style>
<#if '${videoType?if_exists}' == '1'>
<style>
	.mains {width:730px;height: 540px;background:#ddd;position: relative;float:left;}
	.video {width:100%;height:100%;position:absolute;top:0;left:0;z-index: 2;}
		.vbtn {width:15px;height:15px;position: absolute;right:0;top:0;background:url('${base}/vms/images/bb_03.png') no-repeat;background-size:15px 15px;z-index: 99999;}
		.ppt {width:160px;height:160px;position: absolute;top:0;right:0;z-index: 3;}
		.pptbtn {width:15px;height:15px;position: absolute;right:0;top:0;
			background:url('${base}/vms/images/bb_03.png') no-repeat;
			background-size:15px 15px;
			z-index: 99999;
		}
</style>
<script type="text/javascript">
$(function(){
		$('.ppt').click(function(event) {
			$('.ppt').css('width', '730px').css('height', '540px').css('top', '0').css('left', '0').css('z-index', '2');
			$('.video').css('width', '160px').css('height', '160px').css('top', '0').css('left', '570px').css('z-index', '3');
			$('.vbtn').css('display', 'block');
			
		});

		$('.video').click(function(event) {
			$('.video').css('width', '730px').css('height', '540px').css('top', '0').css('left', '0').css('z-index', '2');
			$('.ppt').css('width', '160px').css('height', '160px').css('top', '0').css('left', '570px').css('z-index', '3');
			$('.pptbtn').css('display', 'block');
			
		});
	})

</script>
</#if>
<script>
$(function(){
	//热门推荐
	$.ajax({
		url : "${base}/show.action?code=commend",
		type : 'POST',
		success : function(data) {
			$("#commend").html(data);
		}
	});
})
<!--收藏-->
function collect(id){
	$.ajax({
	      type: "post",
	      url: "${base}/home/collectVideo.action?id="+id,
	      async: false,
	      success: function(data) {
	      	art.dialog.alert(data,function(){
	        });
	       },error:function(){
	       	art.dialog.alert('收藏失败',function(){
	        });
	       }
	 })
}

function iflog(){
	art.dialog.alert('请登录后收藏',function(){
		
	}); 
}

</script>
<body>
	<div class="g-head">
		<div class="g-head-mid">
			<div class="logoBox">
					<a href="${base}/html/index.html" class='linkEixt'><img src="${base}/vms/images/link2_03.png" alt=""></a>
					<a href="${base}/html/index.html" class='lineStyle lineStyle2'></a>
					<a href="${base}/html/index.html" class='linkEixt2'><img src="${base}/vms/images/link2_05.png" alt=""></a>
				</div>
			<div class="ad-in">
				<div class="search-con">
					<#if '${user.username?if_exists}'==''>
							<span class="ren ren-index"><a style="color:#fff;"href="http://www.smebj.cn/portal/zxjpt/jsp/homeSubmit.jsp?targetUrl=http://video.smebj.cn/vms/html/index.html">登录</a></span> 
						<#else>
							<#if '${user.belongorgType?if_exists}' == '6'||'${user.belongorgType?if_exists}' == '5'||'${user.belongorgType?if_exists}' == '4'>
								<span class="ren-right"><img src="${base}/vms/images/ren.png" alt=""></span>
								<span class="help">
									<span class='user'>用户中心</span>
									<div class="hid" style='display:none;'>
										<div class="sho2">
											<div class="sho2">
												<a href="${base}/show.action?code=favourite"><span>个人收藏</span></a>
											</div>
										</div>
										<div class="sho2">
											<a href="${base}/show.action?code=list_live"><span>管理后台</span></a>
										</div>
									</div>
								</span>
							<#else>
								<span class="ren-right"><img src="${base}/vms/images/ren.png" alt=""></span>
								<span class="help">
								<span class='user'>用户中心</span>
									<div class="hid" style='display:none;'>
											<div class="sho2">
												<a href="${base}/show.action?code=favourite"><span>个人收藏</span></a>
											</div>
											<div class="sho2">
												<a href="${base}/show.action?code=record"><span>观看记录</span></a>
											</div>
									</div>
								</span>
							</#if>
						</#if>
				</div>
			</div>
		</div>
	</div>
	<div class="Media">
		<div class="Container">
			<div class="wnmain">
			<#if '${videoType?if_exists}' == '1'>
				<!-- 正式域名：live.smebj.cn，测试域名：xiaoanyun.wepvision.com(已停用) -->
				<div class="mains">
				<div class="temporary" style="display:inline;"><img src="${base}/${vmsLiveInfo.covre?if_exists}/live_max.jpeg" alt=""></div>
					<div class="ppt">
						<div class="pptbtn">
						</div>
						<gs:doc site="live.smebj.cn" ctx="webcast" ownerid="${vmsLiveInfo.vidId?if_exists}" authcode="${vmsLiveInfo.attendeeToken?if_exists}" uid="" uname="" compress="false"fullscreen="true" style="z-index:0;"/>
					</div>
					<div class="video">
						<div class="vbtn">			
						</div>
						<gs:video-live video="" site="live.smebj.cn" ctx="webcast" ownerid="${vmsLiveInfo.vidId?if_exists}" authcode="${vmsLiveInfo.attendeeToken?if_exists}" uid="" uname="" password="" k="" group="" logip="" logport="" logid="" completed="onCompleted"  compress="false" showchatinanycase="" stream="" embednetsettings="" batchrecchat="" style="z-index:0;"/>
					</div>
				</div>
			</#if>
			<#if '${videoType?if_exists}' == '2'>
				<div class="video">
				<gs:video-vod id="videoComponent" site="live.smebj.cn" ctx="webcast" ownerid="${vmscastinfo.vidId?if_exists}" authcode="${vmscastinfo.vidPassword?if_exists}" />
				</div>
			</#if>
				<div class="info">
					<div class="title">
						<ul>
							<#if '${videoType?if_exists}' == '1'>
								<li><a href="javascript:void(0)" class="active">直播信息</a></li>
								<li><a href="javascript:void(0)">直播议程</a></li>
								<li><a href="javascript:void(0)">直播附件</a></li>
							</#if>
							<#if '${videoType?if_exists}' == '2'>
								<li><a href="javascript:void(0)" class="active">点播信息</a></li>
								<li><a href="javascript:void(0)">点播附件</a></li>
							</#if>
						</ul>
					</div>
					<div class="content">
						<#if '${videoType?if_exists}' == '1'>
							<div class="onPlay xinxi">
								<h4>${vmsLiveInfo.subject?if_exists}</h4>
								<p><span class="left">直播开始时间：</span><span class="right">${vmsLiveInfo.startTime?string('yyyy-MM-dd HH:mm')}</span></P>
								<p><span class="left">直播结束时间：</span><span class="right">${vmsLiveInfo.endTime?string('yyyy-MM-dd HH:mm')}</span></P>
								<p><span class="left">直播描述：</span><span class="right"><#if vmsLiveInfo.description?length lte 100>${vmsLiveInfo.description?if_exists}<#else>${vmsLiveInfo.description[0..99]}...</#if></span></p>
								<p><span class="left">主讲人信息：</span><span class="right">${vmsLiveInfo.speakerInfo?if_exists}</span></p>
							</div>
							<div class="onPlay yicheng" style="display:none;">
								<p>直播议程：${vmsLiveInfo.plan?if_exists}</p>
							</div>
							<div class="onPlay fujian" style="display:none;">
								<p class="fujian">直播附件：</p>
								<div>
									<#list vmsfiles as record>
										<a href="${base}/cast/download.action?fileId=${record.id?if_exists}">${record.fileName?if_exists}</a>
									</#list>
								</div>
							</div>
						</#if>
						<#if '${videoType?if_exists}' == '2'>
							<div class="onPlay xinxi">
								<h4><#if vmscastinfo.name?length lte 100>${vmscastinfo.name?if_exists}<#else>${vmscastinfo.name[0..99]}...</#if></h4>
								<p><span class="left">主讲人姓名：</span><span class="right">${vmscastinfo.speaker?if_exists}</span></P>
								<p><span class="left">上传时间：</span><span class="right">${vmscastinfo.vidCreatetime?if_exists}</span></p>
								<p><span class="left">视频说明：</span><span class="right">${vmscastinfo.explain?if_exists}</span></p>
								<div style="height:20px;"></div>
								<div class="shoucang">
									<#if '${user.username?if_exists}' !="">
										<a href="javascript:void(0)" onclick="collect('${vmscastinfo.id?if_exists}')">加入收藏</a>
									<#else>
										<a href="javascript:void(0)" onclick="iflog()">加入收藏</a>
									</#if>
								</div>
							</div>
							<div class="onPlay fujian" style="display:none;">
								<p class="fujian">点播附件：</p>
								<div>
									<#list vmsfiles as record>
										<a href="${base}/cast/download.action?fileId=${record.id?if_exists}">${record.fileName?if_exists}</a>
									</#list>
								</div>
							</div>
						</#if>						
					</div>
				</div>
			</div>
			<div class="wntab"><span><#if '${videoType?if_exists}' == '1'>${vmsLiveInfo.subject?if_exists}</#if><#if '${videoType?if_exists}' == '2'>${vmscastinfo.name?if_exists}</#if></span></div>
		</div>
		<!-- 推荐 -->
		<div id="commend">
		
		</div>
		
		
	<!-- 底部 -->
	<div class="bottom">
		<ul>
			<li>
				<a href="javascript:void(0)">关于我们</a>
				<i>|</i>
				<a href="javascript:void(0)">联系我们</a>
				<i>|</i>
				<a href="javascript:void(0)">帮助中心</a>
				<i>|</i>
				<a href="javascript:void(0)">免责声明</a>
				<i>|</i>
				<a href="javascript:void(0)">客服机制</a>
				<i>|</i>
				<a href="javascript:void(0)">友情链接</a>
			</li>
			<li>京公网安备11010802017430 京ICP备06023392号 北京市中小企业服务中心</li>
			<li><span>地址：北京市海淀区新建宫门路2号中关村国家自主创新示范区</span><span class="right">E-mail：public@bjsidic.com</span></li>
			<li>版权所有 2013 技术支持：用友软件股份有限公司</li>
		</ul>
	</div>
</body>
</html>
<#if '${videoType?if_exists}' == '1'>
<script>
// 2016-9-22
$(document).ready(function(){
	var  nowTime = new Date(('${.now}').replace(new RegExp("-","gm"),"/")).getTime();
	var  startTime = new Date(('${vmsLiveInfo.startTime?if_exists}').replace(new RegExp("-","gm"),"/")).getTime();
	var timer = setInterval(function(){
		if(nowTime > startTime){
		    $(".temporary").css('display', 'none');
		    clearInterval(timer);
		}else{		
			$(".temporary").css('display', '');
		}
	},5000);
	
});
</script>
</#if>