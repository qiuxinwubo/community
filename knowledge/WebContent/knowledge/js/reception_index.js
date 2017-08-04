function get_www_url(){
	var url = "http://localhost:8080";
	return url;
}
 
function get_url(){
	var url = "/knowledge";
	return url;
}
//动态头部
$(function(){
	$.ajax({
		url : get_url()+"/frame/show_top_index.action",
		type : 'POST',
		success : function(data) {
			$("#top").html(data);
		}
	});
	 
	//动态图片链接
	$.ajax({
		url : get_url()+"/frame/show_image_href.action",
		type : 'POST',
		success : function(data) {
			$("#imagehref").html(data);
		}
	});
	//动态底部
	$.ajax({
		url : get_url()+"/frame/show_default_index.action",
		type : 'POST',
		success : function(data) {
			$("#under").html(data);
		}
	});
});
//提交表单
function doSearch(){
	var form = document.getElementById("form");
  	form.submit();
}
//列表页底部上下也
function goPage(newPage, pageCount) {
	if (isIntNum(newPage)) {
		//top.art.dialog({time: 2,icon: 'warning',lock:true,content: "数字格式不正确！"});
		alert("数字格式不正确！");
		return;
	}
	if (newPage > pageCount) {
		//top.art.dialog({time: 2,icon: 'warning',lock:true,content: "页码太大！不能超过"+pageCount});
		alert("页码太大，不能超过"+pageCount+"！");
		return;
	}
	var pageNum = document.getElementById("pageNo");
	pageNum.value = newPage;
	doSearch();
}
function skipPage(pageCount){
	var newPage = $("#pageint").val();
	goPage(newPage,pageCount);
}
function isIntNum(value) {
	if (/^[1-9]{1}[0-9]{0,8}$/.test(value)) {
		return false;
	} else {
		return true;
	}
}