package com.campus.myapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.campus.myapp.dao.BoardDAO;
import com.campus.myapp.vo.BoardVO;
import com.campus.myapp.vo.PagingVO;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	BoardDAO dao;

	@Override
	public List<BoardVO> boardList(PagingVO pVO) {
		return null;
	}

	@Override
	public int totalRecord(PagingVO pVO) {
		return 0;
	}
}
