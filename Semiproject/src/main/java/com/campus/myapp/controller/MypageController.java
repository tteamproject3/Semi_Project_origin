package com.campus.myapp.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping("/mypage/*")
public class MypageController {
	
	ModelAndView mav = null;
	
	@GetMapping("myTourList")
	public ModelAndView myTourList() {
		mav = new ModelAndView();
		mav.setViewName("/mypage/myTourList");
		return mav;
	}
	
	@GetMapping("myWriteList")
	public ModelAndView myWriteList() {
		mav = new ModelAndView();
		mav.setViewName("/mypage/myWriteList");
		return mav;
	}
	@GetMapping("myCommentList")
	public ModelAndView myCommentList() {
		mav = new ModelAndView();
		mav.setViewName("/mypage/myCommentList");
		return mav;
	}
}
