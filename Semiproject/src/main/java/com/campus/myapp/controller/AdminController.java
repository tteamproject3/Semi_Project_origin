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
	public ModelAndView reviewList(PagingVO pVO) {
		mav = new ModelAndView();
		
		//총 레코드 수
		//pVO.setTotalRecord(service.totalRecord(pVO));
		
		//DB 레코드 선택 - 페이지, 검색어
		//mav.addObject("list",service.reviewList(pVO));
		//mav.addObject("pVO",pVO);
		mav.setViewName("/adminboard/reviewList");
		
		return mav;	
	}
	 //리뷰글 내용 보기(reviewView)
	 //@GetMapping("reviewView")
	 //public ModelAndView boardView(@RequestParam("no") int no, PagingVO pVO){	

		
	 //	mav = new ModelAndView();
	 	//mav.addObject("vo",service.getBoard(no));
	 	//mav.addObject("pVO",pVO);
	 //	mav.setViewName("adminboard/reviewView");
		
	 //	return mav;
	 //}

	////////////////////////////////////테마여행//////////////////////////////

	 //테마여행 게시판
	 @GetMapping("themeList") 
	 public ModelAndView themeList(PagingVO pVO) {
	 	mav = new ModelAndView();
		
	 	//pVO.setTotalRecord(service.totalRecord(pVO));
		
	 	//mav.addObject("list",service.themeList(pVO));
	 	//mav.addObject("pVO",pVO);
	 	mav.setViewName("adminboard/themeList");
		
	 	return mav;	
	 }

	 //테마여행 글쓰기 폼
	 @GetMapping("themeForm")
	 public ModelAndView themeForm(){
	 	mav = new ModelAndView();
	 	mav.setViewName("adminboard/themeForm");

	 	return mav;
	 }

	// //테마여행 글쓰기 DB
	// @PostMapping("themeFormOk")
	//public ResponseEntity<String> themeFormOk(BoardVO vo,HttpServletRequest request){
	//	vo.setGoogle_id((String)request.getSession().getAttribute("logId"));//세션 로그인 아이디
		
	// 	String msg = "<script>";
	// 	try {
	// 		//service.boardWriteOk(vo);
	// 		msg += "location.href='/adminboard/themeList';";
	// 	}catch(Exception e) {
	// 		msg += "alert('글 등록이 실패하였습니다.');";
	// 		msg += "history.go(-1)";
	// 	}
		
	// 	msg+="</script>";
	// 	HttpHeaders headers = new HttpHeaders();
	// 	headers.setContentType(new MediaType("text","html", Charset.forName("UTF-8")));
	// 	headers.add("Content-Type","text/html; charset=UTF-8");
	// 	ResponseEntity<String> entity = new ResponseEntity<String>(msg,headers,HttpStatus.OK);
		
	// 	return entity;
	// }

	// //테마 여행 글내용보기 (themeView)
	// @GetMapping("themeView")
	// public ModelAndView themeView(@RequestParam("no") int no, PagingVO pVO) {

	// 	mav = new ModelAndView();
	// 	mav.addObject("vo",service.getBoard(no));
	// 	mav.addObject("pVO",pVO);
	// 	mav.setViewName("adminboard/themeView");
		
	// 	return mav;
	// }

	// //테마 여행 글수정 폼
	// @GetMapping("themeEdit/{num}")
	// public ModelAndView boardEdit(@PathVariable("num") int no) {
		
	// 	mav = new ModelAndView();
	// 	mav.addObject("vo",service.getBoard(no));
	// 	mav.setViewName("adminboard/themeEdit");
		
	// 	return mav;

	// }
	// //테마 여행 글수정: DB
	// @PostMapping("themeEditOk")
	// public ResponseEntity<String> boardEditOk(BoardVO vo, HttpSession session){
	// 	//세션의 아이디를 구한다.
	// 	vo.setUserid((String)session.getAttribute("logId"));
	// 	HttpHeaders headers = new HttpHeaders();
	// 	headers.setContentType(new MediaType("text","html",Charset.forName("UTF-8")));
	// 	headers.add("Content-Type", "text/html; charset-UTF-8");
	// 	String msg = "<script>";
	// 	try {
	// 		//service.themeEditOk(vo);
	// 		//수정되었음 - 글내용보기
	// 		msg += "alert('글이 수정되었습니다.');";
	// 		msg += "location.href = '/adminboard/themeView?no="+vo.getNo()+"';";
	// 	}catch(Exception e) {
	// 		e.printStackTrace();
	// 		//수정 실패일때
	// 		msg += "alert('글이 수정되지 않았습니다.');";
	// 		msg += "history.go(-1);";
	// 	}
	// 	msg += "</script>";
		
	// 	return new ResponseEntity<String>(msg,headers,HttpStatus.OK);
	// }

	//테마 여행 글 삭제
	 @GetMapping("boardDel")
	 public ModelAndView boardDel(int no,HttpSession session) {
	 	int cnt = service.boardDel(no, (String) session.getAttribute("logId"));
	 	mav= new ModelAndView();
	 	if(cnt>0) {
	 		mav.setViewName("redirect:themeList");
	 	}else {
	 		mav.setViewName("redirect:themeView");
	 	}
		
	 	return mav;
	 }

	// //테마 여행 글 여러개 삭제
	@PostMapping("multiDel")
	public ModelAndView multiDel(BoardVO vo) {
		
		int cnt = service.boardMultiDel(vo);
		System.out.println("삭제된 게시글 수:"+cnt);
			
		mav=new ModelAndView();
		mav.setViewName("redirect:themeView");
			
		return mav;
	}
}