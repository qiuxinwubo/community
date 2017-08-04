<script>
	<#if url?exists>
	window.location.href="${base}/${url?if_exists}";
	<#else>
	window.location.href="${local_host_ip?if_exists}";
	</#if>
</script>