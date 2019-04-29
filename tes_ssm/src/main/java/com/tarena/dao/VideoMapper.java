package com.tarena.dao;

import java.util.List;

public interface VideoMapper {
    //查询指定用户发布的所有的视频id
	public List<String> findVideoIdsByUserId(String userId);
	//根据视频id删除此视频的历史和缓存
	public void deleteHistroyCacheByVideoId(String videoId);
	//根据用户id删除指定用户发布的视频信息
	public void deleteVideoByUserId(String userId);
	//根据课程名称查询视频的个数(给主页中的视频个数的环状图)
	public int findVideoCountByCourseName(String name);

}
