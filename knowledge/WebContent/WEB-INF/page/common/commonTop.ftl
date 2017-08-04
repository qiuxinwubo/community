<div class="head-wel">
	<div class="wel-bd clearfix">
		<div class="fl">
			<a href="/cms/show.action?code=publish_402880ed55fcd6c4015605f342c0000e&siteid=100000" class="home-btn">黑龙江省企业融资服务平台</a>
			<#if user??>
				欢迎您：${user.username}
				<a href="${base}/frame.action" class="login-btn">进入后台</a>
			<#else>
				<a href="${base}/index.action" class="login-btn">登录</a>
				<a href="${base}/reg.action" class="login-btn">注册</a>
			</#if>
		</div>
		<div class="fr">
			<a href="javascript:void(0)" onclick="AddFavorite(window.location,document.title)">加为收藏</a>|
			<a href="javascript:void(0)" onclick="SetHome(window.location)">设为首页</a>
		</div>
	</div>
</div>
<div class="w-banner"></div>
<div class="w-nav">
	<div class="nav-bd">
		<a href="/cms/show.action?code=publish_402880ed55fcd6c4015605f342c0000e&siteid=100000">首页</a>
		<a href="${base}/show.action?code=product_list">找资金</a>
		<a href="${base}/show.action?code=web_org">金融机构</a>
		<a href="/cms/show.action?code=jumpchanneltemplate&amp;siteid=100000&amp;channelid=0000000003">通知公告</a>
		<a href="/cms/show.action?code=jumpchanneltemplate&amp;siteid=100000&amp;channelid=0000000004">金融学院</a>
		<a href="/cms/show.action?code=jumpchanneltemplate&amp;siteid=100000&amp;channelid=0000000007">融资活动</a>
		<a href="/cms/show.action?code=jumpchanneltemplate&amp;siteid=100000&amp;channelid=0000000008">融资政策</a>
	</div>
</div>
<script>
function AddFavorite(sURL, sTitle) {
	try {
		window.external.addFavorite(sURL, sTitle);
	}
	catch (e) {
		try {
			window.sidebar.addPanel(sTitle, sURL, "");
		}
		catch (e) {
			alert("加入收藏失败，请使用Ctrl+D进行添加");
		}
	}
}
function SetHome(url) {
	if (document.all) {
        document.body.style.behavior='url(#default#homepage)';
        document.body.setHomePage(url);
    }else{
        alert("您好,您的浏览器不支持自动设置页面为首页功能,请您手动在浏览器里设置该页面为首页!");
    }
}
</script>