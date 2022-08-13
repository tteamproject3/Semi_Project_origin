package com.campus.myapp.controller;

import java.nio.charset.Charset;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.campus.myapp.service.BoardService;
import com.campus.myapp.vo.BoardVO;
import com.campus.myapp.vo.PagingVO;

@RestController
@RequestMapping("/board/*")
public class BoardController {

    @Inject
    BoardService service;
    
	ModelAndView mav = null;

  //게시판
	@GetMapping("boardList") //a태그
	public ModelAndView boardList(PagingVO pVO) {
		mav = new ModelAndView();
		pVO.setTotalRecord(service.totalRecord(pVO));	
		mav.addObject("list",service.boardList(pVO));
		mav.addObject("pVO",pVO);
		mav.setViewName("board/boardList");
		
		return mav;	
	}
}