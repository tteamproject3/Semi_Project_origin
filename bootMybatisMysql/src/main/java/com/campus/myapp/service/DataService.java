package com.campus.myapp.service;

import java.util.List;

import com.campus.myapp.vo.DataVO;

public interface DataService {
	public List<DataVO> dataAllSelect();
	public int dataInsert(DataVO vo);
	public int downCountUpdate(int no);
	//증가한 다운로드 횟수를 다시 받아옴
	public int newDownCount(int no);//새로운 다운로드 회수 선택하기
	
	public int hitCount(int no); // 조회수 증가
	public DataVO dataSelect(int no);
	public DataVO getFilenames(int no);
	public int dataUpdate(DataVO vo);
	public int dataDelete(int no, String userid);
}
