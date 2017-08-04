<div class="g-head-mid">
		<div class="g-head-mid">
			<div class="logoBox">
				<a target="_blank" href="http://www.smebj.cn/portal/zxjpt/index.jsp" class='linkEixt'><img src="${base}/vms/images/link_03.png" alt=""></a>
				<a target="_blank" href="http://www.smebj.cn/portal/zxjpt/index.jsp" class='lineStyle'></a>
				<a href="${base}/html/index.html" class='linkEixt2'><img src="${base}/vms/images/link_05.png" alt=""></a>
			</div>
			<div class="ad-in">
				<div class="search-con">
						<#if '${user.username?if_exists}'==''>
							<span class="ren ren-index"><a href="http://www.smebj.cn/portal/zxjpt/jsp/homeSubmit.jsp?targetUrl=http://video.smebj.cn/vms/html/index.html">登录</a></span> 
						<#else>
							<#if '${user.belongorgType?if_exists}' == '6'||'${user.belongorgType?if_exists}' == '5'||'${user.belongorgType?if_exists}' == '4'>
								<span class="ren-right"><img src="${base}/vms/images/aa_03.png" alt=""></span>
								<span class="help help2">
								<span class="user" style="color:#1f85e2">用户中心</span>
									<div class="hid hid2" style='display:none;'>
										<div class="sho">
											<div class="sho sho2">
												<a href="${base}/show.action?code=favourite"><span  style='color:#1FA3EC;'>个人收藏</span></a>
											</div>
										</div>
										<div class="sho">
											<a href="${base}/show.action?code=list_live"><span style='color:#1FA3EC;'>管理后台</span></a>
										</div>
									</div>
								</span>
							<#else>
								<span class="ren-right"><img src="${base}/vms/images/aa_03.png" alt=""></span>
									<span class="help help2">
									<span class="user" style="color:#1f85e2">用户中心</span>
										<div class="hid hid2" style='display:none;'>
											<div class="sho">
												<div class="sho sho2">
													<a href="${base}/show.action?code=favourite"><span style='color:#1FA3EC;'>个人收藏</span></a>
												</div>
											</div>
											<div class="sho">
												<a href="${base}/show.action?code=record"><span style='color:#1FA3EC;'>观看记录</span></a>
											</div>
										</div>
								</span>
							</#if>
						</#if>
				</div>
			</div>
		</div>