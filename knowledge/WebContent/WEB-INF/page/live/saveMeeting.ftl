<!DOCTYPE HTML>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>视频互联互通系统  新建会议</title>
	<link rel="stylesheet" type="text/css" href="${base}/vms/css/index.css">
	<script type="text/javascript" src="${base}/common/js/jquery.min.js"></script>
	<script type="text/javascript" src="${base}/common/js/uuid.js"></script>
	<script type="text/javascript" src="${base}/vms/js/index.js"></script>
	<script type="text/javascript" src="${base}/vms/js/common.js"></script>
	<script type='text/javascript' src="${base}/vms/js/liveTimeCheck.js"></script>
	<script type="text/javascript" src="${base}/common/artdialog/artDialog.js?skin=opera"></script>
	<script type="text/javascript" src="${base}/common/artdialog/plugins/iframeTools.js"></script>
	<script type='text/javascript' src="${base}/common/wdatePicker/WdatePicker.js"></script>
	<script>
	  $(document).ready(function(){
		var id = getUuid();
		$("#id").val(id);
		})
	   function checkSubject(){
			var val=$("input[name='subject']").val();
			if(val==""){
				$("#subjectError").html("会议主题字段不能为空");
				return false;
			}			
			 else if(val.length>20){
		          $("#subjectError").html("主题不能超过20个汉字！");
		          return false;
	        }
			$("#subjectError").html("");
			return true;
		}
		function checkStartTime(){
			var val=$("input[name='startTime']").val();
			if(val==""){
				$("#startTimeError").html("开始时间不能为空");
				return false;
			}
			var nowDate=new Date();
			var myDate=strToDate(val);
			if(myDate<nowDate){
				$("#startTimeError").html("开始时间不能早于现在时间");
				return false;
			}
			$("#startTimeError").html("");
			return true;
			
		}
		function checkEndTime(){
			var val=$("input[name='endTime']").val();
			if(val==""){
				$("#endTimeError").html("结束时间不能为空");
				return false;
		    	}
			$("#endTimeError").html("");
	 		return true;
	 }
	    function checkDes(){
			var val=$("textarea[name='description']").val();
			$("#descriptionError").hide(); 
		    if(val.length>500){
		    	$("#descriptionError").show(); 
	            $("#descriptionError").html("会议描述不能超过500个汉字！");
	            return false;
	        }
			$("#descriptionError").html("");
			return true;
		}
		function checkPlan(){
			var val=$("textarea[name='plan']").val();
			$("#planError").hide(); 
		    if(val.length>500){
		    	$("#planError").show();
	            $("#planError").html("会议议程不能超过500个汉字！");
	            return false;
	        }
			$("#planError").html("");
			return true;
		}
		function timeCheck(){
			var Time1 = $("input[name='startTime']").val();
			var Time2 = $("input[name='endTime']").val();
			if(typeof(Time1) != "undefined"&& Time1!=''&&typeof(Time2) != "undefined" && Time2!=''){
				var startDate=strToDate(Time1);
				var endDate=strToDate(Time2);
				if(startDate>endDate){
					//alert("开始时间不能大于结束时间");
					//art.dialog('开始时间不能大于结束时间', function(){this.close();});
					art.dialog({
					    lock: true,
					    background: '#000', // 背景色
					    opacity: 0.6,     // 透明度
					    content: '开始时间不能大于结束时间',
					    icon: 'error',
					    ok: function() {
					        this.close();
					    }
					});
					return false;
				}
			}
			return true;
		}
	    function save(){
		    var arrayId = '';
			$(".wsc-content .main-right .person-box .selected span").each(function(){
				arrayId = arrayId +','+$(this).attr("id");
				$("#arrayId").val(arrayId);
			});
	    	if(arrayId == ''){
	    		$("#arrayidError").html("参会人不能为空！");
		        return false;
	    	}else{
	    		$("#arrayidError").html("");
		        if(timeCheck() && timeSearch() &&checkSubject()&&checkStartTime()&&checkEndTime()&&checkDes()&&checkPlan()){
					$("form").submit();
				}
			}
	    }
	</script>
</head>

<body>
<form  id="form" action="${base}/live/saveMeeting.action" method="post" >	
   <input type="hidden" name="id" id="id" value="">
   <input type="hidden" name="arrayid" id="arrayId" value="">
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
				<span>我管理的会议</span>
				<span>&gt;</span>
				<span>新建会议</span>
			</div>		
			<div class="live-msg">
				<span>会议信息</span>
			</div>
			<div class="msg-box">
				<div class="col-state">
					<span>会议主题  ：</span>
				</div>
				<div class="col-fill">
					<span>
						<input type="text" id="subject" name="subject" onblur="checkSubject();" class="itxt">
						<em class="tips">*</em>
						<em class="tips" id="subjectError"></em>
					</span>
				</div>
				<div class="clear"></div>
				<div class="col-state">
					<span>会议开始时间：</span>
				</div>
				<div class="col-fill">
					<span>
						<input type="text" id="startTime" onblur="checkStartTime();" readonly="readonly" name="startTime" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"  class="itxt">
					    <em class="tips">*</em>
					    <em class="tips" id="startTimeError"></em>
					</span>
				</div>
				<div class="clear"></div>
				<div class="col-state">
					<span>会议结束时间：</span>
				</div>
			
				<div class="col-fill">
					<span>
						<input type="text" id="endTime" name="endTime" readonly="readonly" onblur="checkEndTime();" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"  class="itxt">
					    <em class="tips">*</em>
					    <em class="tips" id="endTimeError"></em>
					</span>
				</div>
				
				<div class="clear"></div>
				
				<div class="col-state">
					<span>会议描述：</span>
				</div>
				<div class="col-fill">
					<span>
						<textarea name="description" id="description" onblur="checkDes();"></textarea>
						<em class="tips" style="display:none" id="descriptionError"></em>
					</span>
				</div>
				<div class="clear"></div>
				<div class="col-state">
					<span>会议议程：</span>
				</div>
				<div class="col-fill">
					<span>
						<textarea name="plan" id="plan" onblur="checkPlan();"></textarea>
						<em class="tips" style="display:none" id="planError"></em>
					</span>
				</div>
				<div class="clear"></div>
			</div>
			
			<div class="meet-person">
				<span>参会人设置</span>
			</div>
			<div class="person-box">
				<div class="col-state w-fl">
					<span>备选：</span>
				</div>
				<div class="alternate w-fl">
				  <#list commonWindowList as record>
				  <div><span id="${record.id}" title="${record.winName?if_exists}">
				  <#if record.winName?exists>
	    		  <#if record.winName?length lte 14>${record.winName?if_exists}<#else>
	    		  ${record.winName[0..13]}...</#if>
	    		  </#if>
				  </span></div>
				  </#list>
				</div>
				<div class="select-btn w-fl">
					<a href="javascript:void(0)" class="sel-btn">选中&gt;</a>
					<a href="javascript:void(0)" class="cancel">撤销&lt;</a>
				</div>
				<div class="col-fill w-fl">
					<span>已选：</span>
				</div>
				<div class="selected w-fl">
				   
				</div>
				<em class="tips" style="color:red">&nbsp;*</em>
				<em id="arrayidError" style="color:#F62907;margin-left:10px;"></em>
				<div class="clear"></div>
			</div>
			<a href="javascript:void(0)"  style="margin-left:460px;"  onClick="save()" class="preserve">保存</a>
			
			<div class="footer" id="under">
			</div>
		</div>
	</div>
</form>	
</body>
<script>
    $(".wsc-content .nav-left > ul > .nav-son > ul a").removeClass("nav-on");
	$(".wsc-content .nav-left #my-manage-meet").addClass("nav-on");      
</script>
</html>
