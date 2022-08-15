package com.campus.myapp.controller;

import java.nio.charset.Charset;

import javax.inject.Inject;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.campus.myapp.service.PostService;
import com.campus.myapp.vo.PagingVO;
import com.campus.myapp.vo.PostVO;

@RestController
@RequestMapping("/adminboard/*")
public class AdminController {

    @Inject
    PostService p_service;
	
    ModelAndView mav = null;

	//데이터 게시판
	@GetMapping("spotList")
	public ModelAndView reviewList(PagingVO pVO, HttpSession ses) {
		mav = new ModelAndView();
		
		//페이지 세팅
		//pVO.setTotalRecord(p_service.totalRecord(pVO));
		mav.addObject("pVO",pVO);
		
		//mav.addObject("list", p_service.boardList(pVO));
		mav.setViewName("/adminboard/spotList");
		return mav;	
	}

	
	 //테마여행 게시판
	 @GetMapping("themeList") 
	 public ModelAndView themeList(PagingVO pVO) {
	 	mav = new ModelAndView();
	 	//페이지 세팅 (theme)
	 	pVO.setSearchType("theme");
	 	//pVO.setTotalRecord(p_service.totalRecord(pVO));
	 	pVO.setTotalRecord(p_service.totalThemeRecord(pVO));
	 	mav.addObject("pVO",pVO);

	 	//DB 레코드 선택 - 페이지, 검색어
	 	//포스트타입이 thema 인 것 불러오기 
//	 	System.out.println(pVO.getSearchWord());
	 	mav.addObject("list", p_service.getThemeList(pVO));
	 	mav.setViewName("/adminboard/themeList");
	 	return mav;	
	 }

	 //테마여행 작성하기
	 @GetMapping("themeForm")
	 public ModelAndView themeForm() {

		 mav = new ModelAndView();
		 mav.setViewName("/adminboard/themeForm");
		 return mav;
	 }
	 
	 //테마여행 작성하기 -> DB
	 @PostMapping("themeFormOk")
	 public ResponseEntity<String> boardFormOk(PostVO vo, HttpServletRequest request){
		 //세션 로그인 아이디 
		 vo.setGoogle_id((String)request.getSession().getAttribute("logId"));
		 String msg = "<script>";

		 try {
			 p_service.postWriteOk(vo);
			 msg += "location.href='/adminboard/themeList';";
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
	 
	 //테마글내용보기
	 @GetMapping("themeView")
	 public ModelAndView boardView(@RequestParam("post_id") int post_id, PagingVO pVO) {

		 //조회수증가
		 p_service.hitCount(post_id);

		 mav = new ModelAndView();
		 mav.addObject("vo", p_service.getBoard(post_id));
		 mav.addObject("pVO", pVO);		
		 mav.setViewName("/adminboard/themeView");	
		 return mav;
	 }
	 
	 //테마글 수정
	 @GetMapping("themeEdit")
	 public ModelAndView boardEdit(int post_id) {

		 mav = new ModelAndView();
		 mav.addObject("vo", p_service.getBoard(post_id));
		 mav.setViewName("/adminboard/themeEdit");
		 return mav; 
	 }
	 
	 
	//테마글수정 -> DB
		@PostMapping("themeEditOk")
		public ResponseEntity<String>  boardEditOk(PostVO vo, HttpSession session){
			//세션의 아이디 구하기
			vo.setGoogle_id((String)session.getAttribute("logId"));
			
			HttpHeaders headers = new HttpHeaders();
		    headers.setContentType(new MediaType("text","html",Charset.forName("UTF-8")));
		    headers.add("Content-Type", "text/html; charset=utf-8");
		    
		    String msg = "<script>";
			try {
				p_service.boardEditOk(vo);
				//수정 성공일 때 -> 글 내용 보기
				msg +="alert('글이 수정되었습니다.');";
				msg += "location.href='/adminboard/themeView?post_id="+vo.getPost_id()+"';";
				
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
	@GetMapping("themeDel")
	public ModelAndView boardDel(int post_id, HttpSession session) {
		int cnt = p_service.boardDel(post_id, (String)session.getAttribute("logId"));

		mav = new ModelAndView();
		if (cnt>0) {
			mav.setViewName("redirect:themeList");
		} else {
			mav.setViewName("redirect:themeView");
		}
		return mav;
	}

	@PostMapping("multiDel")
	public ModelAndView multiDel(PostVO vo) {
		int cnt = p_service.boardMultiDel(vo);

		mav = new ModelAndView();
		mav.setViewName("redirect:themeList");
		return mav;
	}

}













