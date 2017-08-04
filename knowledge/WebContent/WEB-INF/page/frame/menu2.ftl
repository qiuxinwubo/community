<div class="nav-left">
			<ul>
				<li class="nav-son">
					<a href="javascript:void(0)" id="live" class="live">直播</a>
					<ul>
						<li><a href="${base}/show.action?code=list_live" id="my-manage-live" class="nav-on">我管理的直播</a></li>
					</ul>
					<#if '${user.belongorgType?if_exists}' == '6'>
					<ul>
						<li><a href="${base}/show.action?code=list_admin_live" id="live-manage">直播监管</a></li>
					</ul>
					</#if>
				</li>
				<li class="nav-son">
					<a href="javascript:void(0)" id="meet" class="meet">会议</a>
					<ul>
						<li>
							<a href="javascript:void(0)" class="nav-show" id="my-meet">我参加的会议</a>
							<ul style="display:block;">
								<li><a href="${base}/show.action?code=sMeeting" id="not-meet">即将举行的会议</a></li>
								<li><a href="${base}/show.action?code=Meeting" id="now-meet">进行中的会议</a></li>
								<li><a href="${base}/show.action?code=endMeeting" id="meet-over">已结束的会议</a></li>
							</ul>
						</li>
						<li>
							<a href="${base}/show.action?code=list_Meeting" id="my-manage-meet">我管理的会议</a>
						</li>
						<#if '${user.belongorgType?if_exists}' == '6'>
						<li>
							<a href="${base}/show.action?code=manageMeeting" id="meet-manage">会议监管</a>
						</li>
						</#if>
					</ul>
				</li>
				<li class="nav-son">
					<a href="javascript:void(0)" id="video" class="video">视频点播</a>
					<ul>
						<li><a href="${base}/show.action?code=cast_seen_list" id="saw-video">我看过的点播</a></li>
					</ul>
					<#if '${user.belongorgType?if_exists}' == '6'>
					<ul>
						<li><a href="${base}/cast/supervise.action" id="video-manage">视频点播监管</a></li>
					</ul>
					</#if>
				</li>
			</ul>
		</div>