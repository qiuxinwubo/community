<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>视频互联互通系统  视频点播监管</title>
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
	<div class="main-right" style="width: 1679px;">
			<div class="u-location">
				<span>您的位置：</span>
				<span>视频点播</span>
				<span>&gt;</span>
				<span>视频点播监管</span>
			</div>
			<div class="search-box clearfix">
			<form id="form" method="post" action="${base}/show.action?code=${args.code}">
			<input type="hidden" id="pageNo" name="pageNo" value="1" />
				<div>
					<span class="s-label">点播标题：</span>
					<input type="text" class="" name="headline" id="headline" value="${args.headline}">
				</div>
				<div>
					<span class="s-label">上传时间：</span>
					<input type="text" class="" name="uploadTime" readonly="readonly" value="${args.uploadTime}"onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})">
					<em class="">到</em>
					<input type="text" class="" name="uploadTime1" readonly="readonly" value="${args.uploadTime1}" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})">
				</div>
				<div>
					<span class="s-label">主讲人：</span>
					<input type="text" class="" name="speakerName" id="searchCont" value="${args.speakerName}">
				</div>
				<div>
					<span class="s-label">服务分类：</span>
					<select name="servicetypes" class="">
	        		<option value="" selected >全部
					<#list data.ds2 as record>
	       			<option value="${record.service_type_code?if_exists}" <#if '${record.service_type_code?if_exists}'=='${args.servicetypes}'>selected</#if>>${record.service_type_name?if_exists}
					</#list>
					</select>
				</div>
				<div>
					<span class="s-label">状态：</span>
					<select name="shelves" class="">
	        		<option value="" selected >全部
	       			<option value="0" <#if '${args.shelves}'=='0'>selected</#if>>待上架
	       			<option value="1" <#if '${args.shelves}'=='1'>selected</#if>>上架
	        		<option value="2" <#if '${args.shelves}'=='2'>selected</#if>>下架
					</select>
					<a href="javascript:void(0)" onClick="doSearch()" class="search-btn">搜索</a>
					<a href="javascript:void(0)" onClick="batchputaway()" class="search-btn">批量上架</a>
				</div>
			</div>
			<table class="live-list" cellspacing="0">
				<tr class="list-hd">
					<td width="70"><input type="checkbox"  value='全选' onclick='chkall(this)'></td>
					<td width="305">点播标题</td>
					<td width="111">主讲人</td>
					<td width="111">状态</td>
					<td width="150">上传时间</td>
					<td width="150">上架时间</td>
					<td width="150">服务分类</td>
					<td width="330">操作</td>
					<td width="110">排序</td>
				</tr>
				 <#list data.ds1 as record>
				  <tr class="list-bd">
				  	<td><input type="checkbox" name="vidname" id="checkbox" value="${record.id?if_exists}"></td>
				  	<td style="text-align:left;" title="${record.name?if_exists}">
				  	<a href="${base}/home/playvideo.action?id=${record.id?if_exists}&type=2" target="${record.id?if_exists}" title="${record.name?if_exists}">
				  		<#if record.name?exists>
			    		  	<#if record.name?length lte 14>
								${record.name?if_exists}
			    		  	<#else>
			    		  	${record.name[0..13]}...
			    		  	</#if>
			    		 </#if>
				  	</a>
				  	</td>
				  	<td>
				  	<#if record.speaker?exists>
				  		<#if record.speaker?length lte 6>
								${record.speaker?if_exists}
		    		  	<#else>
		    		  			${record.speaker[0..5]}...
		    		  	</#if>
				  	</#if>
				  	</td>
				  	<td <#if '${record.if_shelves?if_exists}'=='0'>style="color:#EE9A00;"<#elseif '${record.if_shelves?if_exists}'=='1'>style="color:#008B00;"<#elseif '${record.if_shelves?if_exists}'=='2'>style="color:red;"</#if>><#if '${record.if_shelves?if_exists}'=='0'>待上架<#elseif '${record.if_shelves?if_exists}'=='1'>上架<#elseif '${record.if_shelves?if_exists}'=='2'>下架</#if></td>
				  	<td>${record.vid_createtime?if_exists}</td>
				  	<td><#if '${record.if_shelves?if_exists}'=='1'>${record.up_time?if_exists}</#if></td>
				  	<td>${record.service_type?if_exists}</td>
				  	<td>
					    <#if '${record.if_shelves?if_exists}'=='0'>
				        <a href="javascript:void(0)" onclick="putaway('${record.id?if_exists}');">上架</a>
				        <a href="javascript:void(0)" onclick="deleteLive('${record.id?if_exists}','${data.ds1page.pageNo}');">删除</a>
				        <a href="${base}/cast/updatecast.action?castId=${record.id?if_exists}">设置视频信息</a>
					    <#elseif '${record.if_shelves?if_exists}'=='1'>
				        <a href="javascript:void(0)" onclick="soldout('${record.id?if_exists}','${data.ds1page.pageNo}');">下架</a>
						<a href="javascript:void(0)"  onclick="upTop('${record.id?if_exists}','${record.serial_number?if_exists}');">置顶</a>
					     <#elseif '${record.if_shelves?if_exists}'=='2'>
				        <a href="javascript:void(0)" onclick="putaway('${record.id?if_exists}');">上架</a>
				        <a href="javascript:void(0)" onclick="deleteLive('${record.id?if_exists}','${data.ds1page.pageNo}');">删除</a>
				        <a href="${base}/cast/updatecast.action?castId=${record.id?if_exists}">设置视频信息</a>
					    </#if>
					     <a href="${base}/show.action?code=cast_detail&vid=${record.id?if_exists}" >详情</a>
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
	<script type="text/javascript">
	
function deleteLive(id,pageNo){
	art.dialog.confirm('请确认，您是否要删除？', function(){
	   location.href="${base}/cast/deleteAway.action?castId="+id+"&pageNo="+pageNo;
	});
}
function soldout(id,pageNo){
	art.dialog.confirm('请确认，您是否要下架？', function(){
	   location.href="${base}/cast/putoroutaway.action?castId="+id+"&sign=2&pageNo="+pageNo;
	});
}
function timeSearch(){
	var Time1 = $("input[name='uploadTime']").val();
	var Time2 = $("input[name='uploadTime1']").val();
	if(typeof(Time1) != "undefined"&& Time1!=''&&typeof(Time2) != "undefined" && Time2!=''){
		var startDate=strToDate(Time1);
		var endDate=strToDate(Time2);
		if(startDate>endDate){
			art.dialog.alert('开始时间不能大于结束时间！');
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
function isNum(s) {
 var regu = "^([0-9]*[.0-9])$"; // 小数测试
 var re = new RegExp(regu);
 if (s.search(re) != -1)
  return true;
 else
  return false;
}
function stickaway(){
	var number=$("#number").val();
	var reg = new RegExp("^[0-9]*$");
	if(number==""){
		$("#numberst").html("序列号不能为空！");
		$("#numberst").css("color","red");
	}else if(!reg.test(number)){
		$("#numberst").html("请输入6位以内的正整数或0！");
		$("#numberst").css("color","red");
		return false;
	}else if(number.length>5){
		$("#numberst").html("请输入6位以内的正整数或0！");
		$("#numberst").css("color","red");
		return false;
	}else{
		$.ajax({
			url : "${base}/cast/stickaway.action",
			data:{castId:$("#stickawayid").val(),number:$("#number").val(),pageNo:${data.ds1page.pageNo}},
			 success:function(data){
		       window.location.href = "${base}/show.action?code=cast_list&pageNo=${data.ds1page.pageNo}";
		      },error:function(){
				art.dialog.alert('操作失败，请于管理员联系！');
		      }
		});
		$("#numberst").html("置顶需要只能是6位以内的正整数或0！");
		$("#numberst").css("color","black");
		$(".cover-box").css("display","none");
		$(".cover-bg").css("display","none");
		return true;
	}
}
function goback(){
		$("#numberst").html("置顶需要只能是6位以内的正整数或0！");
		$("#numberst").css("color","black");
		$(".cover-box").css("display","none");
		$(".cover-bg").css("display","none");
	};


function batchputaway(){
	art.dialog.confirm('请确认，您是否要批量上架？', function(){
	var chk_value="";
	 $('input[name="vidname"]:checked').each(function(){    
	  chk_value=chk_value+","+$(this).val();    
	 });
	 if(chk_value==""){
		art.dialog.alert('亲，请选择需要上架的点播！');
	 }else{
	 $.ajax({
			url : "${base}/cast/batchputaway.action",
			data:{castId:chk_value},
			 success:function(data){
			 	if(data=="1"){
					art.dialog.alert('您选择上架的视频中存在未完善信息的视频，请检查！');
			 	}else if(data=="2"){
					art.dialog.alert('您选择上架的视频中存在已经上架的视频，请检查！');
			 	}else{
			 		window.location.href = "${base}/show.action?code=cast_list&pageNo=${data.ds1page.pageNo}";
			 	}
		      },
		     error:function(){
				art.dialog.alert('操作失败，请于管理员联系！');
		      }
		});
	 }
	});
}
function putaway(id){
art.dialog.confirm('请确认，您是否要上架？', function(){
	$.ajax({
		url:"${base}/cast/verifyCast.action",
		data:{castId:id},
		success:function(data){
				if(data=="1"){
					art.dialog.alert('请完善视频信息！');
				}else if(data="2"){
					$.ajax({
						url:"${base}/cast/putoroutaway.action",
						data:{castId:id,sign:1,pageNo:${data.ds1page.pageNo}},
						success:function(data){
		       				window.location.href = "${base}/show.action?code=cast_list&pageNo=${data.ds1page.pageNo}";
						}
					});
				}
		 },
	     error:function(){
	      }
	});
	});
}
function upTop(id,serialNumber){
	$("#stickawayid").val(id);
	$("#number").val(serialNumber);
	$(".cover-box").css("display","block");
	$(".cover-bg").css("display","block");
}
$(".wsc-content .nav-left > ul > .nav-son > ul a").removeClass("nav-on");
$(".wsc-content .nav-left #video-manage").addClass("nav-on");
</script>
<div class="cover-bg" style="display: none;"></div>
<div class="cover-box" style="display: none;">
		<div class="title">
			<span>置顶</span>
		</div>
		<div class="content">
			<div>
				<span>设置序列号</span>
				<input name="number" id="number" type="text">
				<input type="hidden" name="stickawayid" id="stickawayid">
				<span class="tips" id="numberst" style="display:inline-block;width:100%;text-align:center;">序列号中只能填写6位以内的正整数或0！</span>
			</div>
			<div style="margin-top:30px;">
				<a href="javascript:void(0)" class="confirm" onclick="stickaway();" style="margin:0 5px;">确定</a>
				<a href="javascript:void(0)" onclick="goback();" style="margin:0 5px;">返回</a>
			</div>
			<div>
				<em>(序号为0则取消置顶)</em>
			</div>
		</div>
	</div>
</body>
</html>