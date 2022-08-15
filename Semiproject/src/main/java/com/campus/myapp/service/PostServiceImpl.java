package com.campus.myapp.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.campus.myapp.dao.PostDAO;
import com.campus.myapp.vo.PagingVO;
import com.campus.myapp.vo.PostVO;

@Service
public class PostServiceImpl implements PostService{
	@Inject
	PostDAO dao;

	@Override
	public List<PostVO> boardList(PagingVO pVO) {
		return dao.boardList(pVO);
	}

	@Override
	public int totalRecord(PagingVO pVO) {
		return dao.totalRecord(pVO);
	}

	@Override
	public int postWriteOk(PostVO vo) {
		return dao.postWriteOk(vo);
	}

	@Override
	public void hitCount(int no) {	
		dao.hitCount(no);
	}

	@Override
	public PostVO getBoard(int post_id) {
		return dao.getBoard(post_id);
	}

	@Override
	public int boardDel(int post_id, String google_id) {
		return dao.boardDel(post_id, google_id);
	}

	@Override
	public int boardEditOk(PostVO vo) {
		return dao.boardEditOk(vo);
	}

	@Override
	public int boardMultiDel(PostVO vo) {
		return dao.boardMultiDel(vo);
	}

	@Override
	public List<PostVO> getThemeList(PagingVO pVO) {
		return dao.getThemeList(pVO);
	}

	@Override
	public int totalThemeRecord(PagingVO pVO) {
		return dao.totalThemeRecord(pVO);
	}
}
