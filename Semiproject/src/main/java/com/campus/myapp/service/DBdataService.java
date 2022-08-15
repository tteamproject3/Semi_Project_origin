package com.campus.myapp.service;

import com.campus.myapp.vo.FestivalVO;
import com.campus.myapp.vo.TourVO;

public interface DBdataService {
	public void inputdata(FestivalVO fVO);
	public void inputdataT(TourVO tVO);
	public void deleteFDB();
	public void deleteTDB();
	public void updateFDB();
	public void updateTDB();
}
