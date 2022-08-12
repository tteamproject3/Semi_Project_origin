package com.campus.myapp.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.campus.myapp.dao.AdminBoardDAO;
import com.campus.myapp.vo.BoardVO;
import com.campus.myapp.vo.PagingVO;

@Service
public class AdminBoardServiceImpl implements AdminBoardService {

    AdminBoardDAO dao;
    @Override
    public List<BoardVO> reviewList(PagingVO pVO) {
        return dao.reviewList(pVO);
    }

    @Override
    public List<BoardVO> themeList(PagingVO pVO) {
        return dao.themeList(pVO);
    }

    @Override
    public int totalRecord(PagingVO pVO) {
        return dao.totalRecord(pVO);
    }

    @Override
    public BoardVO getBoard(int no) {
        return dao.getBoard(no);
    }

    @Override
    public int boardWriteOk(BoardVO vo) {
        return dao.boardWriteOk(vo);
    }

    @Override
    public int themeEditOk(BoardVO vo) {
        return dao.themeEditOk(vo);
    }

    @Override
    public int boardMultiDel(BoardVO vo) {
        return dao.boardMultiDel(vo);
    }

    @Override
    public int boardDel(int no, String userid) {
        return dao.boardDel(no, userid);
    }
       
}
