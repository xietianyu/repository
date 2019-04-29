package com.tarena.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tarena.service.MainService;
import com.tarena.service.RoleService;
import com.tarena.service.UserService;
import com.tarena.vo.Result;

@Controller
@RequestMapping("main/")
public class MainController {	
	@Resource(name="mainService")
	private MainService mainService;
	
	
	@RequestMapping(value="userCartogram",method=RequestMethod.GET)
	@ResponseBody
	public Result userCartogram(){
		Result result=null;
		result=mainService.userCartogram();
		return result;
	}
	@RequestMapping(value="videoCartogram",method=RequestMethod.GET)
	@ResponseBody
	public Result videoCartogram(){
		Result result=null;
		result=mainService.videoCartogram();
		return result;
	}
	
}
