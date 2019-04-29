package com.tarena.dao;

public interface ParticipationMapper {
	//删除指定用户参与的活动
	public int deleteParticipationByUserId(String userId);
	//删除参与指定了活动id的参与信息
	public void deleteParticipationByActivityId(String activityId);
}
