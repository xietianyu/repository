package com.tarena.shiro;

import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authc.credential.SimpleCredentialsMatcher;





public class AuthCredential extends  SimpleCredentialsMatcher{
	
	@Override
	public boolean doCredentialsMatch(AuthenticationToken token, AuthenticationInfo info) {
		//通过token 获取用户名和密码
		UsernamePasswordToken userToken = (UsernamePasswordToken) token;
		/*String username = userToken.getUsername();
		String password = String.valueOf(userToken.getPassword());
		
		String encryptPassword = Encrypt.getMd5(password, username);
		userToken.setPassword(encryptPassword.toCharArray());*/
		
		return super.doCredentialsMatch(userToken, info);
	}
}
