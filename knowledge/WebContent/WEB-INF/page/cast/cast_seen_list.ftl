<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>视频互联互通系统  我看过的点播</title>
<link rel="stylesheet" type="text/css" href="${base}/vms/css/index.css">
	<script type="text/javascript" src="${base}/common/js/jquery.min.js"></script>
	<script type="text/javascript" src="${base}/vms/js/index.js"></script>
	<script type="text/javascript" src="${base}/vms/js/common.js"></script>
	<script type="text/javascript" src="${base}/common/artdialog/artDialog.js?skin=opera"></script>
	<script type="text/javascript" src="${base}/common/artdialog/plugins/iframeTools.js"></script>
	<script type='text/javascript' src="${base}/common/wdatePicker/WdatePicker.js"></script>
	<script type='text/javascript' src="${base}/vms/js/search.js"></script>
</head>
<body>
<div class="wsc-head clearfix" >
<#include "/frame/show_top_bar.ftl">
</div>
	<div class="wsc-content clearfix">
	<#include "/frame/menu2.ftl">
	<div class="main-right">
			<div class="u-location">
				<span>您的位置：</span>
				<span>视频点播</span>
				<span>&gt;</span>
				<span>我看过的点播</span>
			</div>
			
			<div class="search-box clearfix">
			<form id="form" method="post" action="${base}/show.action?code=${args.code}">
			<input type="hidden" id="pageNo" name="pageNo" value="1" />
				<div>
					<span class="s-label">点播标题：</span>
					<input type="text" class="" name="headline" id="headline" value="${args.headline}">
				</div>
					<a href="javascript:void(0)" onClick="doSearch()" class="search-btn">搜索</a>
				</form>
			</div>
			<table class="live-list" cellspacing="0">
				<tr class="list-hd">
					<td width="100">序号</td>
					<td width="305">点播标题</td>
					<td width="150">服务分类</td>
					<td width="150">视频上架时间</td>
					<td width="150">最后观看时间</td>
					<td width="330">操作</td>
				</tr>
				 <#list data.ds1 as record>
				  <tr class="list-bd">
				  	<td>${(data.ds1page.pageNo?number-1)*10+(record_index+1)}</td>
				  	<td style="text-align:left;" title="${record.name?if_exists}">
				  		<#if record.name?exists>
			    		  	<#if record.name?length lte 14>
								${record.name?if_exists}
			    		  	<#else>
			    		  	${record.name[0..13]}...
			    		  	</#if>
			    		 </#if>
				  	</td>
				  	<td>${record.service_type?if_exists}</td>
				  	<td>${record.up_time?if_exists}</td>
				  	<td>${record.last_watch_time?if_exists}</td>
				  	<td><a href="${base}/home/playvideo.action?id=${record.id?if_exists}&type=2" target="${record.id?if_exists}">观看</a></td>
				  </tr>
				 </#list>
			</table>
			<div class="paging clearfix">
				<#include "/common/paging.ftl">
			</div>
			<div class="footer" id="under">
			</div>
		</div>
	</div>
	<script type="text/javascript">
function timeSearch(){
	var Time1 = $("input[name='readTime']").val();
	var Time2 = $("input[name='readTime1']").val();
	if(typeof(Time1) != "undefined"&& Time1!=''&&typeof(Time2) != "undefined" && Time2!=''){
		var startDate=strToDate(Time1);
		var endDate=strToDate(Time2);
		if(startDate>endDate){
			alert("开始时间不能大于结束时间");
			return false;
		}
	}
	return true;
}
function strToDate(str) {
	var tempStrs = str.split(" ");
	var dateStrs = tempStrs[0].split("-");
	var year = parseInt(dateStrs[0], 10);
	var month = parseInt(dateStrs[1], 10) - 1;
	var day = parseInt(dateStrs[2], 10);
	var date=new Date(year, month, day);
	if(tempStrs.length>1){
	var timeStrs = tempStrs[1].split("-");
	var hour = parseInt(timeStrs [0], 10);
	var minute = parseInt(timeStrs[1], 10) - 1;
	var second = parseInt(timeStrs[2], 10);
	date = new Date(year, month, day, hour, minute, second);
	}
	return date;
	}
function doSearch(){
	 if( timeSearch()){
	 $("#form").submit();
	 }
}
$(".wsc-content .nav-left > ul > .nav-son > ul a").removeClass("nav-on");
$(".wsc-content .nav-left #saw-video").addClass("nav-on");
</script>
</body>
</html>