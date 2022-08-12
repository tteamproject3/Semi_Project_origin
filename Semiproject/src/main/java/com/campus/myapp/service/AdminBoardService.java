package com.campus.myapp.service;

import java.util.List;

import org.springframework.stereotype.Repository;
import com.campus.myapp.vo.BoardVO;
import com.campus.myapp.vo.PagingVO;

@Repository
public interface AdminBoardService {

    public List<BoardVO> reviewList(PagingVO pVO);
    public List<BoardVO> themeList(PagingVO pVO);
    public int totalRecord(PagingVO pVO);
    public BoardVO getBoard(int no);
    public int boardWriteOk(BoardVO vo);
    public int themeEditOk(BoardVO vo);
    public int boardMultiDel(BoardVO vo);
    public int boardDel(int no, String userid);
}
