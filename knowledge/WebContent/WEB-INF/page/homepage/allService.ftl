<script type="text/javascript" src='../vms/js/index.js'></script>
<script type="text/javascript" src="${base}/common/artdialog/artDialog.js?skin=opera"></script>
<script type="text/javascript" src="${base}/common/artdialog/plugins/iframeTools.js"></script>
	<div class="tabNav">
			<ul>
				<li class='on'><a class='link' href="javascript:void(0)" onclick="show('${data.ds10[0].service_type_code}');">${data.ds10[0].service_type_name}</a></li>
				<li><a class='link' href="javascript:void(0)" onclick="show('${data.ds10[1].service_type_code}');">${data.ds10[1].service_type_name}</a></li>
				<li ><a class='link'href="javascript:void(0)" onclick="show('${data.ds10[2].service_type_code}');">${data.ds10[2].service_type_name}</a></li>
				<li ><a class='link'href="javascript:void(0)" onclick="show('${data.ds10[3].service_type_code}');">${data.ds10[3].service_type_name}</a></li>
				<li><a class='link' href="javascript:void(0)"  onclick="show('${data.ds10[4].service_type_code}');">${data.ds10[4].service_type_name}</a></li>
				<li><a class='link' href="javascript:void(0)"  onclick="show('${data.ds10[5].service_type_code}');">${data.ds10[5].service_type_name}</a></li>
				<li><a class='link' href="javascript:void(0)"  onclick="show('${data.ds10[6].service_type_code}');">${data.ds10[6].service_type_name}</a></li>
				<li><a class='link' href="javascript:void(0)"  onclick="show('${data.ds10[7].service_type_code}');">${data.ds10[7].service_type_name}</a></li>
				<li><a class='link' href="javascript:void(0)"  onclick="show('${data.ds10[8].service_type_code}');">${data.ds10[8].service_type_name}</a></li>
			</ul>
		</div>
	<!-- 法律 -->
		<div class="tabBox">
		<#list data.ds1 as record1>
			<div class="service">
			<#if '${record1.if_login?if_exists}'=='1'>
				<#if '${user.username?if_exists}' !="">
					<a target="_blank" href = "${base}/home/playvideo.action?id=${record1.ID?if_exists}&type=2">
						<img src="${base}/${record1.COVER?if_exists}/cast_mid.jpeg" alt="1"><span title="${record1.NAME?if_exists}"><#if record1.NAME?length lte 11>${record1.NAME?if_exists}<#else>${record1.NAME[0..10]}...</#if></span>
					</a>	
				<#else>
					<a href="javascript:void(0)" onclick="iflog()">
						<img src="${base}/${record1.COVER?if_exists}/cast_mid.jpeg" alt="1"><span title="${record1.NAME?if_exists}"><#if record1.NAME?length lte 11>${record1.NAME?if_exists}<#else>${record1.NAME[0..10]}...</#if></span>
					</a>	
				</#if>
			<#elseif '${record1.if_login?if_exists}'=='2'>
				<a target="_blank" href = "${base}/home/playvideo.action?id=${record1.ID?if_exists}&type=2">
					<img src="${base}/${record1.COVER?if_exists}/cast_mid.jpeg" alt="1"><span title="${record1.NAME?if_exists}"><#if record1.NAME?length lte 11>${record1.NAME?if_exists}<#else>${record1.NAME[0..10]}...</#if></span>
				</a>	
			</#if>
				<ul>
					<li class='date'>${record1.UP_TIME?string("yyyy-MM-dd")}</li>
					<li class='num'>${record1.WATCH_COUNT}</li>
				</ul>
			</div>
		</#list>
		</div>
		<!-- 信息 -->
		<div class="tabBox" style='display: none;'>
		<#list data.ds2 as record2>
			<div class="service">
			<#if '${record2.if_login?if_exists}'=='1'>
				<#if '${user.username?if_exists}' !="">
					<a target="_blank" href = "${base}/home/playvideo.action?id=${record2.ID?if_exists}&type=2">
						<img src="${base}/${record2.COVER?if_exists}/cast_mid.jpeg" alt="1"><span title="${record2.NAME?if_exists}"><#if record2.NAME?length lte 11>${record2.NAME?if_exists}<#else>${record2.NAME[0..10]}...</#if></span>
					</a>
				<#else>
					<a href="javascript:void(0)" onclick="iflog()">
						<img src="${base}/${record12.COVER}/cast_mid.jpeg" alt="1"><span title="${record2.NAME?if_exists}"><#if record2.NAME?length lte 11>${record2.NAME?if_exists}<#else>${record2.NAME[0..10]}...</#if></span>
					</a>
				</#if>
			<#elseif '${record2.if_login?if_exists}'=='2'>
				<a target="_blank" href = "${base}/home/playvideo.action?id=${record2.ID?if_exists}&type=2">
					<img src="${base}/${record2.COVER?if_exists}/cast_mid.jpeg" alt="1"><span title="${record2.NAME?if_exists}"><#if record2.NAME?length lte 11>${record2.NAME?if_exists}<#else>${record2.NAME[0..10]}...</#if></span>
				</a>
			</#if>
				<ul>
					<li class='date'>${record2.UP_TIME?string("yyyy-MM-dd")}</li>
					<li class='num'>${record2.WATCH_COUNT}</li>
				</ul>
			</div>
		</#list>
		</div>
		<!-- 金融 -->
		<div class="tabBox" style='display: none;'>
		<#list data.ds3 as record3>
			<div class="service">
				<#if '${record3.if_login?if_exists}'=='1'>
				<#if '${user.username?if_exists}' !="">
					<a target="_blank" href = "${base}/home/playvideo.action?id=${record3.ID?if_exists}&type=2">
						<img src="${base}/${record3.COVER?if_exists}/cast_mid.jpeg" alt="1"><span title="${record3.NAME?if_exists}"><#if record3.NAME?length lte 11>${record3.NAME?if_exists}<#else>${record3.NAME[0..10]}...</#if></span>
					</a>
				<#else>
					<a href="javascript:void(0)" onclick="iflog()">
						<img src="${base}/${record3.COVER?if_exists}/cast_mid.jpeg" alt="1"><span title="${record3.NAME?if_exists}"><#if record3.NAME?length lte 11>${record3.NAME?if_exists}<#else>${record3.NAME[0..10]}...</#if></span>
					</a>
				</#if>
			<#elseif '${record3.if_login?if_exists}'=='2'>
				<a target="_blank" href = "${base}/home/playvideo.action?id=${record3.ID?if_exists}&type=2">
					<img src="${base}/${record3.COVER?if_exists}/cast_mid.jpeg" alt="1"><span title="${record3.NAME?if_exists}"><#if record3.NAME?length lte 11>${record3.NAME?if_exists}<#else>${record3.NAME[0..10]}...</#if></span>
				</a>
			</#if>
				<ul>
					<li class='date'>${record3.UP_TIME?string("yyyy-MM-dd")}</li>
					<li class='num'>${record3.watch_count}</li>
				</ul>
			</div>
		</#list>
		</div>
		<!-- 创业 -->
		<div class="tabBox" style='display: none;'>
			<#list data.ds4 as record4>
				<div class="service">
					<#if '${record4.if_login?if_exists}'=='1'>
					<#if '${user.username?if_exists}' !="">
						<a target="_blank" href = "${base}/home/playvideo.action?id=${record4.ID?if_exists}&type=2">
							<img src="${base}/${record4.COVER?if_exists}/cast_mid.jpeg" alt="1"><span title="${record4.NAME?if_exists}"><#if record4.NAME?length lte 11>${record4.NAME?if_exists}<#else>${record4.NAME[0..10]}...</#if></span>
						</a>
					<#else>
						<a href="javascript:void(0)" onclick="iflog()">
							<img src="${base}/${record4.COVER?if_exists}/cast_mid.jpeg" alt="1"><span title="${record4.NAME?if_exists}"><#if record4.NAME?length lte 11>${record4.NAME?if_exists}<#else>${record4.NAME[0..10]}...</#if></span>
						</a>
					</#if>
				<#elseif '${record4.if_login?if_exists}'=='2'>
					<a target="_blank" href = "${base}/home/playvideo.action?id=${record4.ID?if_exists}&type=2">
						<img src="${base}/${record4.COVER?if_exists}/cast_mid.jpeg" alt="1"><span title="${record4.NAME?if_exists}"><#if record4.NAME?length lte 11>${record4.NAME?if_exists}<#else>${record4.NAME[0..10]}...</#if></span>
					</a>
				</#if>
					<ul>
						<li class='date'>${record4.UP_TIME?string("yyyy-MM-dd")}</li>
						<li class='num'>${record4.watch_count}</li>
					</ul>
				</div>
			</#list>
		</div>
		<!-- 人才 -->
		<div class="tabBox" style='display: none;'>
			<#list data.ds5 as record5>
				<div class="service">
					<#if '${record5.if_login?if_exists}'=='1'>
						<#if '${user.username?if_exists}' !="">
							<a target="_blank" href = "${base}/home/playvideo.action?id=${record5.ID?if_exists}&type=2">
								<img src="${base}/${record5.COVER?if_exists}/cast_mid.jpeg" alt="1"><span title="${record5.NAME?if_exists}"><#if record5.NAME?length lte 11>${record5.NAME?if_exists}<#else>${record5.NAME[0..10]}...</#if></span>
							</a>
						<#else>
							<a href="javascript:void(0)" onclick="iflog()">
								<img src="${base}/${record5.COVER?if_exists}/cast_mid.jpeg" alt="1"><span title="${record5.NAME?if_exists}"><#if record5.NAME?length lte 11>${record5.NAME?if_exists}<#else>${record5.NAME[0..10]}...</#if></span>
							</a>
						</#if>
					<#elseif '${record5.if_login?if_exists}'=='2'>
						<a target="_blank" href = "${base}/home/playvideo.action?id=${record5.ID?if_exists}&type=2">
							<img src="${base}/${record5.COVER?if_exists}/cast_mid.jpeg" alt="1"><span title="${record5.NAME?if_exists}"><#if record5.NAME?length lte 11>${record5.NAME?if_exists}<#else>${record5.NAME[0..10]}...</#if></span>
						</a>
					</#if>
					<ul>
						<li class='date'>${record5.UP_TIME?string("yyyy-MM-dd")}</li>
						<li class='num'>${record5.watch_count}</li>
					</ul>
				</div>
			</#list>
		</div>
		<!-- 技术 -->
		<div class="tabBox" style='display: none;'>
			<#list data.ds6 as record6>
				<div class="service">
					<#if '${record6.if_login?if_exists}'=='1'>
						<#if '${user.username?if_exists}' !="">
							<a target="_blank" href = "${base}/home/playvideo.action?id=${record6.ID?if_exists}&type=2">
								<img src="${base}/${record6.COVER?if_exists}/cast_mid.jpeg" alt="1"><span  title="${record6.NAME?if_exists}"><#if record6.NAME?length lte 11>${record6.NAME?if_exists}<#else>${record6.NAME[0..10]}...</#if></span>
							</a>
						<#else>
							<a href="javascript:void(0)" onclick="iflog()">
								<img src="${base}/${record6.COVER?if_exists}/cast_mid.jpeg" alt="1"><span  title="${record6.NAME?if_exists}"><#if record6.NAME?length lte 11>${record6.NAME?if_exists}<#else>${record6.NAME[0..10]}...</#if></span>
							</a>
						</#if>
					<#elseif '${record6.if_login?if_exists}'=='2'>
						<a target="_blank" href = "${base}/home/playvideo.action?id=${record6.ID?if_exists}&type=2">
							<img src="${base}/${record6.COVER?if_exists}/cast_mid.jpeg" alt="1"><span  title="${record6.NAME?if_exists}"><#if record6.NAME?length lte 11>${record6.NAME?if_exists}<#else>${record6.NAME[0..10]}...</#if></span>
						</a>
					</#if>
					<ul>
						<li class='date'>${record6.UP_TIME?string("yyyy-MM-dd")}</li>
						<li class='num'>${record6.watch_count}</li>
					</ul>
				</div>
			</#list>
		</div>
		<!-- 管理 -->
		<div class="tabBox" style='display: none;'>
			<#list data.ds7 as record7>
				<div class="service">
					<#if '${record7.if_login?if_exists}'=='1'>
						<#if '${user.username?if_exists}' !="">
							<a target="_blank" href = "${base}/home/playvideo.action?id=${record7.ID?if_exists}&type=2">
								<img src="${base}/${record7.COVER?if_exists}/cast_mid.jpeg" alt="1"><span title="${record7.NAME?if_exists}"><#if record7.NAME?length lte 11>${record7.NAME?if_exists}<#else>${record7.NAME[0..10]}...</#if></span>
							</a>
						<#else>
							<a href="javascript:void(0)" onclick="iflog()">
								<img src="${base}/${record7.COVER?if_exists}/cast_mid.jpeg" alt="1"><span title="${record7.NAME?if_exists}"><#if record7.NAME?length lte 11>${record7.NAME?if_exists}<#else>${record7.NAME[0..10]}...</#if></span>
							</a>
						</#if>
					<#elseif '${record7.if_login?if_exists}'=='2'>
						<a target="_blank" href = "${base}/home/playvideo.action?id=${record7.ID?if_exists}&type=2">
							<img src="${base}/${record7.COVER?if_exists}/cast_mid.jpeg" alt="1"><span title="${record7.NAME?if_exists}"><#if record7.NAME?length lte 11>${record7.NAME?if_exists}<#else>${record7.NAME[0..10]}...</#if></span>
						</a>
					</#if>
					<ul>
						<li class='date'>${record7.UP_TIME?string("yyyy-MM-dd")}</li>
						<li class='num'>${record7.watch_count}</li>
					</ul>
				</div>
			</#list>
		</div>
		<!-- 创业 -->
		<div class="tabBox" style='display: none;'>
			<#list data.ds8 as record8>
				<div class="service">
					<#if '${record8.if_login?if_exists}'=='1'>
						<#if '${user.username?if_exists}' !="">
							<a target="_blank" href = "${base}/home/playvideo.action?id=${record8.ID?if_exists}&type=2">
								<img src="${base}/${record8.COVER?if_exists}/cast_mid.jpeg" alt="1"><span title="${record8.NAME?if_exists}"><#if record8.NAME?length lte 11>${record8.NAME?if_exists}<#else>${record8.NAME[0..10]}...</#if></span>
							</a>
						<#else>
							<a href="javascript:void(0)" onclick="iflog()">
								<img src="${base}/${record8.COVER?if_exists}/cast_mid.jpeg" alt="1"><span title="${record8.NAME?if_exists}"><#if record8.NAME?length lte 11>${record8.NAME?if_exists}<#else>${record8.NAME[0..10]}...</#if></span>
							</a>
						</#if>
					<#elseif '${record8.if_login?if_exists}'=='2'>
						<a target="_blank" href = "${base}/home/playvideo.action?id=${record8.ID?if_exists}&type=2">
							<img src="${base}/${record8.COVER?if_exists}/cast_mid.jpeg" alt="1"><span title="${record8.NAME?if_exists}"><#if record8.NAME?length lte 11>${record8.NAME?if_exists}<#else>${record8.NAME[0..10]}...</#if></span>
						</a>
					</#if>
					<ul>
						<li class='date'>${record8.UP_TIME?string("yyyy-MM-dd")}</li>
						<li class='num'${record8.watch_count}</li>
					</ul>
				</div>
			</#list>
		</div>
		<!-- 其他 -->
		<div class="tabBox" style='display: none;'>
			<#list data.ds9 as record9>
				<div class="service">
					<#if '${record9.if_login?if_exists}'=='1'>
						<#if '${user.username?if_exists}' !="">
							<a target="_blank" href = "${base}/home/playvideo.action?id=${record9.ID?if_exists}&type=2">
								<img src="${base}/${record9.COVER?exists}/cast_mid.jpeg" alt="1"><span title="${record9.NAME?if_exists}"><#if record9.NAME?length lte 11>${record9.NAME?if_exists}<#else>${record9.NAME[0..10]}...</#if></span>
							</a>
						<#else>
							<a href="javascript:void(0)" onclick="iflog()">
								<img src="${base}/${record9.COVER?if_exists}/cast_mid.jpeg" alt="1"><span title="${record9.NAME?if_exists}"><#if record9.NAME?length lte 11>${record9.NAME?if_exists}<#else>${record9.NAME[0..10]}...</#if></span>
							</a>
						</#if>
					<#elseif '${record9.if_login?if_exists}'=='2'>
						<a target="_blank" href = "${base}/home/playvideo.action?id=${record9.ID?if_exists}&type=2" title="${record9.NAME?if_exists}">
							<img src="${base}/${record9.COVER?if_exists}/cast_mid.jpeg" alt="1"><span><#if record9.NAME?length lte 11>${record9.NAME?if_exists}<#else>${record9.NAME[0..10]}...</#if></span>
						</a>
					</#if>
					<ul>
						<li class='date'>${record9.UP_TIME?string("yyyy-MM-dd")}</li>
						<li class='num'>${record9.watch_count}</li>
					</ul>
				</div>
			</#list>
		</div>
<script>
function show(flag){
	window.location.href="${base}/show.action?code=secondLevMenu&service_type="+flag;
}

function iflog(){
	art.dialog.alert('请登录后观看',function(){
		
	}); 
}
</script>