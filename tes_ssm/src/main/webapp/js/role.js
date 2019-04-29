//@ sourceURL=role.js
var roleId;
$(function(){
	findRolesByPage(1);
	//给模糊搜索按钮添加click事件
	$("#rolePanel .row button").click(function(){
		findRolesByPage(1);
	});	
	//给添加角色的表单添加submit事件
	$("#addPanel form").submit(function(){
		return addRole();
	});
	//给删除model框中的确认按钮添加click事件
	$(".bs-example-modal-sm button:eq(1)").click(function(){
		deleteRole();
	});
	//给修改的model框添加form表单添加submit事件
	$("#editRole form").submit(function(){
		return updateRole();
	});
});
//修改角色
function updateRole(){
	//获取新角色
	var newRoleName=$("#editRole form #role_name").val();
	//发异步请求
	$.ajax({
		url:basePath+"role/updateRole/"+roleId+"/"+newRoleName,
		type:"post",
		dataType:"json",
		success:function(result){
			if(result.status==1){
				alert("修改成功");
				//给对应的td更新新值
				alert($("#"+roleId).get(0));
				$("#"+roleId).find("td:eq(2)").text(newRoleName);
				//把修改的model框关闭
				$('#editRole').modal('hide')
			}else if(result.status==0){
				alert("修改失败!")
			}
		}
	});
	return false;
}
function updateClick(rid){
	roleId=rid;
	//把要修改的值放在修改框中
	var oldRoleName=$("#"+roleId).find("td:eq(2)").text();
	$("#editRole form #role_name").val(oldRoleName);
}
//删除角色
function deleteRole(){
	//获取要删除的角色id,全局变量roleId已经存储
	$.ajax({
		url:basePath+"role/deleteRole/"+roleId,
		type:"delete",
		dataType:"json",
		success:function(result){
			if(result.status==1){
				alert(result.message);
				//删除页面中对应的行
				$("#"+roleId).remove();
				//关闭页面中的model框
				$('.bs-example-modal-sm').modal('hide');
			}else if(result.status==0){
				alert("删除失败!");
			}
		},
		error:function(){
			alert("请求失败!");
		}
	});
}
function deleteClick(rid){
	//alert(rid);
	roleId=rid;
}
//添加角色
function addRole(){
	//获取新的角色信息
	var newRole=$("#addPanel #roleName").val();
	//发送异步请求
	$.ajax({
		url:basePath+"role/addRole/"+newRole,
		type:"post",
		dataType:"json",
		success:function(result){
			if(result.status==1){
				alert(result.message);
			}else if(result.status==0){
				alert("添加数据失败!");
			}
		},
		error:function(){
			alert("请求失败!");
		}
	});
	return false;
}
function findRolesByPage(currentPage){
	//获取模糊关键字
	var roleKeyword=$("#rolePanel .row input[type=text]").val();
	if(roleKeyword==""){
		roleKeyword="undefined";
	}
	//发送异步请求查询当前页的数据
	$.ajax({
		url:basePath+"role/findRolesByPage/"+currentPage+"/"+roleKeyword,
		type:"get",
		dataType:"json",
		success:function(result){
			if(result.status==1){
				//拿到服务端的json数据
				var page=result.data;
				var roles=page.data;
				//清空表格body内容
				$("#role_table tbody").html("");
				//给表格的body体添加新内容
				$(roles).each(function(index,role){
					if(role.name!='讲师' && role.name!='学员' && role.name!='超级管理员'){
						//需要添加删除和编辑超链接
						var tr=`<tr id="${role.id}">
					              <td>${index+1}</td>
					              <td>${role.id}</td>
					              <td>${role.name}</td>
					              <td>
					                <a onclick="updateClick('${role.id}')" href="" data-toggle="modal" data-target="#editRole" ><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>编辑</a>
					                <a onclick="deleteClick('${role.id}')" href="" data-toggle="modal" data-target=".bs-example-modal-sm"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除</a>
					              </td>
					            </tr>`;
					    $("#role_table tbody").append(tr);
					}else{
						//不需要添加删除和编辑超链接
						var tr=`<tr>
					              <td>${index+1}</td>
					              <td>${role.id}</td>
					              <td>${role.name}</td>
					              <td>
					              </td>
					            </tr>`;
						$("#role_table tbody").append(tr);
					}
				});
				//处理分页条
				//清空原有页面中的分页条
				$("#role_page").html("");
				var options={
					currentPage:currentPage,//当前页,当前页面显示数据的那个页号
					totalPages:page.totalPage,//总页数
					numberOfPages:5,//超链接的个数
					onPageClicked:function(event, originalEvent, type,page){
						//page是用户点击的页号,就是准备跳转page页上去
						findRolesByPage(page);
					}						
				};
				$("#role_page").bootstrapPaginator(options);
				
			}else if(result.status==0){
				alert("数据查询失败!");
			}
		},
		error:function(){
			alert("请求失败!");
		}
	});
}