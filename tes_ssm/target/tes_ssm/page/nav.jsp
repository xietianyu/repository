<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro"%>
<ul class="nav nav-sidebar">
    <shiro:hasPermission name="角色管理">
        <li><a href="#" name="page/role.html"><span class="glyphicon glyphicon-tasks btn-lg" aria-hidden="true"></span>角色管理</a></li>
    </shiro:hasPermission>
    <shiro:hasPermission name="用户管理">
    	<li><a href="#" name="page/user.html"><span class="glyphicon glyphicon-user btn-lg" aria-hidden="true"></span>用户管理</a></li>
    </shiro:hasPermission>
    <shiro:hasPermission name="课程管理">
        <li><a href="#" name="page/course.html"><span class="glyphicon glyphicon-education btn-lg" aria-hidden="true"></span>课程管理</a></li>
    </shiro:hasPermission>
    <shiro:hasPermission name="视频管理">
        <li><a href="#" name="page/video.html"><span class="glyphicon glyphicon-film btn-lg" aria-hidden="true"></span>视频管理</a></li>
    </shiro:hasPermission>
    <shiro:hasPermission name="活动管理">
        <li><a href="#" name="page/activity.html"><span class="glyphicon glyphicon-blackboard btn-lg" aria-hidden="true"></span>活动管理</a></li>
    </shiro:hasPermission>
    <shiro:hasPermission name="评论管理">
        <li><a href="#" name="page/comment.html"><span class="glyphicon glyphicon-comment btn-lg" aria-hidden="true"></span>评论管理</a></li>
	</shiro:hasPermission>
    
</ul>