package com.campus.myapp.service;

import java.util.List;

import com.campus.myapp.vo.FestivalVO;
import com.campus.myapp.vo.PagingVO;

public interface FestivalService {
	public List<FestivalVO> getFestivalList();
	
	//관리자
	public List<FestivalVO> getList(PagingVO pVO);
	public int totalRecord(PagingVO pVO);
}
