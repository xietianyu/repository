package com.tarena.service.impl;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.tarena.dao.ActivityMapper;
import com.tarena.dao.CommentMapper;
import com.tarena.dao.ParticipationMapper;
import com.tarena.dao.UserMapper;
import com.tarena.dao.VideoMapper;
import com.tarena.entity.User;
import com.tarena.entity.UserRole;
import com.tarena.service.UserService;
import com.tarena.util.CommonValue;
import com.tarena.util.ExportUtil;
import com.tarena.util.PageUtil;
import com.tarena.util.PrintWriterUtil;
import com.tarena.util.UUIDUtil;
import com.tarena.util.UploadFileUtil;
import com.tarena.vo.Page;
import com.tarena.vo.Result;
@Service("userService")
public class UserServiceImpl implements UserService {
	@Resource(name="userMapper")
	private UserMapper userMapper;
	@Resource(name="pageUtil")
	private PageUtil pageUtil;
	
	@Resource(name="participationMapper")
	private ParticipationMapper participationMapper;
	@Resource(name="activityMapper")
	private ActivityMapper activityMapper;
	@Resource(name="commentMapper")
	private CommentMapper commentMapper;
	@Resource(name="videoMapper")
	private VideoMapper videoMapper;
	//非shiro登录
	@Override
	public Result login(String loginName, String password,HttpSession session) {
		Result result=new Result();
		User user=new User();
		user.setLoginName(loginName);
		user.setPassword(password);
		String userId=this.userMapper.login(user);
		if(userId!=null){
			session.setAttribute("loginName", loginName);
			result.setStatus(1);
			result.setMessage("登录成功");
		}else{
			result.setStatus(0);
			result.setMessage("登录失败");
		}
		return result;
	}
	//shiro方式的登录
	@Override
	public Result login_shiro(String name, String password, HttpSession session) {
		Result result=new Result();
		//用shiro的api启动shiro
		//创建一个subject对象,存储用户数据
		Subject subject=SecurityUtils.getSubject();
		//将用户数据封装给令牌 token 令牌
		UsernamePasswordToken token=new UsernamePasswordToken(name,password);
		//获取shiro的session,不是httpsession
		subject.getSession().setAttribute("loginName", name);
		try{
			//启动shiro把令牌的数据带到安全管理中心
			subject.login(token);
			result.setStatus(1);
			result.setMessage("登录成功");
		}catch(Exception e){
			e.printStackTrace();
			result.setStatus(0);
			result.setMessage("登录失败");
		}
		return result;
	}

	@Override
	public Result findUsersByPage(Page<User> page) {
		Result result=new Result();
		String roleType=page.getRoleType();
		if("all".equals(roleType)){
			//相当于没有角色类型
			page.setPageSize(this.pageUtil.getPageSize());
			String ukw="undefined".equals(page.getUserKeyword())? "%%" : "%"+page.getUserKeyword()+"%";
			page.setUserKeyword(ukw);
			//获取总记录数据
			int totalCount=this.userMapper.getCount(page);
			page.setTotalCount(totalCount);
			//计算总页数
			int totalPage=(totalCount%pageUtil.getPageSize()==0)? (totalCount/pageUtil.getPageSize()) :(totalCount/pageUtil.getPageSize())+1 ;
			page.setTotalPage(totalPage);
			
			//获取当前页的数据
			page.setData(this.userMapper.getUsersByPage(page));			
		}else{
			//一定指定了某一个角色类型(讲师,学员,管理员)
			page.setRoleType("%"+roleType+"%");
			//处理模糊关键字和pageSize
			page.setPageSize(this.pageUtil.getPageSize());
			String ukw="undefined".equals(page.getUserKeyword())? "%%" : "%"+page.getUserKeyword()+"%";
			page.setUserKeyword(ukw);
			
			//获取总记录数
			int totalCount=this.userMapper.getCount_RoleType(page);
			page.setTotalCount(totalCount);
			//计算总页数
			int totalPage=(totalCount%pageUtil.getPageSize()==0)? (totalCount/pageUtil.getPageSize()) :(totalCount/pageUtil.getPageSize())+1 ;
			page.setTotalPage(totalPage);
			//获取当前页的数据
			page.setData(this.userMapper.getUserByPage_RoleType(page));
		}
		result.setStatus(1);
		result.setData(page);
		System.out.println(page);
		return result;
	}
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
	@Override
	public void addUser(User user, String roleId, MultipartFile addPicture, HttpServletRequest request,
			HttpServletResponse response) {
		String imageFileName="default.png";
		user.setSex("true".equals(user.getSex())? "男" : "女");
		//获取服务端的上传的文件路径
		String realPath=request.getServletContext().getRealPath("/head");
		File realFile=new File(realPath);
		if(!realFile.exists()){
			realFile.mkdir();
		}
		//给用户生成一个uuid
		String uuid=UUIDUtil.getUUID();
		
		//判断上传的文件是否为null或空内容
		if(addPicture==null || addPicture.isEmpty()){
			//给页面返回提示应该添加文件后上传 或
			//用户没有上传文件则给个默认的头像文件
			user.setHead("default.png");
		}else{
			//用户选择了上传文件
			//获取文件中的若干信息
			String originalFileName=addPicture.getOriginalFilename();
			String name=addPicture.getName();
			String contentType=addPicture.getContentType();
			long size=addPicture.getSize();
			//判断文件的类型是否符合
			if(!CommonValue.contentTypes.contains(contentType)){
				PrintWriterUtil.printMessageToClient(response, "文件类型不匹配");
				return;
			}
			//判断文件的大小是否符合
			if(size>4194304){
				//给前端提示文件太大
				PrintWriterUtil.printMessageToClient(response, "文件太大!4M以内");
				return;
			}
			//对文件做缩放处理且把缩放后的文件上传到服务器指定的目录中
			//File serverPath=new File(realPath,originalFileName);
			//addPicture.transferTo(serverPath);			
			
			boolean flag=UploadFileUtil.uploadImage(addPicture,uuid,true,640,realPath);
			if(!flag){
				//给前端提示文件上传失败
				PrintWriterUtil.printMessageToClient(response, "文件上传失败!");
				return;
			}
			//给用户对象存储上传完的头像的名字uuid+扩展名
			String extName=originalFileName.substring(originalFileName.lastIndexOf("."));
			imageFileName=uuid+extName;
			user.setHead(imageFileName);
		} 
		try{
			//构建User数据
			user.setId(uuid);
			//把User对象的数据存到数据库
			int rowAffect=this.userMapper.addUser(user);
			//把用户对应的角色存储到中间表t_user_role
			UserRole userRole=new UserRole();
			userRole.setUserId(uuid);
			userRole.setRoleId(roleId);
			rowAffect=this.userMapper.addUserRole(userRole);
			//提示用户添加成功(说明操作数据库中的两张表都没有出错)
			PrintWriterUtil.printMessageToClient(response, "添加用户成功!");
		}catch(Exception e){
			//如果插入用户和插入中间表有异常,说明用户添加失败
			//删除之前上传成功的文件,
			File file=new File(realPath+File.separator+imageFileName);
			if(file.exists()){
				file.delete();
			}
			//告知spring事务管理器,可以回滚了
			throw new RuntimeException(e);
		}
	}
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
	@Override
	public void updateUser(User user, String[] roleIds, MultipartFile updatePicture, HttpServletRequest request,
			HttpServletResponse response) {
		//处理上传文件的部分
		String oldFileName=user.getHead();
		String originalFileName=null;
		String userId=user.getId();
		String realPath=request.getServletContext().getRealPath("/head");
		
		if(updatePicture==null || updatePicture.isEmpty()){
			//
			
		}else{
			//说明是有上传文件
			String contentType=updatePicture.getContentType();
			long size=updatePicture.getSize();
			if(!CommonValue.contentTypes.contains(contentType)){
				PrintWriterUtil.printMessageToClient(response, "图片类型不匹配");
				return;
			}
			if(size>4194304){
				PrintWriterUtil.printMessageToClient(response, "图片太大!,4M以内");
				return;
			}
			//原图片更名,刨掉默认图片
			if(!"default.png".equals(oldFileName)){
				File originalFile=new File(realPath,oldFileName);
				if(originalFile.exists()){
					originalFile.renameTo(new File(realPath,oldFileName+".bak"));
				}
			}			
			//文件上传且缩放
			boolean flag=UploadFileUtil.uploadImage(updatePicture, userId, true, 64, realPath);
			if(!flag){
				PrintWriterUtil.printMessageToClient(response, "图片上传失败!");
				return;
			}
		}
		//处理数据存储
		String imageFileName=null;
		try{
			originalFileName=updatePicture.getOriginalFilename();
			String originalExtendName=originalFileName.substring(originalFileName.lastIndexOf(".")+1);
			imageFileName=userId+"."+originalExtendName;
			user.setHead(imageFileName);
	        //更新用户的数据进数据库
			this.userMapper.updateUser(user);
			//删除当前用户id所对应的所有的角色
			this.userMapper.deleteRolesByUserId(userId);
			//循环所有的新角色,添加用户和角色的中间表
			for(String roleId : roleIds){
				UserRole ur=new UserRole();
				ur.setRoleId(roleId);
				ur.setUserId(userId);
				this.userMapper.addUserRole(ur);
			}
			//用户修改成功,则要删除bak文件
			File originalFile=new File(realPath,oldFileName+".bak");
			if(originalFile.exists()){
				originalFile.delete();
			}
			PrintWriterUtil.printMessageToClient(response, "用户修改成功");
		}catch(Exception e){
			//数据库更新失败
			//恢复bak图片为原始图图片
			File originalFile=new File(realPath,oldFileName+".bak");
			if(originalFile.exists()){
				originalFile.renameTo(new File(realPath,oldFileName));
			}
			throw new RuntimeException(e);
		}
		
	}
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
	@Override
	public Result deleteUser(String userId) {
		Result result=new Result();
		//删除用户和角色的中间表---------------------------
		this.userMapper.deleteRolesByUserId(userId);
		//删除用户和模块的中间表---------------------------
		this.userMapper.deleteModuleByUserId(userId);
		//删除好友列表中有指定用户id---------------------
		this.userMapper.deleteFriendListByUserId(userId);
		//删除活动相关的内容----------------------------
		//先删除用户参与的活动,就是删除活动参与表中的数据
		this.participationMapper.deleteParticipationByUserId(userId);
		//根据用户的id查询出所有的这个用户所发起的活动id
		List<String> activityIds=this.activityMapper.findActivityIds(userId);
		//循环所有的活动id去参与表删除对应的活动参与信息,这个用户发起的活动被别的用户参与
		for(String activityId : activityIds){
			this.participationMapper.deleteParticipationByActivityId(activityId);
		}
		//删除指定用户发起所有的活动信息
		this.activityMapper.deleteActivityByUserId(userId);
		//删除评论---------------------------------
		this.commentMapper.deleteCommentByUserId(userId);
		//删除评论和视频相关-------------------------
		//根据指定的用户id查询出此用户发布的所有视频id
		List<String> videoIds=this.videoMapper.findVideoIdsByUserId(userId);
		//循环所有的视频id删除此视频id对应评论信息,其实处理当期用户发的视频有人评论过
		for(String videoId : videoIds){
			this.commentMapper.deleteCommentByVideoId(videoId);
		}
		//删除历史,缓存表中的信息
		this.userMapper.deleteHistoryCacheByUserId(userId);
		//删除指定视频id的对应的历史缓存信息,其实处理当前用户发布的视频有缓存和历史
		for(String videoId : videoIds){
			this.videoMapper.deleteHistroyCacheByVideoId(videoId);
		}
		//根据用户删除指定用户发布的视频信息
		this.videoMapper.deleteVideoByUserId(userId);
		//删除用户信息-----------------------------
		this.userMapper.deleteUserByUserId(userId);
		
		result.setStatus(1);
		result.setMessage("删除用户成功!");
		return result;
	}
	@Override
	public byte[] exportUser() {
		byte[] data=null;
		List<User> users=this.userMapper.findAllUsers();
		if(users!=null && users.size()>0){
			data=ExportUtil.write2Excel(users);
		}
		return data;
	}

}
