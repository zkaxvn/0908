package com.iea.ja.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ConfirmController {
	
	@RequestMapping(value="/confirm", method=RequestMethod.GET)
	public String confirm( ) {
		return "/member/confirm";
	}

}
