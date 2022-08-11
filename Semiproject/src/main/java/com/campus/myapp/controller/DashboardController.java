package com.campus.myapp.controller;


import javax.inject.Inject;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.campus.myapp.service.DashBoardService;
import com.campus.myapp.vo.PagingVO;

@RestController
@RequestMapping("/dashboard/*")
public class DashboardController {

    @Inject
    DashBoardService service;

    ModelAndView mav = null;

      
	@GetMapping("all") //a태그
	public ModelAndView boardList(PagingVO pVO) {
		mav = new ModelAndView();
		
	//총 레코드 수
		pVO.setTotalRecord(service.totalRecord(pVO));
		
		//DB 레코드 선택 - 페이지, 검색어
		mav.addObject("list",service.boardList(pVO));
		mav.addObject("pVO",pVO);
		mav.setViewName("dashboard/all");
		
		return mav;	
	}
}
