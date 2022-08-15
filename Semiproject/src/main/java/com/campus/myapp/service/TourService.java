package com.campus.myapp.service;

import java.util.List;

import com.campus.myapp.vo.PagingVO;
import com.campus.myapp.vo.TourVO;

public interface TourService {
	public List<TourVO> getList(PagingVO pVO);
	public int totalRecord(PagingVO pVO);
}
