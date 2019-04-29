//@ sourceURL=comment.js

$(function(){
	$('[data-toggle="popover"]').popover();
	
	/**
	$("#chk_all").click(function() {
		if ($(":checkbox").prop("checked")){
			$(":checkbox").prop("checked",true);
		}
		else{
			$(":checkbox").removeAttr("checked");
		}
	});
	*/
	
	$(".btn-group button").click(function(){
		active($(this));
	});
	
	$("#pushPanel .btn-group button:last").click(function(){
		check_all(this);
	});
	
	$("#refresh_btn").click(function(){
		if($(this).children("i").hasClass("icon-spin")) {
			$(this).children("i").removeClass("icon-spin");
			end_push();
		} else {
			$(this).children("i").addClass("icon-spin");
			start_push();
		}
	});
	
	$(".nav-tabs li:last").click(function(){
		$("#refresh_btn i").removeClass("icon-spin");
		end_push();
	});
	
	$("#push_panels .btn-success").click(function(){
		pass(this);
	});
	
	$("#push_panels .btn-danger").click(function(){
		reject(this);
	});
	
	$("#comment_time").click(function(){
		time_order(this);
	});
	
});

function check_all(btn) {
	if($(btn).hasClass("active")) {
		$(btn).siblings("button").addClass("active");
	} else {
		$(btn).siblings("button").removeClass("active");
	}
}

function start_push() {
	// 拉取数据
	var $panel = 
          '<div class="panel panel-default">'+
            '<div class="text-center">' +
              '<h3><a href="#">Spring MVC 对异常处理的支持</a></h3>' +
              '<div>' +
                  '<span>用户：<a href="#">曹操</a></span> • <span>2015年5月18日</span>' +
              '</div>' +
            '</div>' +      
            '<div class="panel-body">' +
              '<h4>' +
                 '讲的太好了，我都听懂了！老师讲的非常的细致耐心，画的图十分的容易理解。' +
              '</h4>' +
              '<div class="text-right">' +
                  '<button type="button" class="btn btn-success">&nbsp;&nbsp;通&nbsp;&nbsp;过&nbsp;&nbsp;</button> ' +
                  '<button type="button" class="btn btn-danger">&nbsp;&nbsp;拒&nbsp;&nbsp;绝&nbsp;&nbsp;</button>' +
              '</div>' +
            '</div>' +
          '</div>';
	push_timer = setInterval(function(){
		var n = $("#push_panels").children("div").length;
		if(n <= 30) {
			$("#push_panels").append($panel);
			$("#push_panels .btn-success").click(function(){
				pass(this);
			});
			
			$("#push_panels .btn-danger").click(function(){
				reject(this);
			});
		}
	}, 2000);
}

function end_push() {
	clearInterval(push_timer);
}

function pass(btn) {
	$(btn).parent().parent().parent().remove();
}

function reject(btn) {
	$(btn).parent().parent().parent().remove();
}

function time_order(btn) {
	var $span = $(btn).children("span");
	if($span.hasClass("glyphicon-chevron-up")) {
		$span.removeClass("glyphicon-chevron-up").addClass("glyphicon-chevron-down");
	} else {
		$span.removeClass("glyphicon-chevron-down").addClass("glyphicon-chevron-up");
	}
}