package com.campus.myapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.campus.myapp.vo.DataVO;

@Mapper
@Repository
public interface DataDAO {
	
public List<DataVO> dataAllSelect();//글목록
public int dataInsert(DataVO vo);
//다운로드 증가
public int downCountUpdate(int no);
//증가한 다운로드 횟수를 다시 받아옴
public int newDownCount(int no);//새로운 다운로드 회수 선택하기
public int hitCount(int no); // 조회수 증가
public DataVO dataSelect(int no);
//db에 있는 파일명을 선택
public DataVO getFilenames(int no);
public int dataUpdate(DataVO vo);
public int dataDelete(int no, String userid);
}
