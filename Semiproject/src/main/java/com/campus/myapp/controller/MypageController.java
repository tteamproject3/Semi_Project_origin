package com.campus.myapp.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.campus.myapp.service.CommentService;
import com.campus.myapp.service.PostService;
import com.campus.myapp.vo.CommentVO;
import com.campus.myapp.vo.PagingVO;

@RestController
@RequestMapping("/mypage/*")
public class MypageController {
	
	//포스팅 글
	@Autowired
	PostService p_service;
	
	
	//댓글
	@Autowired
	CommentService c_service;
	
	
	ModelAndView mav = null;
	
	@GetMapping("myTourList")
	public ModelAndView myTourList() {
		mav = new ModelAndView();
		mav.setViewName("/mypage/myTourList");
		return mav;
	}
	
	//내가 쓴 글 	
	@GetMapping("myWriteList")
	public ModelAndView myWriteList(PagingVO pVO, HttpSession ses) {
		
		mav = new ModelAndView();
				
		//포스트리스트 - 특정 아이디가 쓴 글
		pVO.setSearchKey("google_id");
		pVO.setSearchWord((String)ses.getAttribute("logId"));
		//페이지 세팅
		pVO.setTotalRecord(p_service.totalRecord(pVO));
		mav.addObject("pVO", pVO);
//		System.out.println((String)ses.getAttribute("logId")+"가 쓴 글 불러오는 중");
		
		mav.addObject("list", p_service.boardList(pVO));
		mav.setViewName("/mypage/myWriteList");
		return mav;
	}
	
	//내가 쓴 댓글
	@GetMapping("myCommentList")
	public ModelAndView myCommentList(PagingVO pVO, HttpSession ses) {
		mav = new ModelAndView();
		
		//포스트리스트 - 특정 아이디가 쓴 댓글
		pVO.setSearchKey("google_id");
		pVO.setSearchWord((String)ses.getAttribute("logId"));
		//페이지 세팅
		pVO.setTotalRecord(c_service.totalRecord(pVO));
		mav.addObject("pVO", pVO);
		
		//System.out.println((String)ses.getAttribute("logId")+"가 쓴 글 불러오는 중");
				
		mav.addObject("list", c_service.getMyComment(pVO));
		//System.out.println((String)ses.getAttribute("logId")+"댓글 가져오는 중");
		mav.setViewName("/mypage/myCommentList");
		return mav;
	}
	
	//댓글여러개 삭제
	@PostMapping("commentMultiDel")
	public ModelAndView commentMultiDel(CommentVO vo) {
		int cnt = c_service.commentMultiDel(vo);
		
		mav = new ModelAndView();
		mav.setViewName("redirect:myCommentList");
		return mav;
	}
}
