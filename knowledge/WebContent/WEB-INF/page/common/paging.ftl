总共<span>${data.ds1page.rowCount.toString()}</span>
			                  条记录，共<span>${data.ds1page.pageCount}</span>
			                  页，每页显示<span>${data.ds1page.pageSize}</span>
			                  条记录，当前第<span>${data.ds1page.pageNo}</span>
			                  页
                  <a href="javascript:goPage(1,${data.ds1page.pageCount})">首页</a>
                  <a href="javascript:goPage(${data.ds1page.prePage},${data.ds1page.pageCount})">上一页 </a> 
                  <a href="javascript:goPage(${data.ds1page.nextPage},${data.ds1page.pageCount})">下一页 </a> 
                  <a href="javascript:goPage(${data.ds1page.pageCount},${data.ds1page.pageCount})">尾页</a>