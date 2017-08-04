<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>知识产权</title>
	<link rel="shortcut icon" type="image/x-icon" href="${base}/common/images/icon.ico" media="screen" />
    <link href="${base}/knowledge/css/style.css" rel="stylesheet" type="text/css" />
	<script type='text/javascript' src='${base}/common/js/jquery.min.js'></script>
	<script type='text/javascript' src='${base}/common/js/jquery.form.js'></script>
	<script type='text/javascript' src='${base}/knowledge/js/common.js'></script>
	<script type='text/javascript' src='${base}/knowledge/js/ba_product_new.js'></script>
	<script type='text/javascript' src='${base}/knowledge/js/fileUpload.js'></script>
    <!-- 弹出层 -->
    <script type="text/javascript" src="${base}/common/artdialog/artDialog.js?skin=opera"></script>
    <script type="text/javascript" src="${base}/common/artdialog/plugins/iframeTools.js"></script>
<body>
		<div class="top" id="top"></div>
<div class="container">
        <div class="left"  id="left"></div>
  <div class="right">
        <div class="position">当前位置&nbsp;&nbsp;>&nbsp;&nbsp;平台管理员账户&nbsp;&nbsp;>&nbsp;&nbsp;<span>商品上传</span></div>
        <form id="form"  action="${base}/backstagemerchant/baPorductSave.action"  method="post">
        <input type="hidden" id="menu"  value="1" />
        <input type="hidden" id="id" name="id" value="${intellectualProperty.id}">
        <input type="hidden" id="entName" name="entName" value="${intellectualProperty.entName}">
        <input type="hidden" id="image" name="image" value="${intellectualProperty.image}">
        <input type="hidden" id="state" name="state" value="${intellectualProperty.state}">
        <input type="hidden" id="sign" name="sign" value="${sign}">
                    <div>
                    <label><span style="color:red">*</span>服务名称：</label>
                    <input name="name" type="text" value="${intellectualProperty.name}" onblur="verifyname();" id="name"/>
                    <span class="verify" id="verifyname"></span>
                    </div>
                    <div>
	                    <label><span style="color:red">*</span>请选择企业：</label>
                		<select id="entId" name="entId" onchange="entname();">
                			<option value="">请选择企业</option>
                			<#list entList as record>
						  		<option value ="${record.id}" <#if '${intellectualProperty.entId}'=='${record.id}'>selected</#if> onclick="">${record.entName}</option>
                			</#list>
						</select>
						<span class="verify" id="verifyent"></span>
                    </div>
                    <div>
                		<label><span style="color:red">*</span>商品图片上传：</label>
                		<a href="javascript:void(0)" onclick="document.getElementById('file').click();" style="width: 120px;height: 30px;text-align: center;line-height: 30px;display: inline-block;background: #428bca;color: #fff;text-decoration: none">浏览..</a>
                		<span class="verify" id="verifyimage"></span>
                    </div>
                    <div><label>商品图片预览：</label><img src=<#if '${sign}'=='1'||'${imageurl}'==''>"${base}/knowledge/images/preview.jpg"<#else>"${base}${imageurl}?${.now}"</#if> width="232" id="imageh" height="160" /></div>
                    <div>
	                    <label><span style="color:red">*</span>服务介绍：</label>
	                    <textarea name="presentation" id="presentation" rows="4" onblur="verifypresentation();">${intellectualProperty.presentation}</textarea>
	                    <span class="verify" id="verifypresentation" style="color:red;"></span>
                    </div>
                    <div>
	                    <label><span style="color:red">*</span>服务内容：</label>
	                    <textarea name="content" id="content" rows="4" onblur="verifycontent();">${intellectualProperty.content}</textarea>
	                    <span class="verify" id="verifycontent" style="color:red;"></span>
                    </div>
                    <div>
	                    <label><span style="color:red">*</span>服务机构资质：</label>
	                    <textarea name="qualification" id="qualification" rows="4" onblur="verifyqualification();">${intellectualProperty.qualification}</textarea>
	                    <span class="verify" id="verifyqualification" style="color:red;"></span>
                    </div>
                    <div><label style='vertical-align:top;'><span style="color:red">*</span>常见问题：</label><textarea id="question" name="question" rows="7" style='text-align:left;' onblur="verifyquestion();"><#if '${intellectualProperty.question}'==''>
问题1：
答案1：


问题2：
答案2：
<#else>
${intellectualProperty.question}
</#if>
</textarea>
 <span class="verify" id="verifyquestion" style="color:red;"></span>
</div>
                    <div><label>
	                    <span style="color:red">*</span>详情链接：</label>
	                    <input name="detailUrl" id="detailUrl" onblur="verifydetailUrl();" type="text" value="${intellectualProperty.detailUrl}" />
	                    <span class="verify" id="verifydetailUrl" style="color:red;"></span>
                    </div>
                    <div>
	                    <label><span style="color:red">*</span>服务价格：</label>
	                    <input name="price" id="price" onblur="verifyprice();" type="text" value="${intellectualProperty.price}" />元
                         <input class="input01"  name="property" type="radio" value="1" <#if '${intellectualProperty.property}'=='1'||'${intellectualProperty.property}'==''>checked</#if> />价格&nbsp;&nbsp;
                         <input class="input01"  name="property" type="radio" value="2" <#if '${intellectualProperty.property}'=='2'>checked</#if>/>起&nbsp;&nbsp;
                         <input class="input01"  name="property" type="radio" value="3" <#if '${intellectualProperty.property}'=='3'>checked</#if>/>定金
                    </div>
                    <div>
	                    <label></label>
                         <span class="verify" id="verifyprice" style="color:red;width:220px;text-align: left;"></span>
                    </div>
                    <div>
                    	<center>
                    		<a href="javascript:void(0)" onclick="submit('1');" class="save">保存</a>
                    		<a href="javascript:void(0)" onclick="submit('2');" class="save">提交</a>
                    		<a href="javascript:history.go(-1);" class="save">返回</a>
                    	</center>
                    </div>
        </form>
    	<form  id="fileForm"  method="post" multiple="multiple">
    		 <input type="file" onchange="fileUpload(this)"class='noExecute' id="file" hidden="hidden" name="docFile">
		</form>
     <div id="under"></div>
  </div>
</div>
</body>
	<script type='text/javascript'>
	function submit(type){
		if(verifyname()&&verifyent()&&verifyimage()&&verifycontent()&&verifydetailUrl()&&verifyprice()){
			$("#state").val(type);
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
				$("#image").val(res.id);
				$("#imageh").attr("src","${base}"+res.url+"?${.now}");
			}).fail(function(res) {
				alert('上传失败');
			});
		}else{
			operand.val("");
			art.dialog.alert('你选择的图片格式不正确！');
		}
	}
	</script>
</html>
