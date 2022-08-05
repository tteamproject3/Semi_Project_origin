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
		// TODO Auto-generated method stub
		return dao.boardList(pVO);
	}

	@Override
	public int boardWriteOk(BoardVO vo) {
		// TODO Auto-generated method stub
		return dao.boardWriteOk(vo);
	}

	@Override
	public BoardVO getBoard(int no) {
		// TODO Auto-generated method stub
		return dao.getBoard(no);
	}

	@Override
	public int boardEditOk(BoardVO vo) {
		// TODO Auto-generated method stub
		return dao.boardEditOk(vo);
	}

	@Override
	public int boardDel(int no, String userid) {
		// TODO Auto-generated method stub
		return dao.boardDel(no, userid);
	}

	@Override
	public void hitCount(int no) {
		// TODO Auto-generated method stub
		dao.hitCount(no);
	}

	@Override
	public int totalRecord(PagingVO pVO) {
		// TODO Auto-generated method stub
		return dao.totalRecord(pVO);
	}

	@Override
	public int boardMultiDel(BoardVO vo) {
		// TODO Auto-generated method stub
		return dao.boardMultiDel(vo);
	}
}
