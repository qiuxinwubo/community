<script type="text/javascript" src="${base}/common/artdialog/artDialog.js?skin=opera"></script>
<script type="text/javascript" src="${base}/common/artdialog/plugins/iframeTools.js"></script>
	<div class="container">
			<div class="videoImg">
				<#list data.ds1 as record>
					<#if (record_index)==0>
						<#if '${record.flag?if_exists}'=='1'>
							<img src="${base}/${record.covre?if_exists}/live_max.jpeg" alt="1">
						<#elseif '${record.flag?if_exists}'=='2'>
							<img src="${base}/${record.covre?if_exists}/cast_max.jpeg" alt="1">
						</#if>
							<div class="videoTitle">
								<div class="videoBtn">
									<#if '${record.flag?if_exists}'=='1'>
										<#if '${record.if_login?if_exists}'=='1'>
											<#if '${user.username?if_exists}' !="">
												<a target="_blank" href="${base}/home/playvideo.action?id=${record.ID?if_exists}&type=1"><img src="${base}/vms/images/videoBtn_03.png" alt=""></a>
											</#if>
										<#elseif '${record.if_login?if_exists}'=='2'>
											<a target="_blank" href="${base}/home/playvideo.action?id=${record.ID?if_exists}&type=1"><img src="${base}/vms/images/videoBtn_03.png" alt=""></a>
										</#if>
									<#elseif '${record.flag?if_exists}'=='2'>
										<#if '${record.if_login?if_exists}'=='1'>
											<#if '${user.username?if_exists}' !="">
												<a target="_blank" href="${base}/home/playvideo.action?id=${record.ID?if_exists}&type=2"><img src="${base}/vms/images/videoBtn_03.png" alt=""></a>
											</#if>
										<#elseif '${record.if_login?if_exists}'=='2'>
											<a target="_blank" href="${base}/home/playvideo.action?id=${record.ID?if_exists}&type=2"><img src="${base}/vms/images/videoBtn_03.png" alt=""></a>
										</#if>	
									</#if>
									
								</div>
								<div class="titleText">
									<span class="title1" title="${record.SUBJECT?if_exists}">
										<#if record.SUBJECT?length lte 14>${record.SUBJECT?if_exists}<#else>${record.SUBJECT[0..13]}...</#if>
									</span>
									<#if '${record.flag?if_exists}'=='1'>
										<span class="title2" title="${record.SUBJECT?if_exists}">
											<#if '${record.START_TIME?if_exists}' !="" && '${record.END_TIME?if_exists}' !="">
												<#if '${record.START_TIME?string("yyyy-MM-dd")}' == '${record.END_TIME?string("yyyy-MM-dd")}'>
													${record.START_TIME?string("yyyy年MM月dd日 hh:mm")}~${record.END_TIME?string("hh:mm")}
												<#else>
													${record.START_TIME?string("yyyy年MM月dd日 hh:mm")}~${record.END_TIME?string("yyyy年MM月dd日 hh:mm")}
												</#if>
											</#if>
										</span>
									</#if>

								</div>
							</div>
					</#if>
				</#list>
			</div>
			<div class="liveList">
				<div class="live">
					<span>热门视频</span>
				</div>
				<ul>
					<!--循环list-->
					<#list data.ds1 as record>
						<!--判断是否为第一条-->
						<#if (record_index)==0>
							<!--判断是否为直播-->
							<#if '${record.flag?if_exists}'='1'>
								<!--判断是否需要登录才能观看-->
								<#if '${record.if_login?if_exists}'=='1'>
									<!--判断用户是否登录-->
									<#if '${user.username?if_exists}' !="">
										<Li class='liveLi'><a target="_blank" title="${record.SUBJECT?if_exists}" href="${base}/home/playvideo.action?id=${record.ID?if_exists}&type=1"><span>直播</span><#if record.SUBJECT?length lte 14>${record.SUBJECT?if_exists}<#else>${record.SUBJECT[0..13]}...</#if></a></Li>
									<!--用户未登录弹框提示-->
									<#else>
										<Li class='liveLi'><a href=javascript:void(0)" title="${record.SUBJECT?if_exists}"onclick="iflog();"><span>直播</span><#if record.SUBJECT?length lte 14>${record.SUBJECT?if_exists}<#else>${record.SUBJECT[0..13]}...</#if></a></Li>
									</#if>
									<!--不需要登录就能观看-->
								<#elseif '${record.if_login?if_exists}'=='2'>
									<Li class='liveLi'><a target="_blank" title="${record.SUBJECT?if_exists}" href="${base}/home/playvideo.action?id=${record.ID?if_exists}&type=1"><span>直播</span><#if record.SUBJECT?length lte 14>${record.SUBJECT?if_exists}<#else>${record.SUBJECT[0..13]}...</#if></a></Li>
								</#if>
								<!--判断为点播-->
							<#elseif '${record.flag?if_exists}'='2'>
								<!--判断是否需要登录-->
								<#if '${record.if_login?if_exists}'=='1'>
									<!--判断session是否存在-->
									<#if '${user.username?if_exists}' !="">
										<Li class='liveLi'><a target="_blank" href="${base}/home/playvideo.action?id=${record.ID?if_exists}&type=2"><span title="${record.SUBJECT?if_exists}">点播</span><#if record.SUBJECT?length lte 14>${record.SUBJECT?if_exists}<#else>${record.SUBJECT[0..13]}...</#if></a></Li>
									<#else>
										<Li class='liveLi'><a href=javascript:void(0)" onclick="iflog();"><span title="${record.SUBJECT?if_exists}">点播</span><#if record.SUBJECT?length lte 14>${record.SUBJECT?if_exists}<#else>${record.SUBJECT[0..13]}...</#if></a></Li>
									</#if>
								<#elseif '${record.if_login?if_exists}'=='2'>
									<Li class='liveLi'><a target="_blank" href="${base}/home/playvideo.action?id=${record.ID?if_exists}&type=2"><span title="${record.SUBJECT?if_exists}">点播</span><#if record.SUBJECT?length lte 14>${record.SUBJECT?if_exists}<#else>${record.SUBJECT[0..13]}...</#if></a></Li>
								</#if>
							</#if>
						<#else>
							<!--判断是否为直播-->
							<#if '${record.flag?if_exists}'='1'>
									<!--判断是否需要登录才能观看-->
									<#if '${record.if_login?if_exists}'=='1'>
									<!--判断用户是否登录-->
									<#if '${user.username?if_exists}' !="">
										<Li class='listLi'><a target="_blank" href="${base}/home/playvideo.action?id=${record.ID?if_exists}&type=1"><span class='numBox'>${record_index+1}</span>
												<span class='liveName' title="${record.SUBJECT?if_exists}"><#if record.SUBJECT?length lte 14>${record.SUBJECT?if_exists}<#else>${record.SUBJECT[0..13]}...</#if></span>
												<span class="data">
													<#if '${record.START_TIME?if_exists}'!="">
														${record.START_TIME?string("yyyy年MM月dd日")}
													</#if>
												</span>
											</a>
										</Li>
									<!--用户未登录弹框提示-->
									<#else>
										<Li class='listLi'><a href="javascript:void(0);" onclick="iflog();"><span class='numBox'>${record_index+1}</span>
												<span class='liveName' title="${record.SUBJECT?if_exists}"><#if record.SUBJECT?length lte 14>${record.SUBJECT?if_exists}<#else>${record.SUBJECT[0..13]}...</#if></span>
												<span class="data">
													<#if '${record.START_TIME?if_exists}'!="">
														${record.START_TIME?string("yyyy年MM月dd日")}
													</#if>
												</span>
											
											</a>
										</Li>
									</#if>
									<!--不需要登录就能观看-->
								<#elseif '${record.if_login?if_exists}'=='2'>
									<Li class='listLi'>
										<a target="_blank" href="${base}/home/playvideo.action?id=${record.ID?if_exists}&type=1"><span class='numBox'>${record_index+1}</span>
											<span class='liveName ' title="${record.SUBJECT?if_exists}"><#if record.SUBJECT?length lte 14>${record.SUBJECT?if_exists}<#else>${record.SUBJECT[0..13]}...</#if></span>
											<span class="data">
													<#if '${record.START_TIME?if_exists}'!="">
														${record.START_TIME?string("yyyy年MM月dd日")}
													</#if>
											</span>
										</a>
									</Li>
								</#if>
								<!--判断为点播-->
							<#elseif '${record.flag?if_exists}'='2'>
								<!--判断是否需要登录-->
								<#if '${record.if_login?if_exists}'=='1'>
									<!--判断session是否存在-->
									<#if '${user.username?if_exists}' !="">
										<Li class='listLi'><a target="_blank" href="${base}/home/playvideo.action?id=${record.ID?if_exists}&type=2"><span class='numBox'>${record_index+1}</span>
												<span class='liveName ' title="${record.SUBJECT?if_exists}"><#if record.SUBJECT?length lte 14>${record.SUBJECT?if_exists}<#else>${record.SUBJECT[0..13]}...</#if></span>
												<span class="data">
													<#if '${record.STATUS_TIME?if_exists}'!="">
														${record.STATUS_TIME?string("yyyy年MM月dd日")}
													</#if>
												</span>
											</a>
										</Li>
									<!--未登录的弹框提示-->
									<#else>
									<!--用户未登录弹框提示-->
										<Li class='listLi'><a href="javascript:void(0)" onclick="iflog();"><span class='numBox'>${record_index+1}</span>
												<span class='liveName ' title="${record.SUBJECT?if_exists}"><#if record.SUBJECT?length lte 14>${record.SUBJECT?if_exists}<#else>${record.SUBJECT[0..13]}...</#if></span>
												<span class="data">
													<#if '${record.STATUS_TIME?if_exists}'!="">
														${record.STATUS_TIME?string("yyyy年MM月dd日")}
													</#if>
												</span>
											</a>
										</Li>
									</#if>
								<!--不需要登录就能观看-->
								<#elseif '${record.if_login?if_exists}'=='2'>
									<Li class='listLi'><a target="_blank" href="${base}/home/playvideo.action?id=${record.ID?if_exists}&type=2"><span class='numBox'>${record_index+1}</span>
										<span class='liveName' title="${record.SUBJECT?if_exists}"><#if record.SUBJECT?length lte 14>${record.SUBJECT?if_exists}<#else>${record.SUBJECT[0..13]}...</#if></span>
										<span class="data ">
												<#if '${record.STATUS_TIME?if_exists}'!="">
													${record.STATUS_TIME?string("yyyy年MM月dd日")}
												</#if>
											</span>
									
										</a>
									</Li>
								</#if>
							</#if>
						</#if>	
					</#list>	
				</ul>
			</div>
	</div>
<script>
function iflogin(){
	art.dialog.alert('请登录后观看',function(){
	        }); 
}

</script>