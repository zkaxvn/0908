package com.iea.ja.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iea.ja.vo.Member;


@Repository
public class MemberDao {
	@Autowired
    SqlSessionTemplate sqlSession;
	
	public int userSignUp(Member user) {
		return sqlSession.insert("MemberMapper.userSignUp", user);
	}
	
	public int proLicense(List<Map<String, Object>> paramList) {
		return sqlSession.insert("MemberMapper.proLicense", paramList);
	}
	
	
	public List<String> getKeyword(String proCode) {
		return sqlSession.selectList("MemberMapper.getKeyword", proCode);
	}
	
	public List<Member> mainProList(){
		return sqlSession.selectList("MemberMapper.mainProList");
	}
	
	public List<Member> searchProList(Map<String, Object> paramMap){
		return sqlSession.selectList("MemberMapper.mainProList", paramMap);
	}
}
