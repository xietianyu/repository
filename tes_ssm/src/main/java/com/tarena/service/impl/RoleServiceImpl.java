package com.tarena.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.tarena.dao.RoleMapper;
import com.tarena.entity.Role;
import com.tarena.service.RoleService;
import com.tarena.util.PageUtil;
import com.tarena.util.UUIDUtil;
import com.tarena.vo.Page;
import com.tarena.vo.Result;
@Service("roleService")
public class RoleServiceImpl implements RoleService {
	@Resource(name="roleMapper")
	private RoleMapper roleMapper;
	@Resource(name="pageUtil")
	private PageUtil pageUtil;
	
	@Override
	public Result findRolesByPage(int currentPage, String roleKeyword) {
		Result result=new Result();
		Page<Role> page=new Page<Role>();
		page.setCurrentPage(currentPage);
		String rkw="undefined".equals(roleKeyword)? "%%" :"%"+roleKeyword+"%";
		page.setRoleKeyword(rkw);
		page.setPageSize(pageUtil.getPageSize());
		//获取总记录数
		int totalCount=this.roleMapper.getCount(page);
		page.setTotalCount(totalCount);
		//获取总页数
		int totalPage=(totalCount%pageUtil.getPageSize()==0)? (totalCount/pageUtil.getPageSize()) : (totalCount/pageUtil.getPageSize())+1;
		page.setTotalPage(totalPage);
		//获取当前页的数据
		page.setData(this.roleMapper.getRolesByPage(page));
		result.setStatus(1);
	    result.setData(page);	
	    System.out.println(page);
		return result;
	}
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
	@Override
	public Result addRole(String roleName) {
		Result result=new Result();
		Role role=new Role();
		role.setId(UUIDUtil.getUUID());
		role.setName(roleName);
		int rowAffect=this.roleMapper.addRole(role);
		result.setStatus(1);
		result.setMessage("角色添加成功!!");
		return result;
	}
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
	@Override
	public Result deleteRole(String roleId) {
		Result result=new Result();
		
		int rowAffect=this.roleMapper.deleteRole(roleId);
		result.setStatus(1);
		result.setMessage("角色删除成功!!");
		return result;
	}
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
	@Override
	public Result updateRole(String roleId,String roleName) {
		Result result=new Result();
		Role role=new Role();
		role.setId(roleId);
		role.setName(roleName);
		int rowAffect=this.roleMapper.updateRole(role);
		result.setStatus(1);
		result.setMessage("角色修改成功!!");
		return result;
	}
	@Override
	public Result findAllRoles() {
		Result result=new Result();
		List<Role> roles=this.roleMapper.findAllRoles();
		result.setStatus(1);
		result.setData(roles);
		return result;
	}
	
}
