package com.campus.myapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.campus.myapp.vo.BoardVO;
import com.campus.myapp.vo.PagingVO;

@Mapper
@Repository
public interface BoardDAO {
	public List<BoardVO> boardList(PagingVO pVO);
	public int totalRecord(PagingVO pVO);
}
