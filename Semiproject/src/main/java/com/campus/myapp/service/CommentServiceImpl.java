package com.campus.myapp.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.campus.myapp.dao.CommentDAO;
import com.campus.myapp.vo.CommentVO;
import com.campus.myapp.vo.PagingVO;


@Service
public class CommentServiceImpl implements CommentService {
	@Inject
	CommentDAO dao;

	@Override
	public int commentInsert(CommentVO vo) {
		return dao.commentInsert(vo);
	}

	@Override
	public List<CommentVO> commentList(int post_id) {
		return dao.commentList(post_id);
	}

	@Override
	public int commentUpdate(CommentVO vo) {
		return dao.commentUpdate(vo);
	}

	@Override
	public int commentDelete(int comment_id, String google_id) {
		return dao.commentDelete(comment_id, google_id);
	}

	@Override
	public List<CommentVO> getMyComment(PagingVO pVO) {
		return dao.getMyComment(pVO);
	}

	@Override
	public int commentMultiDel(CommentVO vo) {
		return dao.commentMultiDel(vo);
	}

	@Override
	public int totalRecord(PagingVO pVO) {
		return dao.totalRecord(pVO);
	}


}
