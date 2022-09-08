package com.iea.ja.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iea.ja.dao.Dao;
import com.iea.ja.dao.MemberDao;
import com.iea.ja.vo.Member;
//import com.iea.ja.dao.MemberDao;
//import com.iea.ja.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private Dao dao;
	
	@Autowired
	private MemberDao mDao;

/*	
	@Autowired
	private MemberDao mDao;

/*
	@Override
	public int userSignUp(Member user) {
		int result = mDao.userSignUp(user);
		return result;
	}
*/
/*
	@Override
	public int join(Map<?,?> paramMap) throws Exception {
		int result = dao.insert("MemberMapper.join", paramMap);
		return result;
	}
*/
	@Override
	public int userSignUp (Member user) {
		int result = mDao.userSignUp(user);
		return result;
	}
/*
	@Override
	public Map<String, Object> login(Map<?,?> paramMap) throws Exception {
		Map<String, Object> result = (Map<String, Object>) dao.getMap("MemberMapper.login", paramMap);
		return result;
		// return (Map<String, Object> dao.getMap("MemberMapper.login", paramMap);	
	}
*/
	
	@Override
	public Map<String, Object> getMember(Map<?,?> paramMap) throws Exception {
		return (Map<String, Object>) dao.getMap("MemberMapper.getMember", paramMap); 
	}
	
}
