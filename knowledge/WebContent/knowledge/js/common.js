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
		url : get_url()+"/frame/show_top_bar.action",
		type : 'POST',
		success : function(data) {
			$("#top").html(data);
		}
	});
	 
	//动态底部
	$.ajax({
		url : get_url()+"/frame/show_default.action",
		type : 'POST',
		success : function(data) {
			$("#under").html(data);
		}
	});
	//动态左侧菜单
	$.ajax({
		url : get_url()+"/frame/show_menu.action",
		type : 'POST',
		success : function(data) {
			$("#left").html(data);
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




//
//
///*可以点*/
//function getCookieBymenu(name){ 
//	var strCookie=document.cookie; 
//	var arrCookie=strCookie.split("; "); 
//	for(var i=0;i<arrCookie.length;i++){ 
//		var arr=arrCookie[i].split("="); 
//		if(arr[0]==name){
//			return arr[1]; 
//		}
//	} 
//	return ""; 
//}
//
//function addCookieNoExpiresBymenu(name,value){ 
//	var cookieString=name+"="+escape(value) + "; path=/"; 
//	document.cookie=cookieString; 
//}
////全选
//function chkall(input) {
//	var objForm = document.getElementById("form");
//	var objLen = objForm.length;
//	for ( var i = 0; i < objLen; i++) {
//		if (objForm.elements[i].type == "checkbox") {
//			objForm.elements[i].checked = input.checked;
//		}
//	}
//}
//function noSelectAll(){
//	var selectAll_1 = document.getElementById("selectall_1");
//	var arr=document.getElementsByName("ids");
//	var selCount=0;
//	var unSelCount=0;
//	for(var i=0;i<arr.length;i++){
//	if(arr[i].checked == true){
//		selCount++;
//	}
//	if(arr[i].checked == false){
//		unSelCount++;
//	}
//	if(selCount==arr.length){
//		selectAll_1.checked=true;
//	}
//	 if(unSelCount>0){
//		 selectAll_1.checked=false;
//	 }
//	}
//}
////复选框
//function getIds() {
//	var objForm = document.getElementById("form");
//	if (!objForm) {
//		return "";
//	}
//	var objLen = objForm.length;
//	var ids = "";
//	for ( var i = 0; i < objLen; i++) {
//		if (objForm.elements[i].type == "checkbox"
//				&& objForm.elements[i].checked == true) {
//			ids = ids + objForm.elements[i].value + ",";
//		}
//	}
//	return ids;
//}