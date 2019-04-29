package com.tarena.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tarena.service.RoleService;
import com.tarena.vo.Result;

@Controller
@RequestMapping("role/")
public class RoleController {
	@Resource(name="roleService")
	private RoleService roleService;
	
	@RequestMapping(value="findRolesByPage/{currentPage}/{roleKeyword}",method=RequestMethod.GET)
	@ResponseBody
	public Result findRolesByPage(@PathVariable("currentPage") int currentPage,
			                      @PathVariable("roleKeyword") String roleKeyword){
		System.out.println("findRolesByPage:"+currentPage+"  "+roleKeyword);
		Result result=null;
		result=roleService.findRolesByPage(currentPage,roleKeyword);
		return result;
	}
	@RequestMapping(value="addRole/{roleName}")
	@ResponseBody
	public Result addRole(@PathVariable("roleName") String roleName){
		System.out.println("roleName="+roleName);
		Result result=null;
		result=this.roleService.addRole(roleName);
		return result;
	}
	@RequestMapping(value="deleteRole/{roleId}")
	@ResponseBody
	public Result deleteRole(@PathVariable("roleId") String roleId){
		System.out.println("roleId="+roleId);
		Result result=null;
		result=this.roleService.deleteRole(roleId);
		return result;
	}
	@RequestMapping(value="updateRole/{roleId}/{roleName}")
	@ResponseBody
	public Result updateRole(@PathVariable("roleId") String roleId,
			                 @PathVariable("roleName") String roleName){
		System.out.println("roleId="+roleId+"  roleName="+roleName);
		Result result=null;
		result=this.roleService.updateRole(roleId,roleName);
		return result;
	}
	@RequestMapping(value="findAllRoles",method=RequestMethod.GET)
	@ResponseBody
	public Result findAllRoles(){
		Result result=null;
		result=this.roleService.findAllRoles();
		return result;
	}
	
}
