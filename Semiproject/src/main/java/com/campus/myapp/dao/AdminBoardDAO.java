package com.campus.myapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import com.campus.myapp.vo.BoardVO;
import com.campus.myapp.vo.FestivalVO;
import com.campus.myapp.vo.PagingVO;
import com.campus.myapp.vo.tourVO;

@Service
@Mapper
@Repository
public interface AdminBoardDAO {

    public int totalRecord(PagingVO pVO);
    public List<BoardVO> reviewList(PagingVO pVO);
    public List<BoardVO> themeList(PagingVO pVO);
    public BoardVO getBoard(int no);
    public int boardWriteOk(BoardVO vo);
    public int themeEditOk(BoardVO vo);  
    public int boardDel(int no, String userid);
    public int boardMultiDel(BoardVO vo);
    public List<FestivalVO> festivalList();
    public List<tourVO> tourList();
}
