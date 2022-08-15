package com.campus.myapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.campus.myapp.vo.PagingVO;
import com.campus.myapp.vo.tourVO;

@Mapper
@Repository
public interface TourDAO {

	public List<tourVO> getList(PagingVO pVO);
	public int totalRecord(PagingVO pVO);
}
