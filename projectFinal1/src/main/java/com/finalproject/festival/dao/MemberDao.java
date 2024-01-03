package com.finalproject.festival.dao;

import java.util.HashMap;
import java.util.Map;

import com.finalproject.festival.domain.Member;

public interface MemberDao {

	public Map<String, Object> loginCheck (String id);
	public int joinIdCheck (String id);
	public int emailUserCount (String email); 
	public void joinMember(Member m);
	public String userFindId (Map<String, Object> userfind);
	public int userFindPassword (Map<String, Object> map);
	public int userNewPassword(Map<String, Object> newPassword);
	
}
