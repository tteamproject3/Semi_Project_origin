package com.campus.myapp.service;

import java.util.List;

import com.campus.myapp.vo.FestivalVO;
import com.campus.myapp.vo.tourVO;

public interface DBdataService {
	public void inputdata(FestivalVO fVO);
	public void inputdataT(tourVO tVO);
	public void deleteFDB();
	public void deleteTDB();
	public void updateFDB();
	public void updateTDB();
}
