<!DOCTYPE HTML>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>视频互联互通系统  会议监管</title>
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
	        window.location.href="${base}/show.action?code=detail_Meeting&supCode=${args.code}&flag=meet-manage&id="+id
	    }
	    function pass(id){
	        art.dialog.confirm('请确定是否通过？',function(){
	          window.location.href="${base}/live/auditLiver.action?status=2&code=manageMeeting&id="+id
	        });
	    } 
	  	function noPass(id){
	          window.location.href="${base}/live/auditLiverPage.action?status=3&code=manageMeeting&id="+id
	    }
	    function sendEMail(id){
	        art.dialog.confirm('请确定是否发送邮件？',function(){
	        	window.location.href="${base}/live/sendEmail.action?id="+id
	        	art.dialog.alert('邮件发送时间较长，请耐心等待！');
	        });
	    }
	</script>
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
				<span>会议监管</span>
			</div>
			<div class="search-box clearfix">
				<form  id="form" action="${base}/show.action?code=manageMeeting" method="post" >
  				<input type="hidden" id="pageNo" name="pageNo" value="1"/>
				<div>
					<span class="s-label" >会议标题：</span>
					<input type="text" class="" name="subject" value="${args.subject?if_exists}">
				</div>
				<div>
					<span class="s-label" >开始时间：</span>
					<input type="text" class="" id="startTime" name="startTimeStart" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" value="${args.startTimeStart?if_exists}">
					<em class="">~</em>
					<input type="text" class=""  id="endTime" name="startTimeEnd" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" value="${args.startTimeEnd?if_exists}">
				</div>
				<div>
					<span class="s-label" >申请人：</span>
					<input type="text" class="" name="loginName" value="${args.loginName?if_exists}">
				</div>
				<div>
					 <span class="s-label" >状态：</span>
					 <select class="" name="ifStatus">
		                <option value=""  <#if ''=='${args.ifStatus?if_exists}'>selected="true" </#if> >全部</option>
		                <option value="1"  <#if '1'=='${args.ifStatus?if_exists}'>selected="true" </#if>>待审核</option>
		                <option value="2"  <#if '2'=='${args.ifStatus?if_exists}'>selected="true" </#if>>审核通过</option>
		                <option value="3"  <#if '3'=='${args.ifStatus?if_exists}'>selected="true" </#if>>审核不通过</option>    
		             </select> 
				</div>
				<div>
					 <span class="s-label" >是否结束：</span>
					 <select class="" name="ifFinish">
		                <option value=""  <#if ''=='${args.ifFinish?if_exists}'>selected="true" </#if> >全部</option>
		                <option value="未结束"  <#if '未结束'=='${args.ifFinish?if_exists}'>selected="true" </#if>>未结束</option>
		                <option value="已结束"  <#if '已结束'=='${args.ifFinish?if_exists}'>selected="true" </#if>>已结束</option>
		             </select> 
					<a href="javascript:void(0)" onclick="save()" class="search-btn">搜索</a>
				</div>
				</form>
			</div>
			<table class="live-list" cellspacing="0">
				<tr class="list-hd">
					<td width="305">会议标题</td>
					<td width="111">申请人</td>
					<td width="150">状态</td>
					<td width="80">是否结束</td>
					<td width="80">信息</td>
					<td width="150">申请时间</td>
					<td width="150">发布时间</td>
					<td width="150">开始时间</td>
					<td width="15%">操作</td>
				</tr>
			<#list data.ds1 as record>
				<tr class="list-bd">
					<td class="live-title" title="${record.subject?if_exists}">
	                 <#if record.subject?exists>
    		          <#if record.subject?length lte 17>${record.subject?if_exists}<#else>
    		          ${record.subject[0..16]}...</#if>
    		         </#if>
    		       </td>
					<td>${record.CREATE_USER_NAME?if_exists}</td>
			   		
						<#if '${record.IF_STATUS?if_exists}'=='1'>
                          <td> 待审核</td>
	                   <#elseif '${record.IF_STATUS?if_exists}'=='2'>
                          <td class="pass">审核通过</td>
	                   <#elseif '${record.IF_STATUS?if_exists}'=='3'>
                          <td class="no-pass">审核不通过</td>
	                   </#if> 
		                <#--<#if '${.now}'?date('yyyy-MM-dd HH:mm:ss') gt ('${record.END_TIME?if_exists}'?date('yyyy-MM-dd HH:mm:ss'))>
						            <td> 已结束</td>
						<#else>
						   <td>未结束</td>
						</#if>	-->
					<td>${record.if_finish?if_exists}</td>  
					<td>${record.cou?if_exists}人参会</td>
					<td>${record.CREATE_TIME?if_exists}</td>
					<td>${record.status_time?if_exists}</td>
					<td>${record.START_TIME?if_exists}</td>
					<td>
					 <#if '${.now}'?date('yyyy-MM-dd HH:mm:ss') gt ('${record.END_TIME?if_exists}'?date('yyyy-MM-dd HH:mm:ss'))>
					      <a href="javascript:void(0)"  onClick="detail('${record.ID?if_exists}')">详情</a> 
				       <#else>	
						<#if '${record.IF_STATUS?if_exists}'=='1'>
	                    <a href="javascript:void(0)"  onClick="noPass('${record.ID?if_exists}')">审核</a> 
	                    <#elseif '${record.IF_STATUS?if_exists}'=='2'>
					  	<a href="${record.ORGANIZER_JOIN_URL?if_exists}?token=${record.ORGANIZER_TOKEN?if_exists}&nickName=管理员" target="_blank">开始会议</a>
	                    <a href="javascript:void(0)"  onClick="sendEMail('${record.ID?if_exists}')">发送邮件</a>
	                    <a href="javascript:void(0)"  onClick="noPass('${record.ID?if_exists}')">审核</a> 
	                    <#elseif '${record.IF_STATUS?if_exists}'=='3'>
	                   <a href="javascript:void(0)"  onClick="noPass('${record.ID?if_exists}')">审核</a> 
	                    </#if>
	                    <a href="javascript:void(0)"  onClick="detail('${record.ID?if_exists}')">详情</a>
	                </#if>    
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
	$(".wsc-content .nav-left #meet-manage").addClass("nav-on");      
</script>
</html>
