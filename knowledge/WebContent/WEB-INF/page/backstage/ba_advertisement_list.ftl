<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>知识产权</title>
	<link rel="shortcut icon" type="image/x-icon" href="${base}/common/images/icon.ico" media="screen" />
    <link href="${base}/knowledge/css/style.css" rel="stylesheet" type="text/css" />
	<script type='text/javascript' src='${base}/common/js/jquery.min.js'></script>
	<script type='text/javascript' src='${base}/knowledge/js/common.js'></script>
    <!-- 弹出层 -->
    <script type="text/javascript" src="${base}/common/artdialog/artDialog.js?skin=opera"></script>
    <script type="text/javascript" src="${base}/common/artdialog/plugins/iframeTools.js"></script>
</head>

<body>
        <div class="top" id="top"></div>
<div class="container">
         <div class="left"  id="left"></div>
  <div class="right">
        <div class="position">当前位置&nbsp;&nbsp;>&nbsp;&nbsp;平台管理员账户&nbsp;&nbsp;>&nbsp;&nbsp;<span>广告图片管理</span></div>
         <form id="form" action="${base}/backstagemerchant/baadvertisementsave.action" method="post">
			<input type="hidden" id="menu"  value="2" />
			<input type="hidden" id="imageId" name="imageId"  value="" />
                    <div>
                    	<label><span style="color:red">*</span>广告跳转链接：</label>
                    	<input name="ipAdvertisementLink" id="ipAdvertisementLink" type="text" onblur="verifyipAdvertisementLink();"/>
                    	<span class="verify" id="verifyipAdvertisementLink" style="width: 216px;"></span>
                    </div>
                    <div><label><span style="color:red">*</span>图片上传：</label>
                    	<a href="javascript:void(0)" onclick="document.getElementById('file').click();" style="width: 120px;height: 30px;text-align: center;line-height: 30px;display: inline-block;background: #428bca;color: #fff;text-decoration: none">浏览..</a>
                		<span class="verify" id="verifyimage"></span>
                    </div>
                    <div><label><span style="color:red">*</span>图片预览：</label><img id="imageh" src="${base}/knowledge/images/preview.jpg" width="232" height="160" /></div>
                    <div>
                    	<center>
                            <a href="javascript:void(0)" onclick="sum();" class="save">数目</a>
                            <a href="javascript:void(0)" onclick="submit();" class="save">提交</a>
                    		<a href="${base}/show.action?code=ba_advertisement_list" style="background-color: #CCC;color: #FFF;" class="save">取消</a>
                    	</center>
                    </div>
        </form>
        <form  id="fileForm"  method="post" multiple="multiple">
    		 <input type="file" onchange="fileUpload(this)"class='noExecute' id="file" hidden="hidden" name="docFile">
		</form>
        <div class="warn">注意：最多上传6张广告图片</div>
                <table class="table01" border="0">
                  <tr>
                          <th>序号</th>
                          <th>图片预览</th>
                          <th>广告跳转链接</th>
                          <th>创建时间</th>
                          <th>操作</th>
                  </tr>
                  <#list data.ds1 as record>
                   <tr>
                          <td>${record_index+1}</td>
                          <td><img src="${base}${record.image_url}?${.now}" width="150" /></td>
                          <td style="word-wrap: break-word;word-break:break-all;text-align:left;padding-left:10px;"  title="${record.ip_advertisement_linkif_exists}">
				    		  	${record.ip_advertisement_link?if_exists}
                          </td>
                          <td>${record.create_time?if_exists}</td>
                          <td><a href="#" onclick="del('${record.id?if_exists}')">删除</a></td>
                   </tr>
                  </#list>
        </table>
     
    <div id="under"></div>
  </div>
    
</div>
  
</body>
<script type='text/javascript'>
	function sum(){
		var num="6";
		var flag=false;
		$.ajax({
			type : "POST",  
			url:"${base}/backstagemerchant/verifyadvertisementnumbers.action",
			async:false,
			data:{number:num},
			success:function(data){
				data  = $.trim(data);
				alert(data);
			},
			error:function(){
				art.dialog.alert('操作失败，请于管理员联系！');
			}
		});
		return flag;
	}
	function verifyipAdvertisementLink(){
		var value=$("#ipAdvertisementLink").val();
		if(value==""){
			$("#verifyipAdvertisementLink").html("请填写广告跳转链接！");
			return false;
		}
		if(value.length>500){
			$("#verifyipAdvertisementLink").html("广告跳转链接不可以超过500个字符！");
			return false;
		}
		$("#verifyipAdvertisementLink").html("");
		return true;
	}
	function verifyimage(){
		var value=$("#imageId").val();
		if(value==""){
			$("#verifyimage").html("请上传图片！");
			return false;
		}
		$("#verifyimage").html("");
		return true;
	}
	function verifyimagenumber(){
		var num="6";
		var flag=false;
		$.ajax({
			type : "POST",  
			url:"${base}/backstagemerchant/verifyadvertisementnumber.action",
			async:false,
			data:{number:num},
			success:function(data){
				data  = $.trim(data);
				if(data=="1"){
					flag=true;
				}else{
					art.dialog.alert('注意：最多上传'+num+'张广告图片');
					flag=false;
				}
			},
			error:function(){
				art.dialog.alert('操作失败，请于管理员联系！');
			}
		});
		return flag;
	}
	function submit(){
		if(verifyipAdvertisementLink()&&verifyimage()&&verifyimagenumber()){
			doSearch();
		}else{
			art.dialog.alert('请填写正确的信息！');
			return false;
		}
	}
	function fileUpload(obj){
		var operand=$(obj);
		var arr=operand.val().split(".")[1];
		if(arr=='JPEG'||arr=='PNG'||arr=='GIF'||arr=='JPG'||arr=='jpeg'||arr=='png'||arr=='gif'||arr=='jpg'){
		  	$.ajax({
			    url: '${base}/fileupload/imageupload.action',
			    type: 'POST',
			    cache: false,
			    data: new FormData($('#fileForm')[0]),
			    processData: false,
			    contentType: false
			}).done(function(res) {
				$("#imageId").val(res.id);
				$("#imageh").attr("src","${base}"+res.url+"?${.now}");
			}).fail(function(res) {
				alert('上传失败');
			});
		}else{
			operand.val("");
			art.dialog.alert('你选择的图片格式不正确！');
		}
	}
	function del(id){
		art.dialog.confirm('请确认，您是否要删除？', function(){
			window.location.href ="${base}/backstagemerchant/verifyadvertisementdel.action?id="+id;
		});
		return true;
	}
	</script>
</html>
