package com.campus.myapp.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.campus.myapp.dao.FestivalDAO;
import com.campus.myapp.vo.FestivalVO;

@Service
public class FestivalServiceImpl implements FestivalService {
	@Inject
	FestivalDAO dao;

	@Override
	public List<FestivalVO> getFestivalList() {
		return dao.getFestivalList();
	}
}
