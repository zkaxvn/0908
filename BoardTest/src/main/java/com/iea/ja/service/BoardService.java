package com.iea.ja.service;

import java.util.List;
import java.util.Map;

import com.iea.ja.common.PageInfo;

public interface BoardService {
	
	public List<Map<String, Object>> boardList(PageInfo pi, Map<String, Object> paramMap) throws Exception;

	public int boardWrite(Map<?, ?> paramMap) throws Exception;
	
	public Map<String, Object> getDetail(Map<?,?> paramMap) throws Exception;

	int boardModify(Map<?, ?> paramMap) throws Exception;

	int boardDelete(Map<?, ?> paramMap) throws Exception;
	

	int getNoticeListCount(Map<?, ?> paramMap);

	int deleteNotice(Map<?, ?> paramMap) throws Exception;
}
