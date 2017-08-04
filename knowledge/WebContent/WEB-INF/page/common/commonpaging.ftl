<div class="next_nav">
	<div class="paging-box page_search">
		<a href="javascript:goPage(${data.ds1page.prePage},${data.ds1page.pageCount})">上一页</a>
		<a href="javascript:goPage(1,${data.ds1page.pageCount})" <#if '${data.ds1page.pageNo}' == '1'>class="page-active"</#if>>1</a>
	<#if '${data.ds1page.pageCount}' != '1'>
	  <#if data.ds1page.pageNo-1 gt 1 && data.ds1page.pageNo-1 != 2>
	     <a href="javascript:void(0);" >...</a>
	  </#if>
	  <#if data.ds1page.pageNo-1 gt 1>
	    <a href="javascript:goPage(${data.ds1page.pageNo-1},${data.ds1page.pageCount})" >${data.ds1page.pageNo-1}</a>
	  </#if>
	  <#if data.ds1page.pageNo != 1 && data.ds1page.pageNo != data.ds1page.pageCount>
	    <a href="javascript:goPage(${data.ds1page.pageNo},${data.ds1page.pageCount})" class="page-active">${data.ds1page.pageNo}</a>
	  </#if>
	  <#if data.ds1page.pageNo+1 lt data.ds1page.pageCount>
	    <a href="javascript:goPage(${data.ds1page.pageNo+1},${data.ds1page.pageCount})" >${data.ds1page.pageNo+1}</a>
	  </#if>
	  <#if data.ds1page.pageNo+1 lt data.ds1page.pageCount && data.ds1page.pageNo+1 != data.ds1page.pageCount-1>
	    <a href="javascript:void(0);" >...</a>
	  </#if>
	  <a href="javascript:goPage(${data.ds1page.pageCount},${data.ds1page.pageCount})" <#if '${data.ds1page.pageNo}' == '${data.ds1page.pageCount}'>class="page-active"</#if>>${data.ds1page.pageCount}</a>
	</#if>
		<a href="javascript:goPage(${data.ds1page.nextPage},${data.ds1page.pageCount})">下一页</a>
		<span>共有<em>${data.ds1page.rowCount.toString()}</em>条数据，到<input id="pageint" name="" type="text" value="${data.ds1page.pageNo}">页<a href="javascript:void(0)" onclick="skipPage(${data.ds1page.pageCount.toString()});">跳转</a></span>
	</div>
</div>


