function redi(url,id,entId){
	var flag = false;
	var phone;
	var mpara; 
	var vkeyWords=/[?]/;
	if(vkeyWords.test(url)){
		mpara='&phone=';
	}else{
		mpara='?phone=';
	}
	var f = false;
//	var mywindow = window.open('','smebjTempWindow'+url)
    $.ajax({
        url: get_url()+'/receptionaction/islogin.action',
        async:false,
        type: 'GET',
        dataType: 'JSON',
        data: {}
    })
    .done(function(json) {
    	console.log("redi done");
        flag = json.flag===1?true:false;
    	phone = json.phone||'none phone';
        if(flag){
        	id = id || 'null_id';
        	saveSkipRecord(id,entId);
//    		window.open(url+mpara+phone, id);
//    		newWindow(url+mpara+phone);
//        	mywindow.location.href = url+mpara+phone;
        	f = true;
        }else{
        	alert("请登录");
//        	mywindow.close()
//        	setTimeout(function(){alert("请登录");},0);
        	window.location.href=get_url()+"/LoginIpAction/loginbefore.action?url="+window.encodeURIComponent(window.location.href);
        }
    })
    .fail(function() {
    	alert("请登录");
//    	mywindow.close()
//    	setTimeout(function(){alert("请登录");},0);
        console.log("redi error");
        window.location.href=get_url()+"/LoginIpAction/loginbefore.action?url="+window.encodeURIComponent(window.location.href);
    })
    .always(function() {
        console.log("redi complete");
    });
    console.log("out start");
    f&&newWindow(url+mpara+phone);
    console.log("out complete");
}
function chat(entId){
	var myurl;
	var f = false;
    $.ajax({
        url: get_url()+'/receptionaction/getchaturl.action',
        async:false,
        type: 'GET',
        dataType: 'text',
        data: {'entId':entId}
    })
    .done(function(url) {
    	console.log("chat",url);
    	myurl = url;
    	f = true;
    })
    .fail(function() {
        console.log("chat error");
    })
    .always(function() {
        console.log("chat complete");
    });
    console.log("out start");
    f&&newWindow(myurl);
    console.log("out compete");
}
function saveSkipRecord(propertyId,entId){
	   $.ajax({
	        url: get_url()+'/receptionaction/saveskiprecord.action',
	        type: 'POST',
	        dataType: 'text',
	        data: {'propertyId':propertyId,'entId':entId}
	    })
	    .done(function(result) {
	    	console.log('skip result',result);    
	    })
	    .fail(function() {
	        console.log("skip errors");
	    })
	    .always(function() {
	        console.log("skip complete");
	    });
}
function mshow (e) {
	var drop = document.getElementById('drop');
	var dialog = document.getElementById('modal-dialog');
	drop.style.display='block';
	setTimeout(function() {
		drop.style.opacity='0.8';
		dialog.style.transform='translateY(0)';
	}, 10)
}
function mclose (e) {
	if(e.target!==e.currentTarget) return;
	var drop = document.getElementById('drop');
	var dialog = document.getElementById('modal-dialog');
//	$('#newPhone').val('');
	drop.style.opacity='0.1';
	dialog.style.transform='translateY(-500px)';
	setTimeout(function() {
		drop.style.display='none';
	}, 400)
}
function newWindow(url) {
    var aEl = document.createElement('a')
    aEl.setAttribute('href', url)
    aEl.setAttribute('target', url)
    aEl.setAttribute('class', 'myTemp')
    document.body.appendChild(aEl);
    aEl.click()
    aEl.remove()
}

//var closeEle = document.getElementById('closeEle');
//var drop = document.getElementById('drop');
//closeEle.addEventListener('click',mclose);
//drop.addEventListener('click', mclose, true);
