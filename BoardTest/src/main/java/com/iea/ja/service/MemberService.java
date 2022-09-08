package com.iea.ja.service;

import java.util.Map;

import com.iea.ja.vo.Member;

//import com.iea.ja.vo.Member;

public interface MemberService {

//	int join(Map<?, ?> paramMap) throws Exception;
	

	
//	public Map<String, Object> login(Map<?,?> paramMap) throws Exception;
	
	public Map<String, Object> getMember(Map<?,?> dataMap) throws Exception;

	public int userSignUp(Member user);



}
