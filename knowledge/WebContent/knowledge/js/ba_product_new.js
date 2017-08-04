function entname(){
	var name=$("#entId").find("option:selected").text();
	$("#entName").val(name);
	verifyent();
	return false;
}
function verifyname(){
	var name=$("#name");
	var value=name.val();
	if(value==""){
		$("#verifyname").html("服务名称不能为空！");
		return false;
	}
	if(value.length>30){
		$("#verifyname").html("服务名称不能大于30个字符！");
		return false;
	}
	$("#verifyname").html("");
	return true;
}
function verifyent(){
	var value=$("#entId").val();
	if(value==""){
		$("#verifyent").html("请选择企业！");
		return false;
	}
	$("#verifyent").html("");
	return true;
}
function verifyimage(){
	var value=$("#image").val();
	if(value==""){
		$("#verifyimage").html("请上传图片！");
		return false;
	}
	$("#verifyimage").html("");
	return true;
}
//校验服务介绍
function verifypresentation(){
	var value=$("#presentation").val();
	if(value==""){
		$("#verifypresentation").html("请填写服务介绍！");
		return false;
	}
	if(value.length>500){
		$("#verifypresentation").html("服务介绍不可以超过500个字符！");
		return false;
	}
	$("#verifypresentation").html("");
	return true;
}
function verifycontent(){
	var value=$("#content").val();
	if(value==""){
		$("#verifycontent").html("请填写服务内容！");
		return false;
	}
	if(value.length>500){
		$("#verifycontent").html("服务内容不可以超过500个字符！");
		return false;
	}
	$("#verifycontent").html("");
	return true;
}
function verifyqualification(){
	var value=$("#qualification").val();
	if(value==""){
		$("#verifyqualification").html("请填写服务机构资质！");
		return false;
	}
	if(value.length>500){
		$("#verifyqualification").html("机构资质不可以超过500个字符！");
		return false;
	}
	$("#verifyqualification").html("");
	return true;
}
function verifyquestion(){
	var value=$("#question").val();
	if(value==""){
		$("#verifyquestion").html("请填写常见问题！");
		return false;
	}
	if(value.length>1000){
		$("#verifyquestion").html("常见问题不可以超过1000个字符！");
		return false;
	}
	$("#verifyquestion").html("");
	return true;
}
function verifydetailUrl(){
	var value=$("#detailUrl").val();
	if(value==""){
		$("#verifydetailUrl").html("请填写详情链接！");
		return false;
	}
	if(value.length>120){
		$("#verifydetailUrl").html("详情链接不可以超过120个字符！");
		return false;
	}
	$("#verifydetailUrl").html("");
	return true;
}
function verifyprice(){
	var value=$("#price").val();
	if(value==""){
		$("#verifyprice").html("请填写服务价格！");
		return false;
	}
	var reg=/^[1-9]*[1-9][0-9]*$/;
	if(!reg.test(value)){
		$("#verifyprice").html("服务价格只能是正整数！");
		return false;
	}
	if(value>10000000){
		$("#verifyprice").html("服务价格不能超过10000000！");
		return false;
	}
	$("#verifyprice").html("");
	return true;
}