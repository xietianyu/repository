package com.tarena.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tarena.dao.CourseMapper;
import com.tarena.dao.RoleMapper;
import com.tarena.dao.UserMapper;
import com.tarena.dao.VideoMapper;
import com.tarena.entity.Course;
import com.tarena.entity.Role;
import com.tarena.service.MainService;
import com.tarena.util.ColorUtil;
import com.tarena.vo.Chart;
import com.tarena.vo.Result;
@Service("mainService")
public class MainServiceImpl implements MainService {
	@Resource(name="roleMapper")
	private RoleMapper roleMapper;
	@Resource(name="userMapper")
	private UserMapper userMapper;
	@Resource(name="courseMapper")
	private CourseMapper courseMapper;
	@Resource(name="videoMapper")
	private VideoMapper videoMapper;
	@Override
	public Result userCartogram() {
		Result result=new Result();		
		List<Chart> charts=new ArrayList<Chart>();
		//先查询出所有的角色信息
		List<Role> roles=this.roleMapper.findAllRoles();
		for(Role role : roles){
			Chart chart=new Chart();
			chart.setValue(this.userMapper.findUserCountByRoleName(role.getName()));
			chart.setColor(ColorUtil.getRandomColorCode());
			chart.setHighlight(ColorUtil.getRandomColorCode());
			chart.setLabel(role.getName());			
			charts.add(chart);
		}		
		result.setStatus(1);
		result.setData(charts);
		return result;
	}
	@Override
	public Result videoCartogram() {
		Result result=new Result();
		List<Chart> charts=new ArrayList<Chart>();
		List<Course> courses=this.courseMapper.findAllCourse();
		for(Course course : courses){
			Chart chart=new Chart();
			chart.setValue(this.videoMapper.findVideoCountByCourseName(course.getName()));
			chart.setColor(ColorUtil.getRandomColorCode());
			chart.setHighlight(ColorUtil.getRandomColorCode());
			chart.setLabel(course.getName());
			charts.add(chart);
		}
		result.setStatus(1);
		result.setData(charts);
		return result;
	}

}
