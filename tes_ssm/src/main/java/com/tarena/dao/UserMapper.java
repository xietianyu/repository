package com.tarena.dao;

import java.util.List;

import com.tarena.entity.User;
import com.tarena.entity.UserRole;
import com.tarena.vo.Page;

public interface UserMapper {
	//登录
	public String login(User user);
    //分页操作
	public int getCount(Page page);
	public List getUsersByPage(Page page);
	//分页操作(必须带有角色类型,讲师,学员,管理员)
	public int getCount_RoleType(Page<User> page);
	public List<User> getUserByPage_RoleType(Page<User> page);
	//添加用户
	public int addUser(User user);
	//添加用户和角色的中间表
	public int addUserRole(UserRole userRole);
	//更新用户信息
	public void updateUser(User user);
	//删除用户和角色中间表中的指定用户id的所有的角色
	public void deleteRolesByUserId(String userId);
	//删除用户和模块的中间表,根据指定userid
	public void deleteModuleByUserId(String userId);
	//删除好友列表中有指定用户id的数据项
	public void deleteFriendListByUserId(String userId);
	//根据用户id删除此用户历史和缓存中的数据
	public void deleteHistoryCacheByUserId(String userId);
	//根据用id删除用户的信息
	public void deleteUserByUserId(String userId);
	//查询所有的用户信息用于导出excel用
	public List<User> findAllUsers();
	//根据登录名查询用户的密码信息(shiro登录用)
	public User findUserByloginName(String loginName);
	//跟据用户名获取此用户名对应的所有的模块名字
	public List<String> findModulesByLoginName(String loginName);
	//根据角色的名字查询用户的个数(给主页的角色的用户个数的饼状图)
	public int findUserCountByRoleName(String name);
	
	
}
