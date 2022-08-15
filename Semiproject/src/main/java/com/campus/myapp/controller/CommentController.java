package com.campus.myapp.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.campus.myapp.service.CommentService;
import com.campus.myapp.vo.CommentVO;

@RestController
@RequestMapping("/comment/*")
public class CommentController {
//	@Autowired
//	CommentService service;
//
//	
//	//댓글 쓰기
//	@PostMapping("commentWrite")
//	public int commentWrite(CommentVO vo, HttpSession session) {
//		
//		vo.setGoogle_id((String)session.getAttribute("logId"));
//		
//		return service.commentInsert(vo);
//	}
//	
//	//댓글목록 선택
//	@GetMapping("commentList")
//	public List<CommentVO> commentList(int post_id) {
////		System.out.println(post_id+"의 댓글목록 가져오는 중");
//		try {
//			List<CommentVO> result = service.commentList(post_id);
//			return result;
//		} catch(Exception e){
//			e.printStackTrace();
//			return null;
//		}
//		
//	}
//	
//	//댓글수정
//	@PostMapping("commentEdit")
//	public int commentEdit(CommentVO vo, HttpSession ses) {
//		vo.setGoogle_id((String)ses.getAttribute("logId"));
//		return service.commentUpdate(vo);
//	}
//	
//	//댓글삭제
//	@GetMapping("commentDel")
//	public int commentDel(int comment_id, HttpSession s) {
//		String google_id = (String)s.getAttribute("logId");
//		
//		return service.commentDelete(comment_id, google_id);
//	}
//	

}


