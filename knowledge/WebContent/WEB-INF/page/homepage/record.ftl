<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>北京市中小企业公共服务平台-视频互联互播系统</title>
<link rel="stylesheet" href="${base}/vms/css/index.css">
<script type="text/javascript" src='${base}/common/js/jquery.min.js'></script>
<script type="text/javascript" src='${base}/vms/js/index.js'></script>
<script type="text/javascript" src="${base}/common/artdialog/artDialog.js?skin=opera"></script>
<script type="text/javascript" src="${base}/common/artdialog/plugins/iframeTools.js"></script>
<script type="text/javascript" src="${base}/vms/js/search.js"></script>
</head>
<body>
	<div class="g-head" >
			<div class="g-head-mid">
				<div class="logoBox">
					<a href="http://www.smebj.cn/portal/zxjpt/index.jsp" class='linkEixt'><img src="${base}/vms/images/link2_03.png" alt=""></a>
					<a href="http://www.smebj.cn/portal/zxjpt/index.jsp" class='lineStyle lineStyle2'></a>
					<a href="${base}/html/index.html" class='linkEixt2'><img src="${base}/vms/images/link2_05.png" alt=""></a>
				</div>
				<div class="ad-in">
					<div class="search-con">
						<form id="form" method="post" action="${base}/show.action?code=record">
							<input type="hidden" id="pageNo" name="pageNo" value="1" />
						</form>
						
						<#if '${user.username?if_exists}'==''>
							<span class="ren ren-index"><a href="http://www.smebj.cn/portal/app/mockapp/login.jsp?lrid=1">登录</a></span> 
						<#else>
							<#if '${user.belongorgType?if_exists}' == '6'||'${user.belongorgType?if_exists}' == '5'||'${user.belongorgType?if_exists}' == '4'>
								<span class="ren-right"><img src="${base}/vms/images/ren.png" alt=""></span>
								<span class="help">
								<span class='user'>用户中心</span>
									<div class="hid" style='display:none;'>
										<div class="sho2">
											<div class="sho2">
												<a href="${base}/show.action?code=favourite"><span>个人收藏</span></a>
											</div>
										</div>
										<div class="sho2">
											<a href="${base}/show.action?code=list_live"><span>管理后台</span></a>
										</div>
									</div>
								</span>
							<#else>
								<span class="ren-right"><img src="${base}/vms/images/ren.png" alt=""></span>
								<span class="help">
									<span class='user'>用户中心</span>
									<div class="hid" style='display:none;'>
											<div class="sho2">
												<a href="${base}/show.action?code=favourite"><span>个人收藏</span></a>
											</div>
											<div class="sho2">
												<a href="${base}/show.action?code=record"><span>观看记录</span></a>
											</div>
									</div>
								</span>
							</#if>
						</#if>
					</div>
				</div>
			</div>
		</div>
	<div class="recode">
		<img src="${base}/vms/images/nav_03.png" alt="1">
		<#list data.ds1 as record>
		<div class="listBox">
			<ul>
				<li class='imgLi'>
				 <#if '${record.if_login?if_exists}'=='1'>
				   <#if '${user.username?if_exists}' !="">
					<a target="_blank" href = "${base}/home/playvideo.action?id=${record.ID?if_exists}&type=2">
						<img src="${base}/${record.COVER?if_exists}/cast_rec.jpeg" alt="">
					</a>
					<#else>
					<a href="javascript:void(0)" onclick="alert()">
						<img src="${base}/${record.COVER?if_exists}/cast_rec.jpeg" alt="1">
					</a>	
				</#if>
			   <#else>
				<a target="_blank" href = "${base}/home/playvideo.action?id=${record.ID?if_exists}&type=2">
					<img src="${base}/${record.COVER?if_exists}/cast_rec.jpeg" alt="1">
				</a>	
			   </#if>
				</li>
				<li class='name'><span title="${record.NAME?if_exists}"><#if record.NAME?length lte 40>${record.NAME?if_exists}<#else>${record.NAME[0..39]}...</#if></span></li>
				<li class='eye'>${record.WATCH_COUNT?if_exists}</li>
				<li class='heart'>${record.COLLECT_COUNT?if_exists}</li>
				<li class='service'>${record.SERVICE_TYPE?if_exists}</li>
				<li class='time'>
				<#if '${record.LAST_WATCH_TIME?if_exists}' !="">
					${record.LAST_WATCH_TIME?string("yyyy-MM-dd")}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${record.LAST_WATCH_TIME?string("hh:mm:ss")}</li>
				</#if>
			</ul>
		</div>
		</#list>
		<div class="page-sperate">
				<a href="javascript:goPage(1,${data.ds1page.pageCount})" class="page-prev"><span>首页</span></a>
				<a href="javascript:goPage(${data.ds1page.prePage},${data.ds1page.pageCount})" class="page-prev"><span>上一页</span></a>
				<a href="javascript:goPage(${data.ds1page.nextPage},${data.ds1page.pageCount})" class="page-prev"><span>下一页</span></a>
				<a href="javascript:goPage(${data.ds1page.pageCount},${data.ds1page.pageCount})" class="page-prev"><span>尾页</span></a>
				<input type="text" id="pageint" name="pageint" value="${data.ds1page.pageNo}" class="page-xie">
				<a href="javascript:void(0)" onclick="skipPage(${data.ds1page.pageCount.toString()});" class="page-prev"><span>跳转</span></a>
				<span>共<span>${data.ds1page.pageCount}</span>页/<span class="t-blue">${data.ds1page.pageNo}</span>页</span>
			</div>
	</div>
		<div class="bottom">
		<ul>
			<li>
				<a href="javascript:void(0)">关于我们</a>
				<i>|</i>
				<a href="javascript:void(0)">联系我们</a>
				<i>|</i>
				<a href="javascript:void(0)">帮助中心</a>
				<i>|</i>
				<a href="javascript:void(0)">免责声明</a>
				<i>|</i>
				<a href="javascript:void(0)">客服机制</a>
				<i>|</i>
				<a href="javascript:void(0)">友情链接</a>
			</li>
			<li>京公网安备11010802017430 京ICP备06023392号 北京市中小企业服务中心</li>
			<li><span>地址：北京市海淀区新建宫门路2号中关村国家自主创新示范区</span><span class="right">E-mail：public@bjsidic.com</span></li>
			<li>版权所有 2013 技术支持：用友软件股份有限公司</li>
		</ul>
	</div>
</body>
<script>
function alert(){
	art.dialog.confirm('请登录后观看',function(){
	        }); 
}

//收藏视频
function collect(flag,id){
	$.ajax({
		type: "post",
	    url: "${base}/home/collectVideo.action",
	    data:{flag:flag,id:id},
	    async: false,
	    success: function(data) {
	    	$("#favourite").src="${base}/vms/images/xin.png?";
	    	
	    	art.dialog.confirm(data,function(){
	        });
	       },error:function(data){
	       		art.dialog.confirm('视频收藏失败，请稍后重试',function(){
	        });
	       }
	
	})	
}
</script>
</html>