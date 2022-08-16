package com.campus.myapp.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.campus.myapp.dao.MySavedDAO;
import com.campus.myapp.vo.MySavedVO;
import com.campus.myapp.vo.PagingVO;
import com.campus.myapp.vo.PostVO;

@Service
public class MySavedServiceImpl implements MySavedService {

	@Inject
	MySavedDAO dao;
	
	@Override
	public int postWriteOk(PostVO vo) {
		return dao.postWriteOk(vo);
	}

	@Override
	public int totalRecord(PagingVO pVO) {
		return dao.totalRecord(pVO);
	}

	@Override
	public List<MySavedVO> boardList(PagingVO pVO) {
		return dao.boardList(pVO);
	}

	@Override
	public int postAddOk(MySavedVO vo) {
		return dao.postAddOk(vo);
	}

}
