<!DOCTYPE HTML>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>视频互联互通系统  已结束的会议</title>
	<link rel="stylesheet" type="text/css" href="${base}/vms/css/index.css">
	<script type="text/javascript" src="${base}/common/js/jquery.min.js"></script>
	<script type="text/javascript" src="${base}/vms/js/index.js"></script>
	<script type="text/javascript" src="${base}/vms/js/search.js"></script>
	<script type="text/javascript" src="${base}/vms/js/common.js"></script>
	<script type='text/javascript' src="${base}/vms/js/liveTimeCheck.js"></script>
	<script type="text/javascript" src="${base}/common/artdialog/artDialog.js?skin=opera"></script>
	<script type="text/javascript" src="${base}/common/artdialog/plugins/iframeTools.js"></script>
	<script type='text/javascript' src="${base}/common/wdatePicker/WdatePicker.js"></script>
	<script>
	    function save(){
	        if( timeSearch()){
	          $("#form").submit();
           }
	    }
	    function detail(id){
			window.location.href="${base}/show.action?code=detail_Meeting&supCode=${args.code}&flag=meet-over&id="+id
	    }
	</script>
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
				<span>会议</span>
				<span>&gt;</span>
				<span>我参加的会议</span>
				<span>&gt;</span>
				<span>已结束的会议</span>
			</div>
			<div class="search-box clearfix">
				<form  id="form" action="${base}/show.action?code=endMeeting" method="post">
				<input type="hidden" id="pageNo" name="pageNo" value="1"/>
				<div>
					<span class="s-label" >会议标题：</span>
					<input type="text" class="" name="subject" value="${args.subject?if_exists}">
				</div>
				<div>
					<span class="s-label">开始时间：</span>
					<input type="text" class="" id="startTime" name="startTimeStart" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" value="${args.startTimeStart?if_exists}">
					<em class="">~</em>
					<input type="text" class="" id="endTime" name="startTimeEnd" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" value="${args.startTimeEnd?if_exists}">
					<a href="javascript:void(0)"  onclick="save()"  class="search-btn">搜索</a>
				</div>
				</form>	
			</div>
			<table class="live-list" cellspacing="0">
				<tr class="list-hd">
					<td width="50">序号</td>
					<td width="300">会议标题</td>
					<td width="150">发起人</td>
					<td width="150">信息</td>
					<td width="170">会议开始时间</td>
					<td width="170">会议结束时间</td>
					<td width="50">操作</td>
				</tr>
				<#list data.ds1 as record>
				<tr class="list-bd">
				    <td>${record_index+1?if_exists}</td>
	                <td class="live-title" title="${record.SUBJECT?if_exists}">
	                 <#if record.subject?exists>
    		          <#if record.subject?length lte 23>${record.subject?if_exists}<#else>
    		            ${record.subject[0..22]}...
    		          </#if>
    		         </#if>
	                </td>
	                <td>${record.CREATE_USER_NAME?if_exists}</td>
	                <td>${record.cou?if_exists}人参会</td>
	                <td>${record.START_TIME?if_exists}</td>
	                <td>${record.END_TIME?if_exists}</td>
	                <td><a href="javascript:void(0)" onClick="detail('${record.ID?if_exists}')">详情</a></td>
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
</body>
<script>
    $(".wsc-content .nav-left > ul > .nav-son > ul a").removeClass("nav-on");
	$(".wsc-content .nav-left #meet-over").addClass("nav-on");      
</script>
</html>
