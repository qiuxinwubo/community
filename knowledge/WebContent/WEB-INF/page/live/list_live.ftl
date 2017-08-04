<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>视频互联互通系统  我管理的直播</title>
	<link rel="stylesheet" type="text/css" href="${base}/vms/css/index.css">
	<script type="text/javascript" src="${base}/common/js/jquery.min.js"></script>
	<script type="text/javascript" src="${base}/common/artdialog/artDialog.js?skin=opera"></script>
	<script type="text/javascript" src="${base}/common/artdialog/plugins/iframeTools.js"></script>
	<script type='text/javascript' src="${base}/common/wdatePicker/WdatePicker.js"></script>
	<script type='text/javascript' src="${base}/vms/js/liveTimeCheck.js"></script>
	<script type="text/javascript" src="${base}/vms/js/index.js"></script>
	<script type="text/javascript" src="${base}/vms/js/common.js"></script>
		<script type='text/javascript' src="${base}/vms/js/search.js"></script>
</head>
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
				<span>直播</span>
				<span>&gt;</span>
				<span>我管理的直播</span>
			</div>
			<form id="form" method="post" action="${base}/show.action?code=${args.code}">
			<input type="hidden" id="pageNo" name="pageNo" value="1" />
			<div class="search-box clearfix">
				<a href="${base}/live/toCreateLiver.action" class="addLive ">新增直播</a>
				<div>
					<span class="s-label ">直播标题：</span>
					<input type="text" class="" name="subject" id="searchCont" value="${args.subject}">
				</div>
				<div>
					<span class="s-label ">申请时间：</span>
					<input type="text" class="" id="startTime" name="createTime" readonly="readonly"  value="${args.createTime}" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})">
					<em class="">到</em>
					<input type="text" class="" id="endTime" name="createTime1" readonly="readonly" value="${args.createTime1}"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})">
					<a href="javascript:void(0)" onClick="doSearch()" class="search-btn">搜索</a>
				</div>
			</div>
			</form>
			<table class="live-list" cellspacing="0">
				<tr class="list-hd">
					
					<td width="295">直播标题</td>
					<td width="101">状态</td>
					<td width="140">申请时间</td>
					<td width="140">发布时间</td>
					<td width="140">开始时间</td>
					<td width="300">操作</td>
				</tr>
				 <#list data.ds1 as record>
				  <tr class="list-bd">
				  
				   <td class="live-title" title="${record.subject?if_exists}"><#if record.subject?exists>
    		  <#if record.subject?length lte 18>${record.subject?if_exists}<#else>
    		  ${record.subject[0..17]}...</#if>
    		  </#if></td>
    		  
				  <#if '${record.if_status?if_exists}'=='0'><td>待发布</td>
				  <#elseif '${record.if_status?if_exists}'=='1'><td>待审核</td>
				  <#elseif '${record.if_status?if_exists}'=='2'><td class="pass">审核通过</td>
				  <#elseif '${record.if_status?if_exists}'=='3'><td class="no-pass">审核不通过</td></#if>
				  <td>${record.create_time?if_exists}</td>
				  <td>${record.status_time?if_exists}</td>
				  <td>${record.start_time?if_exists}</td>
				  <td>
				 
				  <#if '${record.if_status?if_exists}'=='0'||'${record.if_status?if_exists}'=='3'>
				  <a href="#" onclick="applyLive('${record.id?if_exists}');">申请发布</a>
				  <a href="#" onclick="deleteLive('${record.id?if_exists}');">删除</a>
				  <a href="${base}/show.action?code=update_live&id=${record.id?if_exists}">修改</a>
				  </#if>
			<!--    <#if '${record.if_status?if_exists}'=='2'>
				<a href="${record.ORGANIZER_JOIN_URL?if_exists}?token=${record.ORGANIZER_TOKEN?if_exists}&nickName=${user.orgName?if_exists}" target="_blank">开始直播</a>

				  </#if>-->	
				  <a href="${base}/show.action?code=detail_live&id=${record.id?if_exists}&supCode=${args.code?if_exists}" >详情</a>
				  </td>
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
	<div class="cover-bg" style="display: none;"></div>

</body>
</html>


<script type="text/javascript">

$(document).ready(function(){
	$(".wsc-content .nav-left > ul > .nav-son > ul a").removeClass("nav-on");
	$(".wsc-content .nav-left #my-manage-live").addClass("nav-on");
})

function deleteLive(id){
	art.dialog.confirm('请确认，您是否要删除？', function(){
	   location.href="${base}/live/delLiver.action?code=list_live&id="+id;
	});
}
function doSearch(){
	 if( timeSearch()){
	 $("#form").submit();
	 }
}
function applyLive(id){
	   location.href="${base}/live/applyLive.action?code=list_live&id="+id;
}
	

</script>
</html>