package com.finalproject.festival.dao;

import java.util.List;

import com.finalproject.festival.domain.Event;

public interface EventDao {
	
	public abstract void eventUpload(Event event);
	
	public abstract List<Event> event();
	
	public abstract Event eventDetail(int eventno);
	
	public abstract void eventPresentCondition(String id, int eventno);
	
	public abstract List<String> eventPresentConditionIdList(int eventno);
	
	public abstract void eventCoupon(String id, int couponno);

}
