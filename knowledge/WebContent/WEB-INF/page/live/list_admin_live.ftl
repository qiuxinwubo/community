<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>视频互联互通系统   直播监管</title>
<link rel="stylesheet" type="text/css" href="${base}/vms/css/index.css">
	<script type="text/javascript" src="${base}/common/js/jquery.min.js"></script>
	<script type="text/javascript" src="${base}/vms/js/index.js"></script>
	<script type="text/javascript" src="${base}/vms/js/common.js"></script>
	<script type="text/javascript" src="${base}/common/artdialog/artDialog.js?skin=opera"></script>
	<script type="text/javascript" src="${base}/common/artdialog/plugins/iframeTools.js"></script>
	<script type='text/javascript' src="${base}/common/wdatePicker/WdatePicker.js"></script>
	<script type='text/javascript' src="${base}/vms/js/liveTimeCheck.js"></script>
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
				<span>直播</span>
				<span>&gt;</span>
				<span>直播监管</span>
			</div>
			
			<div class="search-box clearfix">
			<form id="form" method="post" action="${base}/show.action?code=${args.code}">
				<input type="hidden" id="pageNo" name="pageNo" value="1" />
				<div>
					<span class="s-label">直播标题：</span>
					<input type="text" class="" name="subject" id="searchCont" value="${args.subject}">
				</div>
				<div>
					<span class="s-label">申请时间：</span>
					<input type="text" class="" id="startTime"name="createTime" readonly="readonly" value="${args.createTime}"onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})">
					<em class="">到</em>
					<input type="text" class="" id="endTime" name="createTime1" readonly="readonly" value="${args.createTime1}" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})">
				</div>
				<div>
					<span class="s-label">状态:</span>
					<select name="status" class="">
	        		<option value="">全部</option>
	       			<option value="1" <#if args.status=="1">selected="selected"</#if>>待审核</option>
	       			<option value="2" <#if args.status=="2">selected="selected"</#if>>审核通过</option>
	        		<option value="3" <#if args.status=="3">selected="selected"</#if>>审核不通过</option>
					</select>
					<a href="javascript:void(0)" onClick="doSearch()" class="search-btn" >搜索</a>
				</div>
				</form>
			</div>
			<table class="live-list" cellspacing="0">
				<tr class="list-hd">
					<td width="295">直播标题</td>
					<td width="200">申请发布人</td>
					<td width="101">状态</td>
					<td width="140">申请时间</td>
					<td width="140">发布时间</td>
					<td width="140">开始时间</td>
					<td width="300">操作</td>
					<td width="110">排序</td>
				</tr>
				 <#list data.ds1 as record>
				  <tr class="list-bd"  >
				    <td  class="live-title" title="${record.subject?if_exists}"><#if record.subject?exists>
    		  <#if record.subject?length lte 14>${record.subject?if_exists}<#else>
    		  ${record.subject[0..13]}...</#if>
    		  </#if></td>
				 
			<td title="${record.create_user_name?if_exists}">
				  <#if record.create_user_name?exists>
    		  <#if record.create_user_name?length lte 9>${record.create_user_name?if_exists}<#else>
    		  ${record.create_user_name[0..8]}...</#if>
    		  </#if>
	        </td>
				 
				  <#if '${record.if_status?if_exists}'=='0'><td>待发布</td>
				  <#elseif '${record.if_status?if_exists}'=='1'><td>待审核</td>
				  <#elseif '${record.if_status?if_exists}'=='2'><td class="pass">审核通过</td>
				  <#elseif '${record.if_status?if_exists}'=='3'><td class="no-pass">审核不通过</td></#if>
				
				
				  <td>${record.create_time?if_exists}</td>
				  <td>${record.status_time?if_exists}</td>
				  <td>${record.start_time?if_exists}</td>
				  <td>
				    <#if '${record.if_status?if_exists}'=='1'>
			        <a href="${base}/live/auditLiver1.action?id=${record.id?if_exists}&status=2&code=list_admin_live">通过</a>
				   <!--   <a href="${base}/live/auditLiver1.action?id=${record.id?if_exists}&status=3&code=list_admin_live">不通过</a>-->
				   		   
				      <a href="javascript:void(0)" onclick="auditShow('${record.id?if_exists}');">不通过</a>
				    <#elseif '${record.if_status?if_exists}'=='2'>
			         
			         <!--  <a href="${base}/live/auditLiver1.action?id=${record.id?if_exists}&status=3&code=list_admin_live">不通过</a> -->
				   
				      <a href="javascript:void(0)" onclick="auditShow('${record.id?if_exists}');">不通过</a>
				      <a href="javascript:void(0)" onclick="upTop('${record.id?if_exists}','${record.serial_number?if_exists}');">置顶</a>
				     <a href="${record.ORGANIZER_JOIN_URL?if_exists}?token=${record.ORGANIZER_TOKEN?if_exists}&nickName=${user.orgName?if_exists}" target="_blank">开始直播</a>
				     <#elseif '${record.if_status?if_exists}'=='3'>
				      <a href="${base}/live/auditLiver1.action?id=${record.id?if_exists}&status=2&code=list_admin_live">通过</a>
				    
				    </#if>
				      <a href="${base}/show.action?code=detail_live&id=${record.id?if_exists}&supCode=${args.code?if_exists}" >详情</a>
			   </td>
			   <td>${record.serial_number?if_exists}</td>
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
	
	<div class="cover-bg" id="upcover-bg" style="display: none;"></div>
	<div class="cover-box" id="upcover-box" style="display: none;">
		<div class="title">
			<span>置顶</span>
		</div>
			<form id="upForm" action="${base}/live/upTopLive.action">
		<div class="content">
			<div>
				<span>设置序列号</span>
				<input type="text" name="serialNumber"></div>
				<input type="hidden" name="id"  id="upId"/> 
				<input type="hidden" name="code"  value="list_admin_live"/>
			    <span id="numError"
			    style='display:block;width:100%;text-align:center;color: red;' ></span>
			<div >
				<a href="javascript:void(0)" class="confirm" onclick="toPostUpTop();" >确定</a>
				<a href="javascript:void(0)" class="goback">返回</a>
			</div>
			<div>
				<em>(序号为0则取消置顶)</em>
			</div>
		</div>
		 </form>
	</div>
	
	
	<!-- 审核意见 -->
	<div class="cover-bg" id="autcover-bg" style="display: none;"></div>
	<div class="cover-box" id="autcover-box" style="display: none;height:255px;">
		<div class="title">
			<span>审核意见</span>
		</div>
			<form id="auditForm" method="post" action="${base}/live/auditLiver1.action">
		<div class="content">
			<div>
				<input type="hidden" name="id"  id="auditId"/> 
				<input type="hidden" name="code"  value="list_admin_live"/>
				<input type="hidden" name="status" value="3"/>
			    <textarea name="auditComment"
							id="auditCommentId"	onblur="checkAuditComment();" style="width:300px;height:75px;resize:none;"></textarea>
			    <span id="auditError"
			    style='display:block;width:100%;text-align:center;color: red;' ></span>
			<div >
				<a href="javascript:void(0)" class="confirm" onclick="toPostaddAuditComment();" >确定</a>
				<a href="javascript:void(0)" class="goback">返回</a>
			</div>
		</div>
		</div>
		 </form>
	</div>
</body>
<script type="text/javascript">
$(document).ready(function(){
	$(".wsc-content .nav-left > ul > .nav-son > ul a").removeClass("nav-on");
	$(".wsc-content .nav-left #live-manage").addClass("nav-on");
})
function upTop(id,number){
	$("#upId").val(id);
	$("input[name='serialNumber']").val(number);
	$("#numError").html("");
	var number=number;
	window.number=number;
	$("#upcover-bg").show();
	$("#upcover-box").show();
}
function toPostUpTop(){
	var sernum=$("input[name='serialNumber']").val();
	if(isNumber(sernum)){
		if(sernum.length>6){
		$("#numError").html("请输入6位以内的正整数");
		}else{
			$("#upForm").submit();
		}
	}else{
		$("#numError").html("请输入正整数");
	}
	if(number==sernum){
		$("#upcover-bg").hide();
		$("#upcover-box").hide();
		return false;
	}
	
}

/*
 * 检查审核意见
 */
function checkAuditComment(){
	var comval=$("#auditCommentId").val();
	if(comval==null||comval.length==0){
		$("#auditError").html("审核意见不能为空");
		return false;
	}
	
	if(comval.length>100){
		$("#auditError").html("审核意见字数不能超过100");
		return false;
	}
	
	$("#auditError").html("");
	return true;
}
/*
 * 显示添加审核意见框
 */
function auditShow(id){
	$("#auditId").val(id);
	$("#autcover-bg").show();
	$("#autcover-box").show();
}

function toPostaddAuditComment(){
	if(checkAuditComment()){
		$("#auditForm").submit();
	}
}
function doSearch(){
	 if( timeSearch()){
	 $("#form").submit();
 }
}
	

</script>
</html>