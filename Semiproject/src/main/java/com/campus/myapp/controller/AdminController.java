package com.campus.myapp.controller;

import java.nio.charset.Charset;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.campus.myapp.service.AdminBoardService;
import com.campus.myapp.vo.BoardVO;
import com.campus.myapp.vo.PagingVO;


@RestController
@RequestMapping("/adminboard/*")
public class AdminController {

    @Autowired
    AdminBoardService service;
    ModelAndView mav = null;

	//리뷰 게시판(reveiwList)
	@GetMapping("reviewList")
	public ModelAndView reviewList() {
		mav = new ModelAndView();
		service.aaa();
		//mav.addObject("Allist",service.alist());
		
		mav.setViewName("/adminboard/reviewList");
		
		return mav;	
	}

}