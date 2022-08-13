package com.campus.myapp.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.campus.myapp.vo.FestivalVO;

@Mapper
@Repository
public interface DBdataDAO {
	public void inputdata(FestivalVO fVO);
}
