package com.campus.myapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.campus.myapp.vo.CommentVO;
import com.campus.myapp.vo.PagingVO;

@Mapper
@Repository
public interface CommentDAO {
	public int commentInsert(CommentVO vo);
	public List<CommentVO> commentList(int post_id);
	public int commentUpdate(CommentVO vo);
	public int commentDelete(int comment_id, String google_id);
	
	//마이페이지 - 댓글 불러오기
	public List<CommentVO> getMyComment(PagingVO pVO);
	
	//마이페이지 - 댓글 여러개 삭제
	public int commentMultiDel(CommentVO vo);
	
	public int totalRecord(PagingVO pVO);
}
