<div class="g-head" >
			<div class="g-head-mid">
				<div class="ad-in">
					<div class="search-con">
						<!--
						<input type="text" class="search" value="法律服务">
						<img src="${base}/vms/images/sousuo.png" alt="" class="souzuo">
						-->
						<#if '${user.username?if_exists}'!="">
							<span class="ren-right"><img src="${base}/vms/images/ren.png" alt=""></span>
							<span class="help">用户中心<div class="hid" style="display: none;">
							<div class="sho"><span>个人收藏</span></div>
							<div class="sho"><span>观看记录</span></div></div></span>
						<#else>
							<span class="help">登录<div class="hid" style="display: none;">
						</#if>
					</div>
				</div>
			</div>
		</div>