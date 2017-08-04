var show_img_id, val_img, target, img_url, host_ip, name, width, height, M, show_vali;
$(function(){
$(".ltrupload").click(
		function() {
			$("#ltrfile").trigger(
					"click",
					[ $(this).attr("ltr_img_id"), $(this).attr("ltr_val_img"),
							$(this).attr("ltr_target"),
							$(this).attr("ltr_url"),
							$(this).attr("ltr_host_ip"),
							$(this).attr("ltr_name"),
							$(this).attr("ltr_width"),
							$(this).attr("ltr_height"), $(this).attr("ltr_m"),
							$(this).attr("ltr_show_mgs") ]);
});
$("#ltrfile").change(function() {
	var file = $(this)[0].files[0];
	if (!/\.(gif|jpg|jpeg|png|GIF|JPG|JPEG|PNG)$/.test(file.name)) {
	     $("#" + show_vali).html("图片格式支持jpg,jpeg,gif,png");
    } else {
	     checkImgType(file, retLtrResult);
    }
}).click(function(event, a, b, c, d, e, f, w, h, m, n) {
	show_img_id = a;
	val_img = b;
	target = c;
	img_url = d;
	host_ip = e;
	name = f;
	width = w;
	height = h;
	M = m;
	show_vali = n;
});
});
returnImgPath = function(ret) {
	$("#" + show_img_id).val(ret)
	$("body ." + val_img).attr("src",
			window.base + "/" + ret + "?t=" + Math.random() * 5);
}
retLtrResult = function(msg, file) {
	            var arr = msg.split(",");
				if (parseInt(arr[2]) < parseInt(M)) {
					$.fulongImgLrz(file, img_url, name, host_ip, returnImgPath,
							(target == 0 ? name : name + target));
					$("#ltrfile").val("");
					$("#" + show_vali).html("");
				} else {
					$("#" + show_vali).html("图片不能大于" + M + "M");
					$("#ltrfile").val("");
				}
}