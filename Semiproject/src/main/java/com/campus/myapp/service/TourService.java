package com.campus.myapp.service;

import java.util.List;

import com.campus.myapp.vo.PagingVO;
import com.campus.myapp.vo.tourVO;

public interface TourService {
	public List<tourVO> getList(PagingVO pVO);
	public int totalRecord(PagingVO pVO);
}
