package com.campus.myapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.campus.myapp.vo.FestivalVO;

@Mapper
@Repository
public interface FestivalDAO {
	
	//축제 정보 불러오기
	public List<FestivalVO> getFestivalList();
}
