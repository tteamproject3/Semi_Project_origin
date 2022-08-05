package com.campus.myapp.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.campus.myapp.dao.DataDAO;
import com.campus.myapp.vo.DataVO;

@Service
public class DataServiceImpl implements DataService {
	
	@Inject
	DataDAO dao;

	@Override
	public List<DataVO> dataAllSelect() {
		return dao.dataAllSelect();
	}

	@Override
	public int dataInsert(DataVO vo) {
		// TODO Auto-generated method stub
		return dao.dataInsert(vo);
	}

	@Override
	public int downCountUpdate(int no) {
		// TODO Auto-generated method stub
		return dao.downCountUpdate(no);
	}

	@Override
	public int newDownCount(int no) {
		// TODO Auto-generated method stub
		return dao.newDownCount(no);
	}

	@Override
	public int hitCount(int no) {
		// TODO Auto-generated method stub
		return dao.hitCount(no);
	}

	@Override
	public DataVO dataSelect(int no) {
		// TODO Auto-generated method stub
		return dao.dataSelect(no);
	}

	@Override
	public DataVO getFilenames(int no) {
		// TODO Auto-generated method stub
		return dao.getFilenames(no);
	}

	@Override
	public int dataUpdate(DataVO vo) {
		// TODO Auto-generated method stub
		return dao.dataUpdate(vo);
	}

	@Override
	public int dataDelete(int no, String userid) {
		// TODO Auto-generated method stub
		return dao.dataDelete(no, userid);
	}

}
