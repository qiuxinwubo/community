<!DOCTYPE HTML>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>视频互联互通系统  会议详情</title>
	<link rel="stylesheet" type="text/css" href="${base}/vms/css/index.css">
	<script type="text/javascript" src="${base}/common/js/jquery.min.js"></script>
	<script type="text/javascript" src="${base}/vms/js/index.js"></script>
	<script type="text/javascript" src="${base}/vms/js/common.js"></script>
	<script type="text/javascript" src="${base}/common/artdialog/artDialog.js?skin=opera"></script>
	<script type="text/javascript" src="${base}/common/artdialog/plugins/iframeTools.js"></script>
	<script type='text/javascript' src="${base}/common/wdatePicker/WdatePicker.js"></script>
	<script>
	    function save()
	    {
	       $("#form").submit();
	    }
	    function detail(id)
	      {
	         window.location.href="${base}/live/detail/seedetail.action?id="+id
	      }
	</script>
</head>

<body>
  <form  id="form" action="${base}/show.action?code=sMeeting" method="post" >
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
				<span>会议详情</span>
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
					${data.ds1[0].subject?if_exists}
					</span>
				</div>
				<div class="clear"></div>
				<div class="col-state">
					<span>会议开始时间：</span>
				</div>
				<div class="col-fill">
					<span>
					 ${data.ds1[0].START_TIME?if_exists}
					</span>
				</div>
				<div class="clear"></div>
				<div class="col-state">
					<span>会议结束时间：</span>
				</div>
				<div class="col-fill">
					<span>
					 ${data.ds1[0].end_time?if_exists}
					</span>
				</div>
				<div class="clear"></div>
				<div class="col-state">
					<span>会议描述：</span>
				</div>
				<div class="col-fill">
					<span>
					${data.ds1[0].description?if_exists}
					</span>
				</div>
				<div class="clear"></div>
				<div class="col-state">
					<span>会议议程：</span>
				</div>
				<div class="col-fill">
					<span>
					${data.ds1[0].plan?if_exists}
					</span>
				</div>
				<div class="clear"></div>
				<div class="col-state">
					<span>审核意见：</span>
				</div>
				<div class="col-fill">
					<span>
					${data.ds1[0].audit_Comment?if_exists}
					</span>
				</div>
			</div>
			<div class="clear"></div>
			<div class="live-msg">
				<span>参会人信息：</span>
			</div>
			<div class="msg-box">
				<div class="col-state">
						<span>参会人：</span>
				</div>
				<div class="col-fill">
				    <#list data.ds2 as record>
					  <span>
						  ${record.win_name}
					  </span>
					</#list>
			    </div>	
			    <div class="clear"></div>
		    </div>
		   
			<a href="${base}/show.action?code=${args.supCode?if_exists}" class="del-back">返回</a>
			<div class="footer" id="under">
			</div>
		</div>
	</div>
  </form>
</body>
<script>
    $(".wsc-content .nav-left > ul > .nav-son > ul a").removeClass("nav-on");
	$(".wsc-content .nav-left #${args.flag?if_exists}").addClass("nav-on"); 
</script>
</html>
