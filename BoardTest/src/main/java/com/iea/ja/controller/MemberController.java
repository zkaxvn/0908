package com.iea.ja.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.iea.ja.service.MemberService;
import com.iea.ja.vo.Member;


@Controller
public class MemberController {

	@Autowired
	MemberService service;
	@Autowired
	BCryptPasswordEncoder bcryptPasswordEncoder;

	@RequestMapping(value = "/joinForm", method = RequestMethod.GET)
	public String joinForm() {
		return "/member/join";
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public ModelAndView join(ModelAndView mv, Member user, RedirectAttributes redirect,
			@RequestParam(value = "memberId") String memberId,
			@RequestParam(value = "memberPwd") String memberPwd, 
			@RequestParam(value = "memberName") String memberName,
			@RequestParam(value = "msg", required = false ,defaultValue="") String msg)
			throws Exception {
		
		//유저 상태
		user.setMemberState("Y");
		
		//비밀번호 암호화
		String afterPwd = bcryptPasswordEncoder.encode(user.getMemberPwd());
		user.setMemberPwd(afterPwd);
		
		int result = service.userSignUp(user);
		if (result> 0) {
			redirect.addAttribute("msg", "회원가입이 완료되었습니다!");
			mv.setViewName("redirect:/joinComplete");
		} else {
			mv.addObject("msg","서버 오류! 관리자에게 문의 바랍니다.");
			mv.setViewName("/member/join");
		}
		if(!msg.equals("")) {
			mv.addObject("msg", msg);
		}
		return mv;
	}
	
	@RequestMapping(value = "/joinComplete", method = RequestMethod.GET)
	public ModelAndView joinComplete(ModelAndView mv) {
		mv.setViewName("member/joinComplete");
		return mv;
	}
	
	/*
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public ModelAndView join(@Validated ModelAndView mv, 
			@RequestParam(value = "memberId") String memberId,
			@RequestParam(value = "memberPw") String memberPw, 
			@RequestParam(value = "userName") String userName)
			throws Exception {
		//비밀번호 암호화
		String afterPwd = bcryptPasswordEncoder.encode(user.getMemberPwd());
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		// paramMap.put("",);
		paramMap.put("memberId",memberId);
		paramMap.put("memberPw",memberPw);
		paramMap.put("userName",userName);
		System.out.println(paramMap);
		// 서비스에 넣어줄 파람맵 

		service.join(paramMap); // 
		System.out.println(memberId);
		System.out.println(memberPw);
		System.out.println(userName);
		mv.setViewName("home");
		return mv;
	}
	*/
	/*

	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public ModelAndView join(ModelAndView mv, 
			@RequestParam(value = "memberId") String memberId,
			@RequestParam(value = "memberPw") String memberPw, 
			@RequestParam(value = "userName") String userName)
			throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		// paramMap.put("",);
		paramMap.put("memberId",memberId);
		paramMap.put("memberPw",memberPw);
		paramMap.put("userName",userName);
		System.out.println(paramMap);
		// 서비스에 넣어줄 파람맵 

		service.join(paramMap); // 
		System.out.println(memberId);
		System.out.println(memberPw);
		System.out.println(userName);
		mv.setViewName("home");
		return mv;
	}
*/
	

	/*
	@RequestMapping(value="/userSignUp", method = RequestMethod.POST)
	public ModelAndView userSignUp(ModelAndView mv, Member user) {
		//유저 상태
		
		//비밀번호 암호화
		
		int result = service.userSignUp(user);
		if (result > 0) {
			mv.setViewName("redirect:/joinComplete"); // joinComplete 컨트롤러 찾기
		} else {
			mv.addObject("msg", "서버 오류! 관리자에게 문의 바랍니다.");
			mv.setViewName("/member/join"); 
			// mv.setViewName("member/joinForm?type="+user.getMemberGubun());
		}
		
		return mv;
	}
	*/
	
	@RequestMapping(value="/loginForm", method=RequestMethod.GET)
	public String loginForm() {
		return "/member/login";
	}
	
	/*
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public ModelAndView login(ModelAndView mv, HttpSession session,
			@RequestParam(value="memberId") String memberId, //ctrl + alt + 아래화살표 : 복사
			@RequestParam(value="memberPw") String memberPw
			) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("memberId",memberId);
		paramMap.put("memberPw",memberPw);
		
		Map<String, Object> loginUserMap = service.login(paramMap);
		if (loginUserMap != null && !loginUserMap.toString().equals("")) {
			session.setAttribute("loginUserMap", loginUserMap);
			mv.addObject("msg", "로그인 성공");
			mv.setViewName("home");
			
		} else {
			mv.addObject("msg", "아이디 비밀번호를 확인해주세요");
			mv.setViewName("login");
		}
		return mv;
	}
	*/
	
	@RequestMapping(value="/login", method = RequestMethod.POST)
	public ModelAndView login(ModelAndView mv, HttpServletRequest request, HttpSession session) throws Exception{
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		String memberId = request.getParameter("memberId");
		String memberPwd = request.getParameter("memberPwd");
		dataMap.put("memberId", memberId); // dataMap에 memberId 넣어줌	
		Map<String, Object> loginUserMap = service.getMember(dataMap); // 서비스의 겟멤버를 활용하여 user 데이터 정보 loginUserMap에 담기
		if (loginUserMap != null && loginUserMap.toString() != "") {
			if(bcryptPasswordEncoder.matches(memberPwd, loginUserMap.get("member_pw").toString())) {	
				session.setAttribute("loginUserMap" , loginUserMap); //session  사용
				mv.setViewName("home");
			} else {
				mv.addObject("msg", "아이디 비밀번호를 확인하세요.");
				mv.setViewName("/member/login");
				return mv;
			}
			
		}
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value= "/idCheck", method = RequestMethod.GET)
	public String idCheck(HttpServletRequest request) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		String result = "";
		
		String id = request.getParameter("id");
		paramMap.put("memberId", id);
		
		Map<String, Object> userInfo = service.getMember(paramMap);
		
		if (userInfo != null) {
			result = "false";
		} else {
			result = "true";
		} 
		return result;
	}
	
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public ModelAndView logout(ModelAndView mv, HttpServletRequest request, HttpSession session) throws Exception {
		//Map<String, Object> sessionMap = (Map<String, Object>) session.getAttribute("loginUserMap");
		session.invalidate();
		mv.setViewName("redirect:/");
		return mv;
	}

}
