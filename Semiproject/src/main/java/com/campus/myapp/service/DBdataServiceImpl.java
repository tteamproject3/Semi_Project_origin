package com.campus.myapp.service;

import java.util.List;

import javax.inject.Inject;
import org.springframework.stereotype.Service;
import com.campus.myapp.dao.DBdataDAO;
import com.campus.myapp.vo.FestivalVO;
import com.campus.myapp.vo.tourVO;


@Service
public class DBdataServiceImpl implements DBdataService {
	
	@Inject
	DBdataDAO dao;

	@Override
	public void inputdata(FestivalVO fVO) {
		// TODO Auto-generated method stub
		dao.inputdata(fVO);
	}

	@Override
	public void inputdataT(tourVO tVO) {
		// TODO Auto-generated method stub
		dao.inputdataT(tVO);
	}

	@Override
	public void deleteFDB() {
		// TODO Auto-generated method stub
		dao.deleteFDB();
	}

	@Override
	public void deleteTDB() {
		// TODO Auto-generated method stub
		dao.deleteTDB();
	}

	@Override
	public void updateFDB() {
		// TODO Auto-generated method stub
		dao.updateFDB();
	}

	@Override
	public void updateTDB() {
		// TODO Auto-generated method stub
		dao.updateTDB();
	}

	@Override
	public List<tourVO> GmapGo() {
		// TODO Auto-generated method stub
		return dao.GmapGo();
	}

	@Override
	public List<tourVO> getPdata(int num) {
		// TODO Auto-generated method stub
		return dao.getPdata(num);
	}





}
