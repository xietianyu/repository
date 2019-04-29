//@ sourceURL=user.js
var roleType="all";
var userId;
var userHead;
$(function(){
	//alert("user.js onload");
	findUsersByPage(1);
	//给角色类型的按钮添加click事件
	$("#userPanel form .btn-group button").click(function(){
		//获取角色类型赋值给全局边量roleType
		roleType=$(this).text();
		if("全部"==roleType){
			roleType="all";
		}
		$(this).siblings().removeClass("active");
		$(this).addClass("active");
		findUsersByPage(1);
	});
	//给搜索按钮添加click事件
	$("#userPanel form button:last").click(function(){
		findUsersByPage(1);
	});
	//给"新增"标签添加click事件,点击的时候查询所有的角色给角色下拉列表框添加真实角色
	$('#user_tab_nav a:eq(2)').click(function (e) {
		  e.preventDefault();
		  $(this).tab('show');
		  //查询所有的角色信息给下拉列表框
		  findAllRoles();
	});
	//给新增用户form表单添加submit事件
	$("#addUserPanel form").submit(function(){
		return addUser();
	});
	//给"详情"标签添加click事件,点击的时候查询提示信息
	$('#user_tab_nav a:eq(1)').click(function (e) {
		  e.preventDefault();
		  $(this).tab('show');
		  $("#detailPanel .media").html("请从列表页面点击超链接查看详情");
	});
	//给修改的model框中的表单添加submit事件
	$("#editUser form").submit(function(){
		return updateUser();
	});
	//给model框的确认按钮添加click事件
	$(".bs-example-modal-sm button:eq(1)").click(function(){
		deleteUser();
	});
	//给导出添加click事件
	$("#exportUser").click(function(){
		//$.ajax({});
		window.location.href=basePath+"user/exportUser";
	});
});
//删除用户
function deleteUser(){
	$.ajax({
		url:basePath+"user/deleteUser/"+userId,
		type:"delete",
		dataType:"json",
		success:function(result){
			if(result.status==1){
				//删除页面上的行
				$("#"+userId).remove();
				alert(result.message);
			}
			$(".bs-example-modal-sm").modal("hide");
			return;
		},
		error:function(){
			alert("请求失败!");
		}
	});
}
function deleteClick(uid){
	userId=uid;
}
//修改用户信息
function updateUser(){
	//获取修改表单中的新数据
	var loginName =$("#editUser form #inputEmail").val();
	var password=$("#editUser form #inputPassword").val();
	var password2=$("#editUser form #inputPassword2").val();
	var nickName=$("#editUser form #nickName").val();
	var age=$("#editUser form #age").val();
	var sex=$("#editUser form input[name=user-type]:checked").val();
	//获取若干角色信息
	var roleCheckBoxs=$("#editUser form input[type=checkbox]:checked");
    var roleIds=[];//初始化一个js的数组
    var roleString='';
    //循环所有的被选择了的checkbox
    $(roleCheckBoxs).each(function(n,value){
    	var roleid=$(value).val();
    	roleString+=$(value).next().text()+","
    	roleIds.push(roleid);
    });

	if(password!=password2){
		alert("两个密码必须相同");
		$("#editUser form #inputPassword").focus();
		return false;
	}
	if(age<1){
		alert("年龄不能为负数");
		$("#editUser form #age").focus();
		return false;
	}
	
	//发送异步请求
	$.ajaxFileUpload({
		url:basePath+"user/updateUser",
		secureuri:false,
		fileElementId:"updateHeadPicture",
		type:"post",
		data:{
			"id":userId,
			"loginName":loginName,
			"password":password,
			"nickName":nickName,
			"age":age,
			"sex":sex,
			"head":userHead,
			"roleIds":roleIds
		},
		dataType:"text",
		success:function(data,status){
			data=data.replace(/<PRE.*?>/g,'');
			data=data.replace("<PRE>",'');
			data=data.replace("</PRE>",'');
			data=data.replace(/<pre.*?>/g,'');
			data=data.replace("<pre>",'');
			data=data.replace("</pre>",'');
			alert("'"+data+"'");
			if("用户修改成功"==data){
				//关闭当前的model框
				$("#editUser").modal("toggle");
				//更新页面中当前行的数据
				$("#"+userId).find("td:eq(1)").find("a").text(loginName);
				//$("#"+userId).find("td:eq(1)").find("a").attr("href","javascript:findUserById('${userId}','${loginName}','${user.loginType}','${nickName}','${sex}',${age},${user.score},'${new Date().toLocaleDateString().replace("/","-").replace("/","-")}','${user.isLock}','${roleString}','${userHead}')");
				$("#"+userId).find("td:eq(2)").text(nickName);
				$("#"+userId).find("td:eq(7)").text(roleString.substr(0,roleString.length-1));
				
			}
		},
		error:function(){
			alert("请求失败!");
		}
	});
	return false;
}
function updateClick(uid,loginName,password,nickName,age,sex,roleString,head){
	userId=uid;
	userHead=head;
	//给页面更新框赋旧值
	$("#editUser form #inputEmail").val(loginName);
	$("#editUser form #inputPassword").val(password);
	$("#editUser form #inputPassword2").val(password);
	$("#editUser form #nickName").val(nickName);
	$("#editUser form #age").val(age);
	if("男"==sex){
		$("#editUser form input[name=user-type]:eq(0)").attr("checked","checked");
	}else{
		$("#editUser form input[name=user-type]:eq(1)").attr("checked","checked");
	}
	//处理角色的页面内容
	//1.要得到当前用户拥有哪些角色
	var roleNames=roleString.split(",");
	//alert(roleNames);
	//2.从数据库中查询出所有的角色信息
	$.ajax({
		url:basePath+"role/findAllRoles",
		type:"get",
		dataType:"json",
		success:function(result){
			if(result.status==1){
				//alert("aaaaaaaaaaaaaaaaaa");
				//数据库中有角色信息
				//清空页面中角色部分的内容
				$("#editUser form #allRoleName").html("");
				//获取数据库中的数据
				var roles=result.data;
				$(roles).each(function(index,role){
					var flag=false;
					var checkBox1=`<input type="checkbox" name="roleName" value="${role.id}" /><span>${role.name}</span>&nbsp;&nbsp;`;
					var checkBox2=`<input type="checkbox" name="roleName" value="${role.id}" checked="checked" /><span>${role.name}</span>&nbsp;&nbsp;`;
					$(roleNames).each(function(n,value){
						if(value==role.name){
							$("#editUser form #allRoleName").append(checkBox2);
							flag=true;
						}						
					});
					if(!flag){
						//都没匹配上加添加没有checked
						$("#editUser form #allRoleName").append(checkBox1);
					}					
					if((index+1)%3==0){
						$("#editUser form #allRoleName").append("<br />");
					}
				});
			}else if(result.status==0){
				//在页面提示数据库中没有角色信息
				$("#editUser form #allRoleName").html("<span style='color:red;'>数据库中没有角色信息</span>");
			}
		},
		error:function(){
			alert("请求失败!");
		}
	});
}
//查询所有的角色信息
function findAllRoles(){
	//发送异步请求查询所有的角色信息
	$.ajax({
		url:basePath+"role/findAllRoles",
		type:"get",
		dataType:"json",
		success:function(result){
			//清空原有下拉列表框的内容
			$("#addUserPanel form #roleCategory").html("");
			//给下拉列表框添加新的真实的角色
			var roles=result.data;
			$(roles).each(function(index,role){
				var option="";
				if("学员"==role.name){
					option=`<option selected="selected" value="${role.id}">${role.name}</option>`;
				}else{
					option=`<option value="${role.id}">${role.name}</option>`;
				}
				$("#addUserPanel form #roleCategory").append(option);
			});
		},
		error:function(){
			alert("请求失败!");
		}
	});
}
//新增用户信息
function addUser(){
	//获取页面中的所有的新添加的数据
	var loginName=$("#addUserPanel form #inputEmail").val();
	var password=$("#addUserPanel form #inputPassword").val();
	var password2=$("#addUserPanel form #inputPassword2").val();
	var nickName=$("#addUserPanel form #nickName").val();
	var age=$("#addUserPanel form #age").val();
	var roleId=$("#addUserPanel form #roleCategory").val();
	var sex=$("#addUserPanel form input[name=user-type]").get(0).checked;
	
	if(password!=password2){
		return false
	}
	if(age<1){
		$("#addUserPanel form #age").focus();
		return false
	}
	alert("sex="+sex+"   roleId="+roleId);
	//发送异步请求提交新数据和文件
	$.ajaxFileUpload({
		url:basePath+"user/addUser",
		secureuri:false,
		fileElementId:"addHeadPicture",
		type:"post",
		data:{
			"loginName":loginName,
			"password":password,
			"nickName":nickName,
			"age":age,
			"sex":sex,
			"roleId":roleId
		},
		dataType:"text",
		success:function(data,status){
			data=data.replace(/<PRE.*?>/g,'');
			data=data.replace("<PRE>",'');
			data=data.replace("</PRE>",'');
			data=data.replace(/<pre.*?>/g,'');
			data=data.replace("<pre>",'');
			data=data.replace("</pre>",'');
			alert(data);
		},
		error:function(){
			alert("请求失败!");
		}
	});
	return false;
}
function findUserById(uid,loginName,loginType,nickName,sex,age,score,regDate,isLock,roleString,head){
	//清除原有详情中的数据
	$("#detailPanel .media").html("");
	//构建新的内容
	var user=`<div class="media-left">
				    <a href="#">
				    <img class="media-object img-circle" src="head/${head}" alt="头像">
				  </a>
				</div>
				<div class="media-body">
				  <h1 class="media-heading">${loginName}</h1>
				  <br/>
				  <p>账号类型：<span>${loginType}</span></p>
				  <p>昵称：<span>${nickName}</span></p>
				  <p>性别：<span>${sex}</span></p>
				  <p>年龄：<span>${age}</span></p>
				  <p>积分：<span>${score}</span></p>
				  <p>注册日期：<span>${regDate}</span></p>
				  <p>锁定：<span>${isLock}</span></p>
				  <p>角色：<span>${roleString}</span></p>
				</div>`;
	$("#detailPanel .media").append(user);
	$('#user_tab_nav li:eq(1) a').tab('show');
}
function findUsersByPage(currentPage){
	//获取模糊的关键字
	var userKeyword=$("#userPanel form input[type=text]").val();
	if(userKeyword==""){
		userKeyword="undefined";
	}
	//发送异步请求处理分页
	$.ajax({
		url:basePath+"user/findUsersByPage",
		type:"get",
		data:{
			"currentPage":currentPage,
			"userKeyword":userKeyword,
			"roleType":roleType
		},
		dataType:"json",
		success:function(result){
			if(result.status==1){
				var page=result.data;
				var users=page.data;
				//清空表格的body
				$("#user_table tbody").html("");
				//给表格中的tbody添加数据
				$(users).each(function(index,user){
					var roleString="";
					var roles=user.roles;
					$(roles).each(function(n,role){
						//alert(n+"   "+role.name);
						roleString+=role.name+",";
					});
					if(roleString.length>0){
						//从0取到末尾-1的位置
						roleString=roleString.substring(0,roleString.length-1);
						//从0取多少个
						//roleString=roleString.substr(0,roleString.length()-1);
					}else{
						roleString="无角色";
					}
					//alert("roleString="+roleString);
					var tr=`<tr id="${user.id}">
				                <td>${index+1}</td>
				                <td><a href="javascript:findUserById('${user.id}','${user.loginName}','${user.loginType}','${user.nickName}','${user.sex}',${user.age},${user.score},'${new Date(user.regDate).toLocaleDateString().replace("/","-").replace("/","-")}','${user.isLock}','${roleString}','${user.head}')">${user.loginName}</a></td>
				                <td>${user.nickName}</td>
				                <td>${user.loginType}</td>
				                <td>${user.score}</td>
				                <td>${new Date(user.regDate).toLocaleDateString().replace("/","-").replace("/","-")}</td>
				                <td>${user.isLock}</td>
				                <td>${roleString}</td>
				                <td>
				                  <a onclick="updateClick('${user.id}','${user.loginName}','${user.password}','${user.nickName}',${user.age},'${user.sex}','${roleString}','${user.head}')" href="" data-toggle="modal" data-target="#editUser"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>编辑</a>
				                  <a onclick="deleteClick('${user.id}')" href="" data-toggle="modal" data-target=".bs-example-modal-sm"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除</a>
				                </td>
				              </tr>`;
				    $("#user_table").append(tr);
				});
				//构建分页条
				$("#user_pagination").html('');//清空原有的分页条
				var options={
					currentPage:currentPage,//当前页,当前页面显示数据的那个页号
					totalPages:page.totalPage,//总页数
					numberOfPages:5,//超链接的个数
					onPageClicked:function(event, originalEvent, type,page){
						//page是用户点击的页号,就是准备跳转page页上去
						findUsersByPage(page);
					}					
				};
				$("#user_pagination").bootstrapPaginator(options);
			}else if(result.status==0){
				alert("没有查询到数据");
			}
		},		
		error:function(){
			alert("请求失败!");
		}
	});
}