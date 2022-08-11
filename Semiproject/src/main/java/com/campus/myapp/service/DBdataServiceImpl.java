package com.campus.myapp.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.campus.myapp.dao.DBdataDAO;
import com.campus.myapp.vo.FestivalVO;


@Service
public class DBdataServiceImpl implements DBdataService {
	
	@Inject
	DBdataDAO dao;

	@Override
	public void inputdata(FestivalVO fVO) {
		// TODO Auto-generated method stub
		dao.inputdata(fVO);
	}

}
