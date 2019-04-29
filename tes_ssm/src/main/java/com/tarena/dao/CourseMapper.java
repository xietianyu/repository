package com.tarena.dao;

import java.util.List;

import com.tarena.entity.Course;

public interface CourseMapper {
    //获取所有的课程信息(给主页的视频的环状图)
	public  List<Course> findAllCourse();
	
}
