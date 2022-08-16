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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.campus.myapp.service.CommentService;
import com.campus.myapp.service.MySavedService;
import com.campus.myapp.service.PostService;
import com.campus.myapp.vo.CommentVO;
import com.campus.myapp.vo.MySavedVO;
import com.campus.myapp.vo.PagingVO;
import com.campus.myapp.vo.PostVO;

@RestController
@RequestMapping("/mypage/*")
public class MypageController {
	
	//포스팅 글
	@Autowired
	PostService p_service;
	
	
	//댓글
	@Autowired
	CommentService c_service;
	
	//마이페이지 저장	
	@Autowired
	MySavedService ms_service;
	
	ModelAndView mav = null;
	
	
	//저장한 글/여행/축제
	@GetMapping("mySavedList")
	public ModelAndView mySavedList(PagingVO pVO, HttpSession ses) {
		mav = new ModelAndView();
		
		//저장리스트 - 특정 아이디가 저
		pVO.setSearchKey("google_id");
		pVO.setSearchWord((String)ses.getAttribute("logId"));
		
		//System.out.println(pVO.toString()); 
		//페이지 세팅
		pVO.setTotalRecord(ms_service.totalRecord(pVO));
		mav.addObject("pVO", pVO);
		
		mav.addObject("list", ms_service.boardList(pVO));	
		mav.setViewName("/mypage/mySavedList");
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
	
	//저장한 글 db 넣기 (테마글)
	@PostMapping("postSave")
	public ResponseEntity<String> postSave(PostVO vo, HttpServletRequest request){
		
		
		ResponseEntity<String> entity = null;
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("text","html",Charset.forName("UTF-8")));
		headers.add("Content-Type", "text/html; charset=utf-8");
		vo.setGoogle_id((String)request.getSession().getAttribute("logId"));
		String msg = "<script>";
		
		//System.out.println(vo.toString());
		try {
			ms_service.postWriteOk(vo);
			
			System.out.println("저장완료~~~~~~~~~~~~");
			msg +="alert('마이페이지 저장 성공');";
			msg += "location.href='/mypage/mySavedList';";
		} catch(Exception e) {
			msg +="alert('마이페이지 저장 실패');";
			msg +="history.go(-1)";
			e.printStackTrace();
		}
		
		msg += "</script>";
		entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);
		return entity;
		
		
	}
	
	//저장한 글 db 넣기 (테마글 외)
	@PostMapping("newSave")
	public ResponseEntity<String> postSave(MySavedVO vo, HttpServletRequest request){
		ResponseEntity<String> entity = null;
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("text","html",Charset.forName("UTF-8")));
		headers.add("Content-Type", "text/html; charset=utf-8");
		
		
		vo.setGoogle_id((String)request.getSession().getAttribute("logId"));
		System.out.println(vo.toString());
		String msg = "<script>";
		try {
			ms_service.postAddOk(vo);
			
			System.out.println("저장완료~~~~~~~~~~~~");
			msg +="alert('마이페이지 저장 성공');";
			msg += "location.href='/mypage/mySavedList';";
		} catch(Exception e) {
			msg +="alert('마이페이지 저장 실패');";
			msg +="history.go(-1)";
			e.printStackTrace();
		}
		
		msg += "</script>";
		entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);
		return entity;
	}
	
}
