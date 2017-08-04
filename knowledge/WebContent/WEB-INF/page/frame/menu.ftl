<ul>
	<#if '${user.ifNature}'!='1'>
    <li id="li1"><a href="${base}/show.action?code=ba_sproduct_list">产品管理</a></li>
	<#else>
	<li id="li2"><a href="${base}/backstagemerchant/backstage.action">广告图片管理</a></li>
    <li id="li3"><a href="${base}/show.action?code=ba_pproduct_list">产品管理</a></li>
    <li id="li4"><a href="${base}/show.action?code=ba_ent_list">商家管理</a></li>
    <li id="li5"><a href="${base}/show.action?code=ba_leave_word_list">留言管理</a></li>
    <li id="li6"><a href="${base}/show.action?code=ba_rc_user_statistics">返回用户信息</a></li>
    <li id="li7"><a href="${base}/show.action?code=ba_rc_deal_statistics">成交产品信息</a></li>
    <li id="li8"><a href="${base}/show.action?code=ba_skip_record">跳转记录</a></li>
    
    </#if>
</ul>
<script>
$(function(){
	var num=$("#menu").val();
	$("#li"+num).addClass("active");
});
</script>