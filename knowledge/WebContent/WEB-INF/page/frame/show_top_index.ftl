<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>知识产权系统</title>
	<script type='text/javascript' src='${base}/common/js/jquery.min.js'></script>
	<script type='text/javascript' src='${base}/common/js/koala.min.1.5.js'></script>
	<script type='text/javascript' src='${base}/knowledge/js/sl_index.js'></script>
    <!-- 弹出层 -->
    <script type="text/javascript" src="${base}/common/artdialog/artDialog.js?skin=opera"></script>
    <script type="text/javascript" src="${base}/common/artdialog/plugins/iframeTools.js"></script>
	<script type='text/javascript'>
	function login(){
		window.location.href="${base}/LoginIpAction/loginbefore.action?url="+window.encodeURIComponent(window.location.href);
	}
	</script> 
</head>
<body>
<!-- 头部bar -->
	<div class="sl_topBox">
		<div class="sl_topMain">
			<ul>
				<#if user??>
					<li class='sl_topNav sl_onlineService' style="margin-left:886px;"><a href="javascript:void(0)">在线客服</a></li>
					<#if '${user.ifNature?if_exists}'!='3'><li class='sl_topNav'><a href="#" onclick="IntoBackground();">进入后台</a></li></#if>
					<li class='sl_rightLine'></li>
					<li class='sl_topNav'><a href="${base}/LoginIpAction/logout.action">退出</a></li>
				<#else>
				<li class='sl_topNav sl_onlineService'><a href="javascript:void(0)">在线客服</a></li>
				<li class='sl_topNav'><a href="${base}/LoginIpAction/registerbefore.action">注册</a></li>
				<li class='sl_rightLine'></li>
				<li class='sl_topNav'><a href="#" onclick="login();">登录</a></li>
		    	</#if>
			</ul>
			<span class='sl_timeBox'></span>
		</div>
	</div>
	<div class="sl_logoBox">
		<div class="sl_logoMain">
			<div class="sl_bigLogo">
				<a href="http://www.smebj.cn"><img src="${base}/knowledge/images/logo_01.png" alt=""></a>
			</div>
			<div class="sl_smallLogo">
				<a href="#"><img src="${base}/knowledge/images/logo_02.png" alt=""></a>
			</div>
		</div>
		<div class="sl_searchBox">
			<input type="text" placeholder='请输入关键字'>
			<input type="button">
		</div>
	</div>
	<div class="sl_navBox">
	    <div class="sl_navList">
	        <ul>
	            <li class="sl_serviceList">
	                <span>服务项目</span><span class="sl_navBtn sl_navListBtn">&nbsp;</span>
	                
	                
	                <div class="sl_navBanList">
	                    <ul>
	                        <li>
	                            <span>信息服务</span>
	                            
	                            
	                            <div class="sl_navBanner">
	                                <ul>
	                                    <!--<li><a href="#">法律法规信息查询</a></li><li><a href="#">政策信息查询</a></li><li><a href="#">技术信息查询</a></li><li><a href="#">产品信息查询</a></li><li><a href="#">标准信息查询</a></li><li><a href="#">人才信息查询</a></li><li><a href="#">市场信息查询</a></li><li><a href="#">物流信息查询</a></li><li><a href="#">管理信息查询</a></li><li><a href="#">专利信息查询</a></li><li><a href="#">专家信息查询</a></li><li><a href="#">服务机构查询</a></li><li><a href="#">企业信息查询</a></li><li><a href="#">价格行情查询</a></li><li><a href="#">其他信息服务</a></li>-->
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=100100" target="_blank">法律法规信息查询</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=100200" target="_blank">政策信息查询</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=100300" target="_blank">技术信息查询</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=100400" target="_blank">产品信息查询</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=100500" target="_blank">标准信息查询</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=100600" target="_blank">人才信息查询</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=100700" target="_blank">市场信息查询</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=100800" target="_blank">物流信息查询</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=100900" target="_blank">管理信息查询</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=101000" target="_blank">专利信息查询</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=101100" target="_blank">专家信息查询</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=101200" target="_blank">服务机构查询</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=101300" target="_blank">企业信息查询</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=101400" target="_blank">价格行情查询</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=109900" target="_blank">其他信息服务</a>
	                                    
	                                    
	                                    </li>
	                                </ul>
	                            </div>
	                        </li>
	                        <li>
	                            <span>投融资服务</span>
	                            
	                            
	                            <div class="sl_navBanner">
	                                <ul>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=110100" target="_blank">银行信贷服务</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=110200" target="_blank">信托服务</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=110300" target="_blank">基金服务</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=110400" target="_blank">证券服务</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=110500" target="_blank">小额贷款</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=110600" target="_blank">金融租赁</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=110700" target="_blank">风险投资</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=110800" target="_blank">典当</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=110900" target="_blank">信用征集与评价</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=111000" target="_blank">担保服务</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=111100" target="_blank">融资信息</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=111200" target="_blank">投融资推介和对接</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=111300" target="_blank">股权融资</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=111400" target="_blank">融资服务</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=119900" target="_blank">其他投融资服务</a>
	                                    
	                                    
	                                    </li>
	                                </ul>
	                            </div>
	                        </li>
	                        <li>
	                            <span>创业服务</span>
	                            
	                            
	                            <div class="sl_navBanner sl_navBanner_service">
	                                <ul>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=120100" target="_blank">提供创业信息</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=120200" target="_blank">商务计划书编制</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=120300" target="_blank">创业培训</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=120400" target="_blank">工商登记等政务代理</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=120500" target="_blank">行政许可申请服务</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=120600" target="_blank">创业辅导</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=120700" target="_blank">项目策划</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=120800" target="_blank">政务代理</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=120900" target="_blank">创业场地</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=121000" target="_blank">事务代理</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=121100" target="_blank">工商注册</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=121200" target="_blank">商务服务</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=121300" target="_blank">设立变更</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=121500" target="_blank">行业准营</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=121600" target="_blank">资质认证</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=121700" target="_blank">年审年检</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=121800" target="_blank">缴税缴费</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=121900" target="_blank">质检保障</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=122000" target="_blank">专题申报</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=122100" target="_blank">破产注销</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=122200" target="_blank">产权申请</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=122300" target="_blank">技术难题招标</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=122400" target="_blank">投融资</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=122500" target="_blank">招聘培训</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=122600" target="_blank">市场营销</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=129900" target="_blank">其他创业服务</a>
	                                    
	                                    
	                                    </li>
	                                </ul>
	                            </div>
	                        </li>
	                        <li>
	                            <span>人才与培训服务</span>
	                            
	                            
	                            <div class="sl_navBanner">
	                                <ul>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=130100" target="_blank">经营管理</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=130200" target="_blank">专业技术人员管理</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=130300" target="_blank">人才服务</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=130400" target="_blank">技能评级</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=130500" target="_blank">职称评审</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=130600" target="_blank">资质评审</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=130700" target="_blank">职业中介</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=130800" target="_blank">劳务派遣</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=130900" target="_blank">市场营销</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=131000" target="_blank">员工培训</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=131100" target="_blank">技术和创业培训</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=131200" target="_blank">人力资源培训</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=131300" target="_blank">信息化培训</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=131400" target="_blank">财税管理培训</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=131500" target="_blank">培训服务</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=139900" target="_blank">其他人才与培训服务</a>
	                                    
	                                    
	                                    </li>
	                                </ul>
	                            </div>
	                        </li>
	                        <li>
	                            <span>技术创新和质量服务</span>
	                            
	                            
	                            <div class="sl_navBanner sl_navBanner_Quality">
	                                <ul>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=140100" target="_blank">工业设计</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=140200" target="_blank">技术咨询</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=140300" target="_blank">知识产权</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=140400" target="_blank">节能降耗</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=140500" target="_blank">清洁生产</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=140600" target="_blank">污染防治技术应用</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=140700" target="_blank">产学研联合</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=140800" target="_blank">技术转移和成果转化</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=140900" target="_blank">适用技术推广</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=141000" target="_blank">创新资源共享</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=141100" target="_blank">质量检验检测</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=141200" target="_blank">原材料性能测试</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=141300" target="_blank">先进质量管理方法推广</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=141400" target="_blank">产品标准推广</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=141500" target="_blank">质量管理体系建立</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=141600" target="_blank">设备共享</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=141700" target="_blank">帮助企业申请相关体系和产品认证</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=141800" target="_blank">计算机网络服务</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=141900" target="_blank">管理信息化服务</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=142000" target="_blank">研发设计信息化服务</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=142100" target="_blank">解决方案</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=142200" target="_blank">质量控制和技术评价</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=142300" target="_blank">技术开发</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=142400" target="_blank">信息化应用</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=142500" target="_blank">专利服务</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=142600" target="_blank">新技术展销</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=149900" target="_blank">其他技术创新和质量服务</a>
	                                    
	                                    
	                                    </li>
	                                </ul>
	                            </div>
	                        </li>
	                        <li>
	                            <span>管理咨询服务</span>
	                            
	                            
	                            <div class="sl_navBanner">
	                                <ul>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=150100" target="_blank">战略管理咨询</a>
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=150200" target="_blank">财务管理咨询</a>
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=150300" target="_blank">人力资源管理咨询</a>
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=150400" target="_blank">市场营销咨询</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=150500" target="_blank">企业现场管理指导</a>
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=150600" target="_blank">清洁生产咨询</a>
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=150700" target="_blank">税务服务</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=150800" target="_blank">会计服务</a>
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=150900" target="_blank">审计服务</a>
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=151000" target="_blank">市场营销服务</a>
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=159900" target="_blank">其他管理咨询服务</a>
	                                    </li>
	                                </ul>
	                            </div>
	                        </li>
	                        <li>
	                            <span>市场开拓服务</span>
	                            
	                            
	                            <div class="sl_navBanner">
	                                <ul>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=160100" target="_blank">展览展销</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=160200" target="_blank">贸易洽谈</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=160300" target="_blank">产品推介</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=160400" target="_blank">国内外经济技术交流与合作</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=160500" target="_blank">帮助企业建立营销网络</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=160600" target="_blank">应用电子商务</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=160700" target="_blank">外贸代理</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=160800" target="_blank">市场考察与推荐</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=160900" target="_blank">物流</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=161000" target="_blank">在线营销</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=161100" target="_blank">公关和广告</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=169900" target="_blank">其他市场开拓和营销服务</a>
	                                    
	                                    
	                                    </li>
	                                </ul>
	                            </div>
	                        </li>
	                        <li>
	                            <span>法律服务</span>
	                            
	                            
	                            <div class="sl_navBanner">
	                                <ul>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=170100" target="_blank">法律诉讼</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=170200" target="_blank">法律援助</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=170300" target="_blank">法律文件代理</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=170400" target="_blank">公证服务</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=170500" target="_blank">仲裁服务</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=170600" target="_blank">调解服务</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=170700" target="_blank">债务清偿</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=170800" target="_blank">风险规避</a>
	                                    
	                                    
	                                    </li>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=179900" target="_blank">其他法律服务</a>
	                                    
	                                    
	                                    </li>
	                                </ul>
	                            </div>
	                        </li>
	                        <li>
	                            <span>其他服务</span>
	                            
	                            
	                            <div class="sl_navBanner">
	                                <ul>
	                                    <li>
	                                        <a href="http://se.smebj.cn/portal/show.action?code=fwList&amp;svtype2=900001" target="_blank">其他服务</a>
	                                    
	                                    
	                                    </li>
	                                </ul>
	                            </div>
	                        </li>
	                    </ul>
	                </div>
	            </li>
	            <li class="sl_navLi sl_highLight">
	                <a href="http://www.smebj.cn" target="_blank">首页</a>
	            
	            
	            </li>
	            <li class="sl_navLi">
	                <a href="http://policy.smebj.cn/" target="_blank">政策直通车</a>
	            
	            
	            </li>
	            <li class="sl_navLi">
	                <a href="http://www.smebj.cn/ncms/show.action?code=publish_4028809543cc960d0143cc9770510001&amp;siteid=100000" target="_blank">服务联盟</a>
	            
	            
	            </li>
	            <li class="sl_navLi">
	                <a href="http://43.254.24.74/portal/zxjpt/DEMO/lwck.jsp" target="_blank">窗口平台</a>
	            
	            
	            </li>
	            <li class="sl_navLi">
	                <a href="http://se.smebj.cn/portal/show.action?code=jgList" target="_blank">服务机构</a>
	            
	            
	            </li>
	            <li class="sl_navLi">
	                <a href="http://video.smebj.cn/vms/frame/showIndex.action" target="_blank">视频</a>
	            
	            
	            </li>
	        </ul>
	    </div>
	</div>
</body>
<script type='text/javascript'>
function IntoBackground(){
	$.ajax({
		url : get_url()+"/LoginIpAction/verifyNature.action",
		type: 'POST',
		async:false,
		success : function(data) {
			data=$.trim(data);
			if(data=="1"){
				art.dialog.alert("对不起，您没有进入后台的权限！")
			}else{
				window.open("${base}/backstagemerchant/backstage.action");
			}
		}
	});
}
</script> 
</html>