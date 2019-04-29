// 设置按钮选中/非选中
function active($obj) {
	if($obj.hasClass("active")) {
		$obj.removeClass("active");
	} else {
		$obj.addClass("active");
	}
}