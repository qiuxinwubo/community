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
	alert("123132");
	$.ajax({
		url : get_url()+"/frame/show_top_bar.action",
		type : 'POST',
		success : function(data) {
			alert(data);
			$("#top").html(data);
		}
	});
})