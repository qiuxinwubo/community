<!DOCTYPE HTML>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>视频互联互通系统  进行中的会议</title>
	<link rel="stylesheet" type="text/css" href="${base}/vms/css/index.css">
	<script type="text/javascript" src="${base}/common/js/jquery.min.js"></script>
	<script type="text/javascript" src="${base}/vms/js/index.js"></script>
	<script type="text/javascript" src="${base}/vms/js/search.js"></script>
	<script type="text/javascript" src="${base}/vms/js/common.js"></script>
	<script type="text/javascript" src="${base}/common/artdialog/artDialog.js?skin=opera"></script>
	<script type="text/javascript" src="${base}/common/artdialog/plugins/iframeTools.js"></script>
	<script type='text/javascript' src="${base}/common/wdatePicker/WdatePicker.js"></script>
	<script>
	    function save(){
	        $("#form").submit();
	    }
	    function detail(id){
        	window.location.href="${base}/show.action?code=detail_Meeting&supCode=${args.code}&supCode=${args.code}&flag=now-meet&id="+id
        }
	</script>
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
				<span>会议</span>
				<span>&gt;</span>
				<span>我参加的会议</span>
				<span>&gt;</span>
				<span>进行中的会议</span>
			</div>
			<form  id="form" action="${base}/show.action?code=Meeting" method="post" >
			</form>	
			<table class="live-list" cellspacing="0">
				<tr class="list-hd">
					<td width="50">序号</td>
					<td width="200">会议标题</td>
					<td width="150">发起人</td>
					<td width="80">信息</td>
					<td width="150">会议开始时间</td>
					<td width="150">会议结束时间</td>
					<td width="15%">操作</td>
				</tr>
			<#list data.ds1 as record>
				<tr class="list-bd">
				    <td>${record_index+1?if_exists}</td>
	                <td class="live-title" title="${record.SUBJECT?if_exists}">
	                	<#if record.SUBJECT?exists>
	    		          <#if record.SUBJECT?length lte 18>${record.SUBJECT?if_exists}<#else>
	    		            ${record.SUBJECT[0..17]}...
	    		          </#if>
	    		         </#if>
	                </td>
	                <td>${record.CREATE_USER_NAME?if_exists}</td>
	                <td>${record.cou?if_exists}人参会</td>
	                <td>${record.START_TIME?if_exists}</td>
	                <td>${record.END_TIME?if_exists}</td>
	                <td>
	                	<#if '${user.belongorgType?if_exists}'!='6'>
	                	<a href="${record.PANELIST_JOIN_URL?if_exists}?token=${record.PANEIST_TOKEN?if_exists}&nickName=${record.win_name?if_exists}" target="_blank">参会</a>
	                	</#if>
	                	<a href="javascript:void(0)" onClick="detail('${record.ID?if_exists}')">详情</a>
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
</body>
<script>
	$(".wsc-content .nav-left > ul > .nav-son > ul a").removeClass("nav-on");
	$(".wsc-content .nav-left #now-meet").addClass("nav-on");
</script>
</html>
