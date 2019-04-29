package com.tarena.controller;

import java.io.OutputStream;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.tarena.entity.User;
import com.tarena.service.UserService;
import com.tarena.vo.Page;
import com.tarena.vo.Result;

@Controller
@RequestMapping("user/")
public class UserController {
	@Resource(name="userService")
	private UserService userService;
	
	@RequestMapping(value="login/{userName}/{userPassword}",method=RequestMethod.GET)
	@ResponseBody
	public Result login(
			@PathVariable("userName") String name,
			@PathVariable("userPassword") String password,
			HttpSession session){
		System.out.println(name+"   "+password);
		Result result=null;
		//result=userService.login(name,password,session);//非shiro方式登录		
		result=userService.login_shiro(name,password,session);
		return result;
	}
	//@RequestMapping(value="logout",method=RequestMethod.DELETE)
	//@ResponseBody
	public Result logout(HttpSession session){		
		Result result=null;
		session.invalidate();//销毁session对象
		result=new Result();
		result.setStatus(1);
		result.setMessage("登出成功");
		return result;
	}
	@RequestMapping(value="findUsersByPage",method=RequestMethod.GET)
	@ResponseBody
	public Result findUsersByPage(Page<User> page){		
		Result result=null;
		result=this.userService.findUsersByPage(page);
		return result;
	}
	@RequestMapping(value="addUser",method=RequestMethod.POST)
	public void addUser(User user,
			              String roleId,
			              MultipartFile addPicture,
			              HttpServletRequest request,
			              HttpServletResponse response){		
		this.userService.addUser(user,roleId,addPicture,request,response);
	}
	@RequestMapping(value="updateUser",method=RequestMethod.POST)
	public void updateUser(User user,
			              String[] roleIds,
			              MultipartFile updatePicture,
			              HttpServletRequest request,
			              HttpServletResponse response){		
		this.userService.updateUser(user,roleIds,updatePicture,request,response);
	}
	@RequestMapping(value="deleteUser/{userId}",method=RequestMethod.DELETE)
	@ResponseBody
	public Result deleteUser(@PathVariable("userId") String userId){		
		Result result=null;
		result=this.userService.deleteUser(userId);
		return result;
	}
	@RequestMapping(value="exportUser",method=RequestMethod.GET)
	public void exportUser(HttpServletRequest request,
			               HttpServletResponse response){
		//调用业务获取excel的数据,把excel的数据通过response把excel文件下载
		try{
			byte[] excelData=this.userService.exportUser();
			//把字节数组的文件内容下载到客户端
			response.setContentType("application/x-msdownload");
			response.setHeader("Content-Disposition", "attachment;fileName=alluser.xls");
			response.setContentLength(excelData.length);
			OutputStream os=response.getOutputStream();
			os.write(excelData);
			os.flush();
			os.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}
