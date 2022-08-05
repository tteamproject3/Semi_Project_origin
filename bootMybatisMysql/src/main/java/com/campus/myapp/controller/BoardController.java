package com.campus.myapp.controller;//

import java.nio.charset.Charset;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;//
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;//
import org.springframework.web.bind.annotation.GetMapping;//
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;//
import org.springframework.web.bind.annotation.RequestMapping;//
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;//
import org.springframework.web.servlet.ModelAndView;//

import com.campus.myapp.service.BoardService;//
import com.campus.myapp.vo.BoardVO;//
import com.campus.myapp.vo.PagingVO;

@RestController
@RequestMapping("/board/*")
public class BoardController {
	@Autowired
	BoardService service;
	
	ModelAndView mav = null;
	//게시판
	@GetMapping("boardList")
	public ModelAndView boardList(PagingVO pVO) {
		mav = new ModelAndView();
		//이 사이에서 레코드를 선택해야함 ,페이지와 검색어 처리를 해야한다..
		
		//총레코드 수
		pVO.setTotalRecord(service.totalRecord(pVO));
		System.out.println(pVO.toString());
		
		//DB레코드 선택 페이지 검색어
		mav.addObject("pVO", pVO);
		
		
		mav.addObject("list",service.boardList(pVO));
		mav.setViewName("board/boardList");
		return mav;
	}
	//글쓰기폼
	@GetMapping("boardForm")
	public ModelAndView boardForm() {
		mav = new ModelAndView();
		mav.setViewName("board/boardForm");
		return mav;
	}
	//글쓰기 DB
	@PostMapping("boardFormOk")
	public ResponseEntity<String> boardFormOk(BoardVO vo, HttpServletRequest request){
		System.out.println(11);
		vo.setUserid((String)request.getSession().getAttribute("logId"));
		vo.setIp(request.getRemoteAddr());
		
		String msg="<script>";
		try {
			service.boardWriteOk(vo);
			msg += "location.href='/board/boardList';";
		}catch(Exception e){
			msg += "alert('글등록이 실패하였습니다.');";
			msg += "history.go(-1);";
		}
		msg += "</script>";
		ResponseEntity<String> entity = null;
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("text", "html", Charset.forName("UTF-8")));
		headers.add("Content-type", "text/html; charset=utf-8");
		entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);
		return entity;
		
	}
	//글내용보기
	@GetMapping("boardView")
	public ModelAndView boardview(@RequestParam("no") int no, PagingVO pVO){
		//조회수 증가
		service.hitCount(no);
		
		System.out.println(no);
		System.out.println(pVO.toString());
		 
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo", service.getBoard(no)); //그러니까 써비스르 사용하면 DAO에 있는 함수를 호출하는거지 위에 BoardService service로 정의
		mav.addObject("pVO", pVO);
		mav.setViewName("board/boardView");
		
		return mav;
	}
	//글수정 폼
	@GetMapping("boardEdit/{num}")
	public ModelAndView boardEdit(@PathVariable("num") int no) {
		mav = new ModelAndView();
		mav.addObject("vo", service.getBoard(no));
		mav.setViewName("board/boardEdit");
		return mav;
	}
	//글삭제
	@GetMapping("boardDel")
	public ModelAndView boardDel(int no, HttpSession session) {
		int cnt = service.boardDel(no,(String)session.getAttribute("logId")); //session.getAttribute("logId")이건 오브젝으로 오니까 형변환 해야함
		mav = new ModelAndView();
		if(cnt>0) {
			mav.setViewName("redirect:boardList");
		}else {
			mav.setViewName("redirect:boardView");
		}
		return mav;
	}
	//글수정
	@GetMapping("boardEditOk")
	public ResponseEntity<String> boardEditOk(BoardVO vo, HttpSession session){
		//세션의 아이디를 구해서 vo에 세팅
		vo.setUserid((String)session.getAttribute("logId"));
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("text", "html", Charset.forName("UTF-8")));
		headers.add("Content-type", "text/html; charset=utf-8");
		String msg = "<script>";
		try {
			service.boardEditOk(vo);
			//수정되었을 때 글내용보기로 보내기
			msg +="alert('글 수정되었습니다.');";
			msg +="location.href='/board/boardView?no="+vo.getNo()+"';";
			
		}catch(Exception e) {
			e.printStackTrace();
			//수정실패시 수정으로 보내기(history)
			msg +="alert('글 수정 실패하였습니다.');";
			msg += "history.go(-1);";
		}
		msg += "</script>";
		
		return new ResponseEntity<String>(msg, headers, HttpStatus.OK);
	}
	//여러개의 레코드 삭제
	@PostMapping("/multiDel")
	public ModelAndView multiDel(BoardVO vo) {
		int cnt = service.boardMultiDel(vo);
		System.out.println(cnt);
		mav=new ModelAndView();
		mav.setViewName("redirect:boardList");
		return mav;
	}


}
