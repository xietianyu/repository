//@ sourceURL=message.js

$(function(){
	//$("#message_list tr,#message_dialog tr").click(function(){
	//	alert($(this).parent().parent().parent().attr("class"));
	//});
	$("#message_dialog button:contains('视频')").click(function(){
		to_audit_video(this);
	});
	$("#message_dialog button:contains('活动')").click(function(){
		to_audit_activity(this);
	});
});

function to_audit_video(btn) {
	$(btn).parent().parent().remove();
	$("#message_dialog .close").trigger("click");
	var count = parseInt($("#header .badge").text());
	if(count>0) {
		$("#header .badge").text(--count)
	}
	$("#siderbar li").removeClass("active");
	$("#siderbar li:contains('视频')").addClass("active");
	$('#main').load('page/video.html', function(){
		$.getScript("js/video.js");
		$("#main .nav-tabs li:contains('详情') a").trigger("click");
	});
}

function to_audit_activity(btn) {
	$(btn).parent().parent().remove();
	$("#message_dialog .close").trigger("click");
	var count = parseInt($("#header .badge").text());
	if(count>0) {
		$("#header .badge").text(--count)
	}
	$("#siderbar li").removeClass("active");
	$("#siderbar li:contains('活动')").addClass("active");
	$('#main').load('page/activity.html', function(){
		$.getScript("js/activity.js");
		$("#main .nav-tabs li:contains('详情') a").trigger("click");
	});
}