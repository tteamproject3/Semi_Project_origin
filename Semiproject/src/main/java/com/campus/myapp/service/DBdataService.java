package com.campus.myapp.service;

import java.util.List;

import org.springframework.web.bind.annotation.RequestParam;

import com.campus.myapp.vo.FestivalVO;
import com.campus.myapp.vo.TourVO;

public interface DBdataService {
	public void inputdata(FestivalVO fVO);
	public void inputdataT(TourVO tVO);
	public void deleteFDB();
	public void deleteTDB();
	public void updateFDB();
	public void updateTDB();
	public List<TourVO> GmapGo();
	public List<TourVO> getPdata(int num);
	public List<TourVO> getLI(String la, String lon);
}
