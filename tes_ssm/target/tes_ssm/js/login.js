$(function(){
	$("form #inputName").val(getCookie("loginName"));
	$("form").submit(function(){
		return login();
	});
});
function login(){
	//获取表单元素的数据
	var loginName=$("form #inputName").val();
	var password=$("form #inputPassword").val();
	var remember=$("form input[type=checkbox]:checked").val();
	alert(loginName+"   "+password+"   "+remember);
	//发送异步请求
	$.ajax({
		url:basePath+"user/login/"+loginName+"/"+password,
		type:"get",
		dataType:"json",
		success:function(result){
			if(result.status==1){
				//登录成功后跳转到主页index.html
				window.location.href="index.jsp";
				if("记住账号"==remember){
					//把账号名称保留到cookie
					addCookie("loginName",loginName,5);
				}
			}else if(result.status==0){
				alert(result.message);
			}
		},
		error:function(){
			alert("请求失败!");
		}
	});
	return false;
}