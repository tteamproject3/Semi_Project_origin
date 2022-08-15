package com.campus.myapp.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.campus.myapp.service.FestivalService;
import com.campus.myapp.service.PostService;
import com.campus.myapp.vo.PagingVO;

@Controller
public class HomeController {
	
	@Inject
	PostService p_service;
	FestivalService f_service;
	
	ModelAndView mav = null;
	
	@RequestMapping("/")
	public ModelAndView home() {
		
		mav = new ModelAndView();
		
		//불러올 테마 레코드 세팅
		PagingVO pVO = new PagingVO();
		pVO.setOnePageRecord(4);
		pVO.setOffsetPoint(0);
		mav.addObject("t_list", p_service.getThemeList(pVO));
		
		//축제데이터 불러오기
		//mav.addObject("f_list", f_service.getFestivalList());
		mav.setViewName("index");
		return mav;
	}

	@RequestMapping("/home/term")
	public String term() {
		return "home/term";
	}
	
	@RequestMapping("/home/aboutus")
	public String aboutus() {
		return "home/aboutus";
	}
	@RequestMapping("/home/policy")
	public String policy() {
		return "home/policy";
	}
}
