<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>视频互联互通系统  我管理的会议</title>
	<link rel="stylesheet" type="text/css" href="${base}/vms/css/index.css">
	<script type="text/javascript" src="${base}/common/js/jquery.min.js"></script>
	<script type="text/javascript" src="${base}/vms/js/index.js"></script>
	<script type="text/javascript" src="${base}/vms/js/search.js"></script>
	<script type="text/javascript" src="${base}/vms/js/common.js"></script>
	<script type='text/javascript' src="${base}/vms/js/liveTimeCheck.js"></script>
	<script type="text/javascript" src="${base}/common/artdialog/artDialog.js?skin=opera"></script>
	<script type="text/javascript" src="${base}/common/artdialog/plugins/iframeTools.js"></script>
	<script type='text/javascript' src="${base}/common/wdatePicker/WdatePicker.js"></script>
</head>
</head>
<body>
	<div class="wsc-head clearfix">
	<#include "/frame/show_top_bar.ftl">
	</div>
	<div class="wsc-content clearfix">
	   <#include "/frame/menu2.ftl">
		<div class="main-right" style="width:1359px;">
			<div class="u-location">
				<span>您的位置：</span>
				<span>会议</span>
				<span>&gt;</span>
				<span>我管理的会议</span>
			</div>
			<form id="form" method="post" action="${base}/show.action?code=list_Meeting">
			<input type="hidden" id="pageNo" name="pageNo" value="1"/>
			<div class="search-box clearfix">
				<a href="${base}/live/createMeeting.action" class="addLive">新增会议</a>
				<div>
					<span class="s-label">会议标题：</span>
					<input type="text" class="" name="subject" id="searchCont" value="${args.subject}">
				</div>
				<div>
					<span class="s-label">开始时间：</span>
					<input type="text" class="" id="startTime" name="startTimeStart" readonly="readonly"  value="${args.startTimeStart}" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})">
					<em class="">到</em>
					<input type="text" class="" id="endTime" name="startTimeEnd" readonly="readonly" value="${args.startTimeEnd}"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})">
					<a href="javascript:void(0)" onClick="doSearch()" class="search-btn">搜索</a>
				</div>
			</div>
			<table class="live-list" cellspacing="0">
				<tr class="list-hd">
					<td width="220">会议标题</td>
					<td width="111">状态</td>
					<td width="80">信息</td>
					<td width="150">申请时间</td>
					<td width="150">发布时间</td>
					<td width="150">开始时间</td>
					<td width="310">操作</td>
				</tr>
				 <#list data.ds1 as record>
				  <tr class="list-bd">
				  <td class="live-title" title="${record.subject?if_exists}">
				  <#if record.subject?exists>
    		          <#if record.subject?length lte 15>${record.subject?if_exists}<#else>
    		          ${record.subject[0..14]}...</#if>
    		      </#if> 
				  </td>
				  <#if '${record.if_status?if_exists}'=='0'><td>待发布</td>
				  <#elseif '${record.if_status?if_exists}'=='1'><td>待审核</td>
				  <#elseif '${record.if_status?if_exists}'=='2'><td class="pass">审核通过</td>
				  <#elseif '${record.if_status?if_exists}'=='3'><td class="no-pass">审核不通过</td></#if>
				  <td>${record.cou?if_exists}人参会</td>
				  <td>${record.create_time?if_exists}</td>
				  <td>${record.status_time?if_exists}</td>
				  <td>${record.start_time?if_exists}</td>
				  <td>
					<#if '${record.if_status?if_exists}'=='0'||'${record.if_status?if_exists}'=='3'>
					    <a href="${base}/live/toUpdateMeetingPage.action?id=${record.id?if_exists}">修改会议信息</a>
					    <a href="#" onclick="applyLive('${record.id?if_exists}');">申请发布</a>
					    <a href="#" onclick="deleteLive('${record.id?if_exists}');">删除</a>
				  	</#if>
				    <a href="javascript:void(0)"  onClick="detail('${record.ID?if_exists}')" >详情</a>
				  </td>
				  <td>${record.serial_number?if_exists}</td>
				  </tr>
				  </#list>
			</table>
			<div class="paging clearfix">
				<#include "/common/paging.ftl">
			</div>
			</form>
			<div class="footer" id="under">
			</div>
		</div>
	</div>
</body>
</html>


<script type="text/javascript">
function deleteLive(id){
	art.dialog.confirm('请确认，您是否要删除？', function(){
	   location.href="${base}/live/delLiver.action?code=list_Meeting&id="+id;
	});
}
function doSearch(){
	 if( timeSearch()){
	 	$("#form").submit();
	 }
}

function detail(id)
{
    window.location.href="${base}/show.action?code=detail_Meeting&supCode=${args.code}&flag=my-manage-meet&id="+id
}
function applyLive(id){
	art.dialog.confirm('请确认是否要发布？', function(){
	   location.href="${base}/live/applyLive.action?code=list_Meeting&id="+id;
	});
}	      
$(".wsc-content .nav-left > ul > .nav-son > ul a").removeClass("nav-on");
$(".wsc-content .nav-left #my-manage-meet").addClass("nav-on");
</script>
</html>