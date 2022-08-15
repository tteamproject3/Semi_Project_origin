package com.campus.myapp.service;

import java.util.List;

import com.campus.myapp.vo.CommentVO;

public interface CommentService {
	public int commentInsert(CommentVO vo);
	public List<CommentVO> commentList(int post_id);
	public int commentUpdate(CommentVO vo);
	public int commentDelete(int comment_id, String google_id);
}
