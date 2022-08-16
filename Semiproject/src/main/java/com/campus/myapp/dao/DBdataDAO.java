package com.campus.myapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import com.campus.myapp.vo.FestivalVO;
import com.campus.myapp.vo.tourVO;

@Mapper
@Repository
public interface DBdataDAO {
	public void inputdata(FestivalVO fVO);
	public void inputdataT(tourVO tVO);
	public void deleteFDB();
	public void deleteTDB();
	public void updateFDB();
	public void updateTDB();
	public List<tourVO> GmapGo();
	public List<tourVO> getPdata(int num);
	public List<tourVO> getLI(String la, String lon);
	public List<FestivalVO> gmapGo2(String a, String b);
	public List<FestivalVO> getPdata2(int num);
	public List<FestivalVO> getLI2(String la, String lon, String a, String b);
}
