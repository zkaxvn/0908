package com.iea.ja.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.iea.ja.common.PageInfo;
import com.iea.ja.dao.Dao;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private Dao dao;

	@Override
	public List<Map<String, Object>> boardList(PageInfo pi, Map<String, Object> paramMap) throws Exception {
		return (List<Map<String, Object>>) dao.getList(pi, "BoardMapper.boardList", paramMap); //pi 추가
	}

	@Override
	public int boardWrite(Map<?, ?> paramMap) throws Exception {
		int result = dao.insert("BoardMapper.boardWrite", paramMap);
		return result;
	}
	
	@Override
	public Map<String, Object> getDetail(Map<?, ?> paramMap) throws Exception {
		return (Map<String,Object>) dao.getMap("BoardMapper.getDetail", paramMap);
		// Map<String, Object> result = (Map<String, Object>) dao.getMap("BoardMapper.getDetail", paramMap);
	}
	
	@Override
	public int boardModify(Map<?,?> paramMap) throws Exception {
		int result = dao.update("BoardMapper.boardModify", paramMap);
		return result;
	}
	
	@Override
	public int boardDelete(Map<?,?> paramMap) throws Exception {
		int result = dao.delete("BoardMapper.boardDelete" , paramMap);
		return result;
	}
	
	@Override
	public int getNoticeListCount(Map<?,?> paramMap) {
		return dao.getListSearchCount("BoardMapper.getListCount" , paramMap);
	}
	
	@Override
	public int deleteNotice(Map<?,?> paramMap) throws Exception {
		int result = dao.delete("BoardMapper.deleteNotice", paramMap);
		return result;
	}

}
