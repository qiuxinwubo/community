<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>知识产权</title>
	<link rel="shortcut icon" type="image/x-icon" href="${base}/common/images/icon.ico" media="screen" />
	<link href="${base}/knowledge/css/sl_style.css" rel="stylesheet" type="text/css" />
	<#-- 
	<link href="${base}/knowledge/css/modal_drop.css" rel="stylesheet" type="text/css" />
	-->
	<script type='text/javascript' src='${base}/common/js/jquery-1.8.3.min.js'></script>
	<script type="text/javascript" src="${base}/common/js/koala.min.1.5.js"></script>
	<#-- 
	<script type="text/javascript" src="${base}/knowledge/js/common.js"></script>
	-->
	<script type="text/javascript" src="${base}/knowledge/js/reception_index.js"></script>
</head>
<body>
	<!-- 头部bar -->
	<div id="top"></div>
	<div class="sl_productsMain">
		<div id="imagehref"></div>
		<div class="sl_productsTitle">${data.ds1[0].NAME?if_exists}</div>
		<div class="editText">
			<div class="editTextTitle">
				<img src="${base}/knowledge/images/slser_03.png" alt="">
			</div>
			<div class="editTextContent">
				${data.ds1[0].PRESENTATION?if_exists}
			</div>
		</div>
		<div class="editText">
			<div class="editTextTitle">
				<img src="${base}/knowledge/images/slser2_06.png" alt="">
			</div>
			<div class="editTextContent">
				${data.ds1[0].content?if_exists}
			</div>
		</div>
		<div class="editText">
			<div class="editTextTitle">
				<img src="${base}/knowledge/images/slser3_03.png" alt="">
			</div>
			<div class="editTextContent">
				${data.ds1[0].QUALIFICATION?if_exists}
			</div>
		</div>
		<div class="editText">
			<div class="editTextTitle">
				<img src="${base}/knowledge/images/slser4_06.png" alt="">
			</div>
			<div class="editTextContent" style='text-indent:0;'>
				<pre style="white-space:pre-wrap;">${data.ds1[0].QUESTION?if_exists}</pre>
			</div>
		</div>
		<div class="priceBox">
			<span class='allMoney'>费用总计：</span>￥${data.ds1[0].price?if_exists}
			<span class='describe'>
			<#if '${data.ds1[0].property?if_exists}'=='1'>全价
			<#elseif '${data.ds1[0].property?if_exists}'=='2'>起
			<#elseif '${data.ds1[0].property?if_exists}'=='3'>定金
			</#if>
			</span>
		</div>
		<div class="linkBox">
			<a href="javascript:;" style='background:#ff9c00;' onclick="chat('${data.ds1[0].ENT_ID?if_exists}')">在线咨询</a>
			<a href="javascript:;" style='background:#1d82d4;' onclick="redi('${data.ds1[0].DETAIL_URL?if_exists}','${data.ds1[0].ID?if_exists}','${data.ds1[0].ENT_ID?if_exists}')">查看详情</a>
		</div>
	</div>
	<#--<div id="under"></div>-->
	<#include "/frame/show_default_index.ftl">
<#--
<div class="modal-drop" id="drop">
        <div class="modal-dialog" id="modal-dialog">
        	<div class="row title"><span></span><span class="close" id="closeEle">×</span></div>
        	<div class="row">
        		<span class="info">请输入手机号：</span><input type="text" class="phone" required id="newPhone">
    		</div>
    		<div class="row">
    			<div><span class="btn" onclick="redi('${data.ds1[0].DETAIL_URL?if_exists}','${data.ds1[0].ID?if_exists}','${data.ds1[0].ENT_ID?if_exists}')">查看</span></div>
    		</div>
        </div>
    </div>
-->
	<script type="text/javascript" src="${base}/knowledge/js/re_product_detail.js"></script>
</body>
</html>