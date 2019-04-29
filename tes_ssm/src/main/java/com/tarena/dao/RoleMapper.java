package com.tarena.dao;

import java.util.List;

import com.tarena.entity.Role;
import com.tarena.vo.Page;

public interface RoleMapper {
	//角色分页
	public int getCount(Page page);
	public List<Role> getRolesByPage(Page page);
	//添加角色
	public int addRole(Role role);
	//删除角色
	public int deleteRole(String roleId);
	//修改角色
	public int updateRole(Role role);
	//查询所有的角色信息,给新增用户使用
	public List<Role> findAllRoles();
}
