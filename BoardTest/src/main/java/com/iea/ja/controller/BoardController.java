package com.iea.ja.controller;

import java.lang.ProcessBuilder.Redirect;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.iea.ja.common.PageInfo;
import com.iea.ja.common.Pagination;
import com.iea.ja.service.BoardService;

@Controller
public class BoardController {
	
	@Autowired
	BoardService service;
	
	
	//페이징처리, 검색처리
	@RequestMapping(value="/boardList", method=RequestMethod.GET)
	public ModelAndView boardList(ModelAndView mv, 
			@RequestParam(value="page", required = false) Integer page,
			@RequestParam(value="keyWord", defaultValue="") String keyWord,
			@RequestParam(value="select", defaultValue="id") String select,
			@RequestParam(value = "msg", required = false ,defaultValue="") String msg) throws Exception {
		//쿼리로 담아갈 데이터맵
		Map<String, Object> paramMap = new HashMap<String, Object>();
		if(!msg.equals("")) {
			mv.addObject("msg",msg);
		}
		// 현재 페이지
		int currentPage = (page != null) ? page :1;
		
		// 한 페이지 당 보여줄 row
		int boardLimit = 5;
		
		// 검색키워드
		paramMap.put("keyWord", keyWord);
		paramMap.put("select", select);
		
		// 상위 리스트 카운트
		int listCount = service.getNoticeListCount(paramMap);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);
		List<Map<String, Object>> boardList = service.boardList(pi, paramMap);
		if (boardList != null) {
			mv.addObject("boardList", boardList);
			mv.addObject("startPage", pi.getStartPage());
			mv.addObject("endPage", pi.getEndPage());
			mv.addObject("currentPage", currentPage);
			mv.addObject("maxPage", pi.getMaxPage());
			mv.addObject("select", select);
			mv.addObject("keyWord", keyWord); 
			
		}
		mv.setViewName("board/boardList");
		return mv;
	}
	
/*
	@RequestMapping(value = "/boardList", method = RequestMethod.GET)
	public ModelAndView boardList(ModelAndView mv) throws Exception {
		//쿼리로 담아갈 파람맵
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		// List<Map> 정의
		List<Map<String, Object>> boardList = service.boardList(paramMap); 
		
		mv.addObject("boardList", boardList);	
		mv.setViewName("board/boardList");
		return mv;
	}
*/
	
	@RequestMapping(value="/boardWriteForm", method=RequestMethod.GET)
	public String boardWriteForm() {
		return "board/boardWrite"; //jsp
	}
	
	// 모델로 전달할거니까?
	@RequestMapping(value="/boardWrite", method=RequestMethod.POST)
	public ModelAndView boardWrite(ModelAndView mv, RedirectAttributes redirect, HttpSession session,
			//jsp(앞단)에서 입력받은 애들 Param 으로 받아옴
			@RequestParam(value="noticeTitle") String noticeTitle,
			@RequestParam(value="noticeCont") String noticeCont) throws Exception { 
		//로그인 된 사람의 아이디로 등록되게 만들어보기
		Map<String, Object> sessionMap = (Map<String,Object>) session.getAttribute("loginUserMap");
		String memberId = (String) sessionMap.get("member_id");
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("noticeTitle", noticeTitle);
		paramMap.put("noticeCont", noticeCont);
		//임시 아이디
		paramMap.put("memberId", memberId );
		
		int result = service.boardWrite(paramMap);
		if (result > 0) {
			redirect.addAttribute("msg", "게시글이 등록되었습니다!");
			mv.setViewName("redirect:/boardList");
		} else {
			redirect.addAttribute("msg", "업로드 실패");
			mv.setViewName("board/boardWrite");
		}
		return mv;
	}
	
	@RequestMapping(value="/boardDetail" , method = RequestMethod.GET)
	//프라임 키 하나만 받아서 그 데이터 다 가져오게 하면 되니까 굳이 다 가져올 필요 없음
	public ModelAndView boardDetail(ModelAndView mv, @RequestParam(value="noticeSeq") String noticeSeq) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>(); // 파람맵으로 가져올거임
		paramMap.put("noticeSeq", noticeSeq); //파람맵에 받아온  seq 값 넣어줌
		
		Map<String,Object> detail = service.getDetail(paramMap); // 디테일을 조회하려고 조건에 필요한 seq가 담긴 파램맵을 보내서 조회를해서 detail에 담은거
		mv.addObject("detail", detail); // 받아온 detail을 뷰에 뿌려줌
		mv.setViewName("board/boardDetail"); // 이거 다 실행 후 //이게 없으니까 view 의 boardDetail을 찾으려고 하네?
		return mv;
	}
/* 
 * 잘못된거
	@RequestMapping(value="/boardDetail", method=RequestMethod.GET)
	public ModelAndView boardDetail(ModelAndView mv,
			@RequestParam(value="noticeTitle") String noticeTitle,
			@RequestParam(value="noticeCont") String noticeCont,
			@RequestParam(value="memberId") String memberId) {
		mv.addObject("noticeTitle", noticeTitle);
		mv.addObject("noticeCont", noticeCont);
		mv.addObject("memberId", memberId);
		mv.setViewName("board/boardDetail");
		return mv;
	}
*/	
	@RequestMapping(value="/boardModifyForm", method=RequestMethod.GET)
	public ModelAndView boardModifyForm(ModelAndView mv,
			@RequestParam(value="noticeSeq") String noticeSeq) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("noticeSeq", noticeSeq);
		
		Map<String, Object> detail = service.getDetail(paramMap);
		mv.addObject("detail", detail);
		mv.setViewName("board/boardModify");
		
		return mv;
		
		// Controller 는 상세페이지조회 boardDetail과 동일, jsp 만 변경
		// 굉장히 비효율적임
		// 상세페이지 그대로 구현해 오면 서  jsp 만 바꿀 수 없낭
		// 아님 jsp 에서 제출만 하면 되지 않나
	}
	
	@RequestMapping(value="/boardModify", method=RequestMethod.POST)
	public ModelAndView boardModify(ModelAndView mv, RedirectAttributes redirect,
			@RequestParam(value="noticeTitle") String noticeTitle,
			@RequestParam(value="noticeCont") String noticeCont,
			@RequestParam(value="noticeSeq") String noticeSeq) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("noticeTitle", noticeTitle);
		paramMap.put("noticeCont", noticeCont);
		paramMap.put("noticeSeq", noticeSeq);
		
		int result = service.boardModify(paramMap);
		if (result > 0 ) {
			redirect.addAttribute("msg", "게시글이 수정되었습니다!");
			mv.setViewName("redirect:/boardList");
		} else {
			redirect.addAttribute("msg", "서버 오류! 관리자에게 문의하세요.");
			mv.setViewName("board/boardModify");
		}
		
		return mv;
	}
	

	@RequestMapping(value="/boardDelete", method=RequestMethod.GET)
	public ModelAndView boardDelete(ModelAndView mv,
			@RequestParam(value="noticeSeq") String noticeSeq,RedirectAttributes redirect) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("noticeSeq", noticeSeq);
		
		int result = service.boardDelete(paramMap);
		if (result>0) {
			redirect.addAttribute("msg", "게시글이 삭제되었습니다!");
			mv.setViewName("redirect:/boardList");
		} else {
			redirect.addAttribute("msg", "서버 오류!");
			mv.setViewName("board/boardDetail");
		}
		return mv;
	}
	
	@RequestMapping(value="/deleteNotice", method=RequestMethod.GET, produces= MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public String deleteNotice(HttpServletRequest request, RedirectAttributes redirect) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		ObjectMapper mapper = new ObjectMapper();
		ObjectNode obj = mapper.createObjectNode();
		
		int noticeSeq = Integer.parseInt(request.getParameter("noticeSeq"));
		
		paramMap.put("noticeSeq", noticeSeq);
		
		int result = service.deleteNotice(paramMap);
		
		if (result > 0) {
			obj.put("result", true);
		} else {
			obj.put("result", false);
		}
		return obj.toString();
	}
		
	
}
