$(function(){
	$('#button').click(function() {
		if(!$('#file-input').val()){
			alert('请选择文件');
			return;
		}
		if($('#file-input')[0].files[0].size > 1048576){
			alert('文件不能大于1M');
			return;
		}
		
	});

	var fileInput = document.getElementById('file-input'), 
		info = document.getElementById('file-info');
	fileInput.addEventListener('change', function () {
	    if (!fileInput.value) {
	        info.innerHTML = '没有选择文件';
	        return;
	    }
	    var file = fileInput.files[0];
	    info.innerHTML = '文件: ' + file.name + '<br>' +
	                     '大小: ' + file.size + '<br>' +
	                     '修改: ' + file.lastModifiedDate;
	});
});

