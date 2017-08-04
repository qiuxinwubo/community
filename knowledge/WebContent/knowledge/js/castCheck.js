
function checkSpeaker(){
	var val=$("input[name='speaker']").val();
	if(val==""){
		$("#speakerInfoError").html("主讲人不能为空！");
		return false;
	}
	if(val.length>15){
		$("#speakerInfoError").html("主讲人姓名不可以超过15个字！");
		return false
	}
	$("#speakerInfoError").html("");
	return true;
}



function checkServiceType(){
	var val=$("#ServiceType").val();
	if(val==""){
		$("#serviceTypeError").html("请选择所属视频分类！");
		return false;
	}
	$("#serviceTypeError").html("");
	return true;
}


function checkDescription(){
	var val=$("textarea[name='explain']").val();
	if(val.length>400){
		$("#descriptionError").html("视频说明不可以超过200个字！");
		return false;
	}
	$("#descriptionError").html("");
	return true;
}

function checkCover(){
	var val=$("#cover").val();
	if(val==""){
		$("#coverError").html("请上传视频封面！");
		$("#coverError").css("color","red");
		return false;
	}
	$("#coverError").html("");
	return true;
}

function checkTags(){
	var checkBoxs = $("input[name='vmsDicTagsValues']");
	var flag = false;
	for(var i = 0;i<checkBoxs.length;i++){
		if(checkBoxs[i].checked){
			flag = true;
		}
	}
	if(flag==false){
		$("#vmsDicTagsError").html("请至少选择一项！");
		$("#vmsDicTagsError").css("color","red");
	}
	return flag;
}
