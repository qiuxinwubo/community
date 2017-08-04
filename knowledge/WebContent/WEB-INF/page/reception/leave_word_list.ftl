<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>知识产权在线留言</title>
	<link rel="shortcut icon" type="image/x-icon" href="${base}/common/images/icon.ico" media="screen" />
    <link href="${base}/knowledge/css/sl_style.css" rel="stylesheet" type="text/css" />
	<script type='text/javascript' src='${base}/common/js/jquery-1.8.3.min.js'></script>
	<script type="text/javascript" src="${base}/common/js/koala.min.1.5.js"></script>
	<script type="text/javascript" src="${base}/knowledge/js/reception_index.js"></script>
	<script type="text/javascript" src='${base}/knowledge/js/sl_index.js'></script>
    <!-- 弹出层 -->
    <script type="text/javascript" src="${base}/common/artdialog/artDialog.js?skin=opera"></script>
    <script type="text/javascript" src="${base}/common/artdialog/plugins/iframeTools.js"></script>
</head>
<body>
	<div id="top"></div>
	<form id="saveform" action="${base}/receptionaction/saveleaveword.action" method="post">
	<div class="sl_messageBox">
		<div class="titleBox">在线留言</div>
		<textarea name="content" id="content" cols="30" rows="10" placeholder="留言最多为150个字！" onfocus="verifylogin();"></textarea>
		<a href="#" onclick="sumbit();" style="margin-left:10px;">提交</a>
		<a href="${base}/receptionaction/show.action?code=re_index">返回知识产权首页</a>
	</div>
	</form>
	<form id="form" action="${base}/receptionaction/show.action?code=leave_word_list" method="post">
	<input type="hidden" id="pageNo" name="pageNo" value="1" />
		<#list data.ds1 as record>
		<div class="sl_messageContainer">
			<div>
				<div class='sl_user'>
					<#if '${record.phone?if_exists}'!=''>
						${record.phone[0..3]}****${record.phone[8..10]}
					<#else>***********
					</#if>
				</div>
				<div class="text">
					${record.content?if_exists}
				</div>
				<p>${record.create_time?string("yyyy-MM-dd")}</p>
			</div>
		</div>
		</#list>
		<#if '${data.ds1page.rowCount.toString()}'!='0'>
			<div class="sl_pageBox2">
				<#include "/common/paging.ftl">
			</div>
		</#if>
	</form>
	<div class="sl_layerMain" id="sucess" style="display:none;">
		<div class="sl_layerContent">
			<div class="sl_closeBtnBox">
				<div class="sl_closeBtn">&nbsp;</div>
			</div>
			<div class="sl_okBox">
				<img src="${base}/knowledge/images/ok_03.png" alt="">
			</div>
			<div class="sl_btnBox">
				<a href="${base}/receptionaction/show.action?code=re_index" style='margin-right:20px;'>返回首页</a>
				<a href="${base}/receptionaction/show.action?code=leave_word_list">继续留言</a>
			</div>
		</div>
	</div>
</body>
<script>
function verify(){
	var value=$("#content").val();
	if(value==""){
		art.dialog.alert('留言不能为空！');
		return false;
	}
	if(value.length>150){
		art.dialog.alert('留言不能大于150个字符！');
		return false;
	}
	return true;
}
function verifylogin(){
	var flagr=null;
	$.ajax({
		type : "POST",  
		url:"${base}/receptionaction/reislogin.action",
		async:false,
		success:function(data){
			if(data.flag=="1"){
				flagr=true;
			}else{
				art.dialog({
		        id: 'view_cust',
		        width: '300px',
		        title: '提示信息',
		        lock: true,
		        content:"您还没有登录！",
		        button:[ {
		　　　　		name:'登录',
                    callback:function(){
                    	window.location.href=get_url()+"/LoginIpAction/loginbefore.action?url="+window.encodeURIComponent(window.location.href);
                    }
		          },
		         {
		         	name:'取消',
                    callback:function(){}         
		         } ]
		    	});
				flagr=false;
			}
		},
		error:function(){
			art.dialog.alert('操作失败，请于管理员联系！');
		}
	});
	return flagr;
}
function verifylogin(){
	var flagr=null;
	$.ajax({
		type : "POST",  
		url:"${base}/receptionaction/reislogin.action",
		async:false,
		success:function(data){
			if(data.flag=="1"){
				flagr=true;
			}else{
				art.dialog({
		        id: 'view_cust',
		        width: '300px',
		        title: '提示信息',
		        lock: true,
		        content:"您还没有登录！",
		        button:[ {
		　　　　		name:'登录',
                    callback:function(){
                    	window.location.href=get_url()+"/LoginIpAction/loginbefore.action?url="+window.encodeURIComponent(window.location.href);
                    }
		          },
		         {
		         	name:'取消',
                    callback:function(){}         
		         } ]
		    	});
				flagr=false;
			}
		},
		error:function(){
			art.dialog.alert('操作失败，请于管理员联系！');
		}
	});
	return flagr;
}
function sumbit(){
	if(verify()&&verifylogin()){
		var value=$("#content").val();
		$.ajax({
			type : "POST",  
			url:"${base}/receptionaction/saveleaveword.action",
			data:{content:value},
			async:false,
			success:function(data){
				$("#sucess").show();
				$("#content").val("");
			},
			error:function(){
				$("#content").val("");
				art.dialog.alert('保存留言失败，请联系管理员或重新留言！');
			}
		});
	}
}
</script>
</html>