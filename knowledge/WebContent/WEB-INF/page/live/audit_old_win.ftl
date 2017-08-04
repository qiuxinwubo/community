				    <#list data.ds1 as record>
                     <div>
					 <span  id="${record.id}" style="margin-left:10px;" title="${record.win_name?if_exists}">
					 <#if record.win_name?exists>
	    		     <#if record.win_name?length lte 14>${record.win_name?if_exists}<#else>
	    		     ${record.win_name[0..13]}...</#if>
	    		     </#if>
					 </span>
                     </div>
					</#list>
