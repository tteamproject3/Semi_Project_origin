package com.campus.myapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.campus.myapp.vo.PagingVO;
import com.campus.myapp.vo.TourVO;

@Mapper
@Repository
public interface TourDAO {

	public List<TourVO> getList(PagingVO pVO);
	public int totalRecord(PagingVO pVO);
}
