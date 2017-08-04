<!DOCTYPE HTML>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>视频互联互通系统  审核会议</title>
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
		function checkStartTime(){
			var val=$("input[name='startTime']").val();
			if(val==""){
				$("#startTimeError").html("开始时间不能为空");
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
	   function  audit()
	     {
	          var val=$("textarea[name='auditComment']").val();
		  	    if(val==""){
				    $("#auditCommentError").html("审核意见不能为空");
				       return false;
		        	}	
			      $("#auditCommentError").html("");
	 		      return true;
	      }
	    function save(num){
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
	        if(timeCheck()&&checkStartTime()&&checkEndTime()){
	          if (num=="1"){
			          document.getElementById("form").action="${base}/live/auditLiver.action?status=2&code=manageMeeting";
			          $("form").submit();
	          }
             else if(num=="2"&&audit())
             {
		           document.getElementById("form").action="${base}/live/auditLiver.action?status=3&code=manageMeeting";
	                $("form").submit();
	            }
	          }  
            }
           }
	</script>
</head>

<body>
<form  id="form" action="${base}/live/auditLiver.action"  method="post" >	
   <input type="hidden" name="id" value="${vmsLiveInfo.id?if_exists}">
   <input type="hidden" name="arrayid" id="arrayId" value="">
    <div class="wsc-head clearfix" id="top">
	</div>
	<div class="wsc-content clearfix">
		 <#include "/frame/menu2.ftl">
		<div class="main-right">
			<div class="u-location">
				<span>您的位置：</span>
				<span>会议</span>
				<span>&gt;</span>
				<span>会议监管</span>
				<span>&gt;</span>
				<span>审核会议</span>
			</div>		
			<div class="live-msg">
				<span>会议信息</span>
			</div>
			<div class="msg-box">
				<div class="col-state">
					<span>会议主题：</span>
				</div>
				<div class="col-fill">
					<span>
						${vmsLiveInfo.subject?if_exists}
					</span>
				</div>
				<div class="clear"></div>
				<div class="col-state">
					<span>会议开始时间：</span>
				</div>
				<div class="col-fill">
					<span>
						<input type="text" id="startTime" onblur="checkStartTime();" readonly="readonly" name="startTime" value="${vmsLiveInfo.startTime?if_exists}" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" class="itxt">
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
						<input type="text" id="endTime" name="endTime" value="${vmsLiveInfo.endTime?if_exists}" readonly="readonly" onblur="checkEndTime();" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"  class="itxt">
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
				      ${vmsLiveInfo.description?if_exists}
					</span>
				</div>
				<div class="clear"></div>
				<div class="col-state">
					<span>会议议程：</span>
				</div>
				<div class="col-fill">
					<span>
                       ${vmsLiveInfo.plan?if_exists}
					</span>
				</div>
				<div class="clear"></div>
			</div>
			
			<div class="live-msg">
				<span>参会人设置</span>
			</div>
			<div class="person-box">
				<div class="col-state w-fl">
					<span>备选：</span>
				</div>
				<div class="alternate w-fl">
				</div>
				<div class="select-btn w-fl">
					<a href="javascript:void(0)" class="sel-btn">选中&gt;</a>
					<a href="javascript:void(0)" class="cancel">撤销&lt;</a>
				</div>
				<div class="col-fill w-fl">
					<span>已选：</span>
				</div>
				<div class="selected w-fl" id="oldWin"> 
				</div>
				<em id="arrayidError" style="color:#F62907;margin-left:10px;"></em>
				<div class="clear"></div>
			</div>
		     <div class="msg-box">
				<div class="col-state">
						<span>审核意见：</span>
				</div>
		    </div>
		    <div class="msg-box">
				<div class="col-fill">
				<span>
						<textarea name="auditComment" style="width:750px;" id="auditComment" onblur="audit();"></textarea>
				</span>	
			    </div>
			    <em id="auditCommentError" style="color:#F62907;margin-left:-30px;"></em>
			    <div class="clear"></div>
		    </div>
	           <a href="javascript:void(0)" class="preserve" onClick="save(1)">通过</a>
	           <a href="javascript:void(0)" style="margin-left:25px;" class="preserve" onClick="save(2)">不通过</a> 
	          <a href="${base}/show.action?code=manageMeeting" class="goBack" >返回</a>
			<div class="footer" id="under">
			</div>
		</div>
	</div>
</form>	
</body>
<script>
    $(".wsc-content .nav-left > ul > .nav-son > ul a").removeClass("nav-on");
	$(".wsc-content .nav-left #meet-manage").addClass("nav-on");
	$.ajax({
		url : "${base}/show.action?code=audit_old_win&id=${vmsLiveInfo.id?if_exists}",
		type : 'POST',
		success : function(data) {
			$("#oldWin").html(data);
		}
	});
</script>
</html>
