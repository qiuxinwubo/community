<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>知识产权</title>
	<link rel="shortcut icon" type="image/x-icon" href="${base}/common/images/icon.ico" media="screen" />
	<link rel="shortcut icon" type="image/x-icon" href="${base}/common/images/icon.ico" media="screen" /> 
    <link href="${base}/knowledge/css/sl_style.css" rel="stylesheet" type="text/css" />
	<script type='text/javascript' src='${base}/common/js/jquery-1.8.3.min.js'></script>
	<script type="text/javascript" src="${base}/common/js/koala.min.1.5.js"></script>
	<script type="text/javascript" src="${base}/knowledge/js/reception_index.js"></script>
    <!-- 弹出层 -->
    <script type="text/javascript" src="${base}/common/artdialog/artDialog.js?skin=opera"></script>
    <script type="text/javascript" src="${base}/common/artdialog/plugins/iframeTools.js"></script>
</head>
<body>
<!-- 头部bar -->
	<div id="top"></div>
	<div class="sl_indexMain">
		<div class="sl_banner">
			<div id="fsD1" class="focus">  
			    <div id="D1pic1" class="fPic">  
			    	<#list data.ds2 as record>
			        <div class="fcon" style="display: none;">
			            <a  href="${record.ip_advertisement_link?if_exists}"  target="_blank"><img src="${base}${record.image_url?if_exists}?.${now}" style="opacity: 1; "></a>
			        </div>
			        </#list>
			    </div>
			    <div class="fbg">  
			        <div class="D1fBt" id="D1fBt">  
			        	<#list data.ds2 as record>
			            <a href="javascript:void(0)" hidefocus="true" target="_self" class=""><i>${record_index+1}</i></a>  
			            </#list>
			        </div>  
			    </div>  
			    <span class="prev"></span>   
			    <span class="next"></span>    
			</div>
		</div>
		<div class="sl_indexMain1">
			<div class="left">
				<div class="titleBox">
					新闻资讯
					<a href="${base}/receptionaction/show.action?code=news_list">更多</a>
				</div>
				<iframe  frameborder=0 style="width: 100%;height: 160px;overflow: hidden;" src="http://www.smebj.cn/ncms/show.action?code=publish_ff8080815b571719015b8e61007d04ab&siteid=100530&channelid=0000001511"></iframe>
			</div>
			<div class="right">
				<div class="titleBox">
					产品案例
					<a href="${base}/receptionaction/show.action?code=case_list">更多</a>
				</div>
				<iframe  frameborder=0 style="width: 100%;height: 160px;overflow: hidden;" src="http://www.smebj.cn/ncms/show.action?code=publish_ff8080815b571719015baeba9a7c05fd&siteid=100530&channelid=0000001512"></iframe>
			</div>
		</div>
		<div id="imagehref"></div>
		<div class="sl_indexMain3">
			<div class="titleBox">
				最新产品推荐
			</div>
			<div class="productsBox">
				<#list data.ds1 as record>
					<div <#if (record_index+1)%4==0>style='margin-right:0px;'</#if>>
						<a href="${base}/receptionaction/show.action?code=re_product_detail&id=${record.id?if_exists}">
							<img src="${base}${record.image_url?if_exists}?${.now}" alt="">
						</a>
						<div class="productTitle">${record.name?if_exists}</div>
						<div class="priceBox">￥${record.price?if_exists}
						<span>
							<#if '${record.property?if_exists}'=='1'>全价
							<#elseif '${record.property?if_exists}'=='2'>最低价
							<#else>定金
							</#if>
						</span>
						</div>
						<div class="dataBox">
							<span class="productType" title="${record.ent_name?if_exists}">${record.ent_name?if_exists}</span>
							<span class="date">${record.create_time?string("yyyy-MM-dd")}</span>
						</div>
					</div>
				</#list>
			</div>
		</div>
	</div>
	<div id="under"></div>
<script type="text/javascript">
	Qfast.add('widgets', { path: "${base}/common/js/terminator2.2.min.js", type: "js", requires: ['fx'] });  
	Qfast(false, 'widgets', function () {
		K.tabs({
			id: 'fsD1',   //焦点图包裹id  
			conId: "D1pic1",  //** 大图域包裹id  
			tabId:"D1fBt",  
			tabTn:"a",
			conCn: '.fcon', //** 大图域配置class       
			auto: 1,   //自动播放 1或0
			effect: 'fade',   //效果配置
			eType: 'click', //** 鼠标事件
			pageBt:true,//是否有按钮切换页码
			bns: ['.prev', '.next'],//** 前后按钮配置class                          
			interval: 3000  //** 停顿时间  
		}) 
	})  
</script>
</body>
</html>