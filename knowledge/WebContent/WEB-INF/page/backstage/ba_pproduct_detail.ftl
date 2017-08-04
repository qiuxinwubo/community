<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>知识产权</title>
	<link rel="shortcut icon" type="image/x-icon" href="${base}/common/images/icon.ico" media="screen" />
    <link href="${base}/knowledge/css/style.css" rel="stylesheet" type="text/css" />
	<script type='text/javascript' src='${base}/common/js/jquery.min.js'></script>
	<script type='text/javascript' src='${base}/knowledge/js/common.js'></script>
</head>

<body>
        <div class="top" id="top"></div>
<div class="container">
         <div class="left"  id="left"></div>
         <input type="hidden" id="menu" value="3">
  <div class="right">
        <div class="position">当前位置&nbsp;&nbsp;>&nbsp;&nbsp;平台管理员账户&nbsp;&nbsp;>&nbsp;&nbsp;<span>商品详情</span></div>
      
        
        
        <form>      
                    <div><label>企业名称：</label>${data.ds1[0].ent_name?if_exists}</div>
                    <div><label>服务名称：</label>${data.ds1[0].name?if_exists}</div>
                    <div><label>商品图片预览：</label><img src="${base}${data.ds1[0].image_url?if_exists}?${.now}" width="232" height="160" /></div>
                    <div><label>服务介绍：</label><span style="width: 80%;text-align: left;">${data.ds1[0].presentation?if_exists}</span></div>
                    <div><label>服务内容：</label><span style="width: 80%;text-align: left;">${data.ds1[0].content?if_exists}</span></div>
                    <div><label>服务机构资质：</label><span style="width: 80%;text-align: left;">${data.ds1[0].qualification?if_exists}</span></div>
                    <div><label>常见问题：</label><span style="width: 80%;text-align: left;">${data.ds1[0].question?if_exists}</span></div>
                    <div><label>详情链接：</label>${data.ds1[0].detail_url?if_exists}</div>
                    <div><label>服务价格：</label>${data.ds1[0].price?if_exists}元（<#if '${data.ds1[0].property?if_exists}'=='1'>全价<#elseif '${data.ds1[0].property?if_exists}'=='2'>起<#elseif '${data.ds1[0].property?if_exists}'=='3'>定金</#if>）</div>
                    <div>
                    	<center>
                            <a href="javascript:history.go(-1);" class="save">返回</a>
                    	</center>
                    </div>
        </form>
    <div id="under"></div>
  </div>
    
</div>
  
</body>

</html>
