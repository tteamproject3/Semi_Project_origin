package com.campus.myapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import com.campus.myapp.vo.FestivalVO;
import com.campus.myapp.vo.TourVO;

@Mapper
@Repository
public interface DBdataDAO {
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
