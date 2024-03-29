package com.campus.myapp.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.campus.myapp.dao.FestivalDAO;
import com.campus.myapp.vo.FestivalVO;
import com.campus.myapp.vo.PagingVO;

@Service
public class FestivalServiceImpl implements FestivalService {
	@Inject
	FestivalDAO dao;

	@Override
	public List<FestivalVO> getFestivalList() {
		return dao.getFestivalList();
	}

	@Override
	public List<FestivalVO> getList(PagingVO pVO) {
		return dao.getList(pVO);
	}

	@Override
	public int totalRecord(PagingVO pVO) {
		return dao.totalRecord(pVO);
	}
}
