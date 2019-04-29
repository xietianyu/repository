package com.tarena.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import com.tarena.entity.User;
import com.tarena.vo.Page;
import com.tarena.vo.Result;

public interface UserService {
	public Result login(String loginName,String password,HttpSession session);
    //用户分页的业务
	public Result findUsersByPage(Page<User> page);
	//添加用户信息
	public void addUser(User user, String roleId, MultipartFile addPicture, HttpServletRequest request,
			HttpServletResponse response);
	//更新用户信息
	public void updateUser(User user, String[] roleIds, MultipartFile updatePicture, HttpServletRequest request,
			HttpServletResponse response);
	//删除用户
	public Result deleteUser(String userId);
	//导出excel表格
	public byte[] exportUser();
	//shiro方式登录
	public Result login_shiro(String name, String password, HttpSession session);
}
