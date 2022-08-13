package com.campus.myapp.dao;

import java.util.List;

import org.springframework.stereotype.Service;
import com.campus.myapp.vo.BoardVO;
import com.campus.myapp.vo.PagingVO;

@Service
public interface AdminBoardDAO {

    public int totalRecord(PagingVO pVO);
    public List<BoardVO> reviewList(PagingVO pVO);
    public List<BoardVO> themeList(PagingVO pVO);
    public BoardVO getBoard(int no);
    public int boardWriteOk(BoardVO vo);
    public int themeEditOk(BoardVO vo);  
    public int boardDel(int no, String userid);
    public int boardMultiDel(BoardVO vo);
}
