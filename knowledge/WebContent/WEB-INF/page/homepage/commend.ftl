<script type="text/javascript" src="${base}/common/artdialog/artDialog.js?skin=opera"></script>
<script type="text/javascript" src="${base}/common/artdialog/plugins/iframeTools.js"></script>
<div class="Commend">
			<div class="title">热门推荐</div>
			<div class="content">
				<ul>
				<#list data.ds1 as record>
					<li>
						<#if '${record.if_login?if_exists}'=='1'>
							<#if '${user.username?if_exists}' !="">
								<a target="_blank" href = "${base}/home/playvideo.action?id=${record.ID?if_exists}&type=2">
									<img src="${base}/${record.COVER?if_exists}/cast_mid.jpeg" alt="">
								</a>
							<#else>
								<a href="javascript:void(0)" onclick="alarm()">
									<img src="${base}/${record.COVER?if_exists}/cast_mid.jpeg" alt="">
								</a>
							</#if>
						<#elseif '${record.if_login?if_exists}'=='2'>
							<a target="_blank"  href = "${base}/home/playvideo.action?id=${record.ID?if_exists}&type=2">
								<img src="${base}/${record.COVER?if_exists}/cast_mid.jpeg" alt="">
							</a>
						</#if>
						<div class="text">
							<p title="${record.NAME?if_exists}"><#if record.NAME?length lte 11>${record.NAME?if_exists}<#else>${record.NAME[0..10]}...</#if></p>
							<a href="javascript:void(0)" class="play">${record.WATCH_COUNT?if_exists}</a>
							<a href="javascript:void(0)" class="time">
							<#if '${record.UP_TIME?if_exists}'!="">
								${record.UP_TIME?string("yyyy-MM-dd")}</a>
							</#if>
						</div>
						<i></i>
					</li>
				</#list>
				</ul>
			</div>
		</div>		
<script>
	function alarm(){
		art.dialog.alert('请登录后观看',function(){
		        }); 
	}

</script>
	
	
