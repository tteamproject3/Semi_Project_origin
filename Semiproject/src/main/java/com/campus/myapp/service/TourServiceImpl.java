package com.campus.myapp.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.campus.myapp.dao.TourDAO;
import com.campus.myapp.vo.PagingVO;
import com.campus.myapp.vo.TourVO;

@Service
public class TourServiceImpl implements TourService {

	@Inject
	TourDAO dao;
	
	@Override
	public List<TourVO> getList(PagingVO pVO) {
		return dao.getList(pVO);
	}

	@Override
	public int totalRecord(PagingVO pVO) {
		return dao.totalRecord(pVO);
	}

}
