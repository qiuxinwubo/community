<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>北京市中小企业公共服务平台-视频互联互播系统</title>
	<link rel="stylesheet" type="text/css" href="${base}/vms/css/index.css">
	<script type="text/javascript" src="${base}/common/js/jquery.min.js"></script>
	<script type="text/javascript" src="${base}/vms/js/index.js"></script>
	<script type="text/javascript" src="${base}/common/artdialog/artDialog.js?skin=opera"></script>
	<script type="text/javascript" src="${base}/common/artdialog/plugins/iframeTools.js"></script>
	<script type="text/javascript" src="${base}/vms/js/search.js"></script>
</head>
<body>
	<div class="gxl-body">
		<div class="g-head">
			<div class="g-head-mid">
				<div class="logoBox">
					<a href="http://www.smebj.cn/portal/zxjpt/index.jsp" class='linkEixt'><img src="${base}/vms/images/link2_03.png" alt=""></a>
					<a href="http://www.smebj.cn/portal/zxjpt/index.jsp" class='lineStyle lineStyle2'></a>
					<a href="${base}/html/index.html" class='linkEixt2'><img src="${base}/vms/images/link2_05.png" alt=""></a>
				</div>
				<div class="ad-in">
					<div class="search-con">
						<form id="form" method="post" action="${base}/show.action?code=secondLevMenu&service_type=${args.service_type}">
							<input type="hidden" id="pageNo" name="pageNo" value="1" />
						</form>
						<#if '${user.username?if_exists}'==''>
							<span class="ren ren-index"><a href="http://www.smebj.cn/portal/zxjpt/jsp/homeSubmit.jsp?targetUrl=http://video.smebj.cn/vms/html/index.html" style="color:#fff;">登录</a></span> 
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
		<div class="g-nav">
			<div class="g-nav-back">
				<div  class="g-nav-al">
					<span class="g-nav-a" >
						<#if '${args.service_type}'=='110000'>
							&nbsp;&nbsp;&nbsp;政&nbsp;策&nbsp;辅&nbsp;导
						<#elseif '${args.service_type}'=='120000'>
							&nbsp;&nbsp;&nbsp;创&nbsp;业&nbsp;辅&nbsp;导
						<#elseif '${args.service_type}'=='130000'>
							&nbsp;&nbsp;&nbsp;项&nbsp;目&nbsp;路&nbsp;演
						<#elseif '${args.service_type}'=='210000'>
							&nbsp;&nbsp;人力资源管理
						<#elseif '${args.service_type}'=='220000'>
							&nbsp;&nbsp;&nbsp;财&nbsp;税&nbsp;辅&nbsp;导
						<#elseif '${args.service_type}'=='230000'>
							&nbsp;&nbsp;&nbsp;法&nbsp;律&nbsp;辅&nbsp;导
						<#elseif '${args.service_type}'=='310000'>
							&nbsp;&nbsp;&nbsp;市&nbsp;场&nbsp;开&nbsp;拓
						<#elseif '${args.service_type}'=='320000'>
							技术与质量管理
						<#elseif '${args.service_type}'=='330000'>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;其&nbsp;&nbsp;&nbsp;&nbsp;他&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
						</#if>
					</span>
				</div>
				<div class="g-nav-move">
					<div class="g-nav-al">
						<a href="javascript:void(0)" class="g-nav-a2" onclick="alter('1');">按点击量排序</a>
					</div>
					<div class="ge1"></div>
					<div class="g-nav-al">
						<a href="javascript:void(0)" class="g-nav-a2" onclick="alter('2');">按时间排序</a>
					</div>
				</div>
			</div>
		<div id="timeOrder">
				<div class="picture">
				<#list data.ds1 as record>
					<div class="pic">
						<#if '${record.if_login?if_exists}'=='1'>
							<#if '${user.username?if_exists}' !="">
								<a target="_blank" href = "${base}/home/playvideo.action?id=${record.ID?if_exists}&type=2">
									<img src="${base}/${record.COVER?if_exists}/cast_mid.jpeg" alt="1">
								</a>	
							<#else>
								<a href="javascript:void(0)" onclick="iflog()">
									<img src="${base}/${record.COVER?if_exists}/cast_mid.jpeg" alt="1">
								</a>	
							</#if>
						<#else>
							<a target="_blank" href = "${base}/home/playvideo.action?id=${record.ID?if_exists}&type=2">
								<img src="${base}/${record.COVER?if_exists}/cast_mid.jpeg" alt="1">
							</a>	
						</#if>
							<div class="img-text">
								<span class="img-text-son" title="${record.name?if_exists}" style="display:block;">
									<#if record.name?length lte 11>${record.name?if_exists}<#else>${record.name[0..10]}...</#if>
								</span>
								<span class="gplay">${record.WATCH_COUNT?if_exists}</span>
								<span class="gtime">
									<#if '${record.up_time?if_exists}'!="">
										${record.up_time?string("yyyy-MM-dd")}
									</#if>
								</span>
							</div>
					</div>
				</#list>
			</div>
		</div>	

			<div class="page-sperate" id="page1">
				<a href="javascript:goPage(1,${data.ds1page.pageCount})" class="page-prev"><span>首页</span></a>
				<a href="javascript:goPage(${data.ds1page.prePage},${data.ds1page.pageCount})" class="page-prev"><span>上一页</span></a>
				<a href="javascript:goPage(${data.ds1page.nextPage},${data.ds1page.pageCount})" class="page-prev"><span>下一页</span></a>
				<a href="javascript:goPage(${data.ds1page.pageCount},${data.ds1page.pageCount})" class="page-prev"><span>尾页</span></a>
				<input type="text" id="pageint" name="pageint" value="${data.ds1page.pageNo}" class="page-xie">
				<a href="javascript:void(0)" onclick="skipPage(${data.ds1page.pageCount.toString()});" class="page-prev"><span>跳转</span></a>
				<span>共<span>${data.ds1page.pageCount}</span>页/<span class="t-blue">${data.ds1page.pageNo}</span>页</span>
			</div>

		</div>


		<!-- 底部 -->
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
	</div>
</body>
<script>
function iflog(){
	art.dialog.alert('请登录后观看',function(){
	}); 
}


function alter(flag){
	if(flag==1){
		window.location.href="${base}/show.action?code=secondLevMenu&service_type=${args.service_type}";
	}else if(flag==2){
		window.location.href="${base}/show.action?code=secondLevMenu2&service_type=${args.service_type}";
	}	
}
</script>
</html>