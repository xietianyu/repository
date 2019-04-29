package com.tarena.service;

import com.tarena.vo.Result;

public interface RoleService {
	public Result findRolesByPage(int currentPage,String roleKeyword);

	public Result addRole(String roleName);

	public Result deleteRole(String roleId);

	public Result updateRole(String roleId,String roleName);

	public Result findAllRoles();
}
