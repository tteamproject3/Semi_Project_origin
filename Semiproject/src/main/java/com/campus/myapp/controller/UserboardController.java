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

import com.campus.myapp.service.PostService;
import com.campus.myapp.vo.PagingVO;
import com.campus.myapp.vo.PostVO;

@RestController
@RequestMapping("/userboard/*")
public class UserboardController {

	@Autowired
	PostService service;
	
	ModelAndView mav = null;
	
	//목록보기
	@GetMapping("boardList")
	public ModelAndView boardList(PagingVO pVO) {
		mav = new ModelAndView();
		
		//페이지세팅
		System.out.println(pVO.getSearchType());
		pVO.setTotalRecord(service.totalRecord(pVO));
		//포스트 리스트
		mav.addObject("list", service.boardList(pVO));
		mav.addObject("pVO", pVO);
		mav.setViewName("/userboard/boardList");
		return mav;
	}
	
	//글내용보기
	@GetMapping("boardView")
	public ModelAndView boardView(@RequestParam("post_id") int post_id, PagingVO pVO) {
		
		//조회수증가
		service.hitCount(post_id);
		
		mav = new ModelAndView();
		mav.addObject("vo", service.getBoard(post_id));
		mav.addObject("pVO", pVO);		
		mav.setViewName("/userboard/boardView");	
		return mav;
	}
	

	//글 작성하기
	@GetMapping("boardForm")
	public ModelAndView boardForm() {
		
		mav = new ModelAndView();
		mav.setViewName("/userboard/boardForm");
		return mav;
	}
	
	
	@GetMapping("boardFormNotice")
	public ResponseEntity<String> boardFormNotice(HttpSession session) {
		
		//관리자 모드 확인
		int mode = Integer.parseInt(session.getAttribute("logMode").toString());
//		System.out.println("mode"+ mode);
		
		String msg = "<script>";
		if(mode == 0) { //관리자 아님

			msg +="alert('공지글은 관리자만 작성할 수 있습니다.');";
			msg +="location.href='/userboard/boardList';";
		} else {

			msg += "location.href='/userboard/toNotice';";
		}
		msg += "</script>";
		ResponseEntity<String> entity = null;
		HttpHeaders headers = new HttpHeaders();
	    headers.setContentType(new MediaType("text","html",Charset.forName("UTF-8")));
	    headers.add("Content-Type", "text/html; charset=utf-8");
		
	    entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);
	    
	    return entity;
	}
	@GetMapping("toNotice")
	public ModelAndView toNotice() {
		mav = new ModelAndView();
		mav.setViewName("/userboard/boardFormNotice");
		return mav;
	}
			
			
	//글 작성 -> DB
	@PostMapping("boardFormOk")
	public ResponseEntity<String> boardFormOk(PostVO vo, HttpServletRequest request){
		//세션 로그인 아이디 
		vo.setGoogle_id((String)request.getSession().getAttribute("logId"));
		String msg = "<script>";
		
		try {
			service.postWriteOk(vo);
			msg += "location.href='/userboard/boardList';";
		} catch(Exception e) {
			msg +="alert('글등록이 실패하였습니다.');";
			msg +="history.go(-1)";
			e.printStackTrace();
		}
		
		msg += "</script>";
		ResponseEntity<String> entity = null;
		HttpHeaders headers = new HttpHeaders();
	    headers.setContentType(new MediaType("text","html",Charset.forName("UTF-8")));
	    headers.add("Content-Type", "text/html; charset=utf-8");
		
	    entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);
	    
	    return entity;
	}
	
	//글수정
	@GetMapping("boardEdit")
	public ModelAndView boardEdit(int post_id) {

		mav = new ModelAndView();
		mav.addObject("vo", service.getBoard(post_id));
		mav.setViewName("/userboard/boardEdit");
		return mav; 
	}
	
	//글수정 -> DB
	@PostMapping("boardEditOk")
	public ResponseEntity<String>  boardEditOk(PostVO vo, HttpSession session){
		//세션의 아이디 구하기
		vo.setGoogle_id((String)session.getAttribute("logId"));
		
		HttpHeaders headers = new HttpHeaders();
	    headers.setContentType(new MediaType("text","html",Charset.forName("UTF-8")));
	    headers.add("Content-Type", "text/html; charset=utf-8");
	    
	    String msg = "<script>";
		try {
			service.boardEditOk(vo);
			//수정 성공일 때 -> 글 내용 보기
			msg +="alert('글이 수정되었습니다.');";
			msg += "location.href='/userboard/boardView?post_id="+vo.getPost_id()+"';";
			
		}catch(Exception e) {
			e.printStackTrace();
			//수정 실패일 때 -> 수정으로 보내기(history)
			msg +="alert('글 수정 실패하였습니다.');";
			msg += "history.go(-1)";
		}
		msg += "</script>";
		
		return new ResponseEntity<String>(msg, headers, HttpStatus.OK);
	}
	
	
	//글삭제 
	@GetMapping("boardDel")
	public ModelAndView boardDel(int post_id, HttpSession session) {
		int cnt = service.boardDel(post_id, (String)session.getAttribute("logId"));
		
		mav = new ModelAndView();
		if (cnt>0) {
			mav.setViewName("redirect:boardList");
		} else {
			mav.setViewName("redirect:boardView");
		}
		return mav;
	}
	
	@PostMapping("multiDel")
	public ModelAndView multiDel(PostVO vo) {
		//System.out.println(vo.getNoList().toString());
		int cnt = service.boardMultiDel(vo);
		//System.out.println(cnt);
		
		mav = new ModelAndView();
		mav.setViewName("redirect:boardList");
		return mav;
	}
}
