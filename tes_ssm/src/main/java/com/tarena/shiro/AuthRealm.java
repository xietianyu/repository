package com.tarena.shiro;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;

import com.tarena.dao.UserMapper;
import com.tarena.entity.User;

public class AuthRealm extends AuthorizingRealm{
	@Resource(name="userMapper")
	private UserMapper userMapper;
	
	//权限认证,去realm中,获取数据中的权限的真实数据
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		//得到用户对象
		Subject subject = SecurityUtils.getSubject();
		String loginName = subject.getSession().getAttribute("loginName").toString();
		//根据用户名查询角色信息 
		List<String> roleList = userMapper.findModulesByLoginName(loginName);
		
		/*List<String> roleList = new ArrayList<String>();
		roleList.add("用户管理");
		roleList.add("课程管理");
		roleList.add("视频管理");*/
		//创建授权管理
		SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
		
		//传入授权管理的集合信息
		info.addStringPermissions(roleList);
		return info;
	}

	@Override
	//登陆认证模块,去realm中获取真实的数据库中的登录数据
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		UsernamePasswordToken loginToken =  (UsernamePasswordToken) token;
		String loginName = loginToken.getUsername();
		User user = userMapper.findUserByloginName(loginName);
		/*
		 * principal:主要的; 本金的; 最重要的; 资本的; 真实的对象
		 * credentials:凭证，证件; 表示真实的密码 
		 * realmName: 域,范围的名字 当前的realm
		 */
		AuthenticationInfo info = new SimpleAuthenticationInfo(user,user.getPassword(),this.getName());
		return info;		
	}



	
	
	
}
