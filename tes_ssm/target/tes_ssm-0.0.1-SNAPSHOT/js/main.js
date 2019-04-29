//@ sourceURL=main.js

$(function(){
	// 注册面板关闭事件
	$(".panel .close").click(function(){
		close_panel(this);
	});
	// 注册面板重置事件
	$(".glyphicon-refresh").click(function(){
		reset_panel();
	});
	// 画用户统计饼状图
	draw_user();
	// 画视频统计环行图
	draw_video();
	//给登出超链接添加click事件
	//$("#logout").click(function(){
		//logout();
	//});
});
//登出方法
function logout(){
	$.ajax({
		url:basePath+"user/logout",
		type:"delete",
		dataType:"json",
		success:function(result){
			if(result.status==1){
				window.location.href="login.html";
			}
		},
		error:function(){
			alert("请求失败!")
		}
	});
}
// 关闭面板
function close_panel(btn) {
	$(btn).parent().parent().parent().fadeOut(200);
}

// 重置面板
function reset_panel() {
	$(".panel").parent().fadeIn(200);
}

function draw_user() {
	$.ajax({
		url:basePath+"main/userCartogram",
		type:"get",
		dataType:"json",
		success:function(result){
			if(result.status==1){
				var data=result.data;
				var ctx = document.getElementById("chart-user").getContext("2d");
				window.myDoughnut = new Chart(ctx).Pie(data, {responsive : true});
			}else if(result.status==0){
				alert("没有查询到数据");
			}
		},
		error:function(){
			alert("请求失败!");
		}
	});	
}

function draw_video() {
	$.ajax({
		url:basePath+"main/videoCartogram",
		type:"get",
		dataType:"json",
		success:function(result){
			if(result.status==1){
				var data=result.data;
				var ctx = document.getElementById("chart-video").getContext("2d");
				window.myDoughnut = new Chart(ctx).Doughnut(data, {responsive : true});
			}else if(result.status==0){
				alert("没有查询到数据");
			}
		},
		error:function(){
			alert("请求失败!");
		}
	});	
}