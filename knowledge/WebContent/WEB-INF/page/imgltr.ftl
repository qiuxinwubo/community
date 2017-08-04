{"imgData":[
<#list data.ds1 as record>
	{"code":"${record.code?if_exists}",
	 "width":"${record.width?if_exists}",
	 "height":"${record.height?if_exists}",
	 "quality":"${record.quality?if_exists}",
	 "imagename":"${record.image_name?if_exists}"
}<#if record_index + 1==data.ds1?size><#else>,</#if>
</#list>
]}


