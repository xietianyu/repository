package com.tarena.dao;

public interface CommentMapper {
	//根据用户id删除评论的信息
	public void deleteCommentByUserId(String userId);
	//删除指定的视频id对应的评论信息
	public void deleteCommentByVideoId(String videoId);
	
}
