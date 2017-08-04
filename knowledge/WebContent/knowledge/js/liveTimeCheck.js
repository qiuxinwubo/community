function strToDate(str) {
	//将（2016-09-30 09:46:12）格式字串转为date
	var tempStrs = str.split(" ");
	var dateStrs = tempStrs[0].split("-");
	var year = parseInt(dateStrs[0], 10);
	var month = parseInt(dateStrs[1], 10) - 1;
	var day = parseInt(dateStrs[2], 10);
	var date=new Date(year, month, day);
	if(tempStrs.length>1){
	var timeStrs = tempStrs[1].split(":");
	var hour = parseInt(timeStrs [0], 10);
	var minute = parseInt(timeStrs[1], 10) - 1;
	var second = parseInt(timeStrs[2], 10);
	date = new Date(year, month, day, hour, minute, second);
	}
	return date;
}
//显示封面小图
function showMinImg() {
	$("div.barrier").hide();
	$("div.large-img").hide();
}
//显示封面大图
function showMaxImg() {
	$("div.barrier").show();
	$("div.large-img").show();
}

function timeSearch(){
	var Time1 = $("#startTime").val();
	var Time2 = $("#endTime").val();
	if(typeof(Time1) != "undefined"&& Time1!=''&&typeof(Time2) != "undefined" && Time2!=''){
		var startDate=strToDate(Time1);
		var endDate=strToDate(Time2);
		if(startDate>endDate){
			//alert("开始时间不能大于结束时间");
			//art.dialog('开始时间不能大于结束时间', function(){this.close();});
			art.dialog({
				width:230,
			    height:100,
			    lock: true,
			    background: '#000', // 背景色
			    opacity: 0.6,     // 透明度
			    content: '开始时间不能大于结束时间',
			    icon: 'error',
			    ok: function() {
			        this.close();
			    }
			});
			return false;
		}
	}
	return true;
}

function checkSubject(){
	var val=$("input[name='subject']").val();
	if(val==""){
		$("#subjectError").html("直播主题不能为空");
		return false;
	}
	if(val.length>32){
		$("#subjectError").html("直播主题不能超过32个字符");
		return false;
	}
	
	$("#subjectError").html("");
	return true;
}
function checkStartTime(){
	var val=$("input[name='startTime']").val();
	if(val==""){
		$("#startTimeError").html("开始时间不能为空");
		return false;
	}
	var nowDate=new Date();
	var myDate=strToDate(val);
	if(myDate<nowDate){
		$("#startTimeError").html("开始时间不能早于现在时间");
		return false;
	}
	$("#startTimeError").html("");
	return true;
	
}
function checkEndTime(){
	var val=$("input[name='endTime']").val();
	if(val==""){
		$("#endTimeError").html("结束时间不能为空");
		return false;
	}
	$("#endTimeError").html("");
	return true;
}
function checkdescription() {
	var val = $("textarea[name='description']").val();
	if (val.length > 500) {
		$("#descriptionError").html("直播描述不能超过500个字符");
		$("#descriptionError").show();
		return false;
	}
	$("#descriptionError").hide();
	$("#descriptionError").html("");
	return true;
}
function checkplan() {
	var val = $("textarea[name='plan']").val();
	if (val.length > 500) {
		$("#planError").html("直播议程不能超过500个字符");
		$("#planError").show();
		return false;
	}
	$("#planError").html("");
	$("#planError").hide();
	return true;
}
function checkspeakerInfo() {
	var val = $("textarea[name='speakerInfo']").val();
	if (val.length > 500) {
		$("#speakerInfoError").html("演讲者不能超过500个字符");
		$("#speakerInfoError").show();
		return false;
	}
	$("#speakerInfoError").html("");
	$("#speakerInfoError").hide();
	return true;
}
/*
 * 判断是否是正整数
 */
function isNumber(num){
	var match = num.match(/^\d+$/); 
	if(match) {
	  return true;
	} else {
	  return false;
	}
}

/*
 *根据传入的文件名 跟类型数组例:("a.doc",{"ppt", "pptx","doc","docx"})检查是否是正确的文件类型
 */
function isRightFileType(fv,arryType){
	var n=fv.lastIndexOf(".");
	fv=fv.substring(n+1);
	for(var i=0;i<arryType.length;i++){
		if(fv.toLowerCase()==arryType[i]){
			return true;
		}
	}
	return false;
}


