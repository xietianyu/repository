package com.tarena.dao;

import java.util.List;

public interface ActivityMapper {
	//根据用户id查询所有的此用户发起的活动id
	public List<String> findActivityIds(String userId);
	//根据指定用户id删除所有此用户发起的所有的活动信息
	public void deleteActivityByUserId(String userId);

}
