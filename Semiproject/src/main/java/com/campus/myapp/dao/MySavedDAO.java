package com.campus.myapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.campus.myapp.vo.MySavedVO;
import com.campus.myapp.vo.PagingVO;
import com.campus.myapp.vo.PostVO;

@Mapper
@Repository
public interface MySavedDAO {

	public int postWriteOk(PostVO vo);
	
	public int postAddOk(MySavedVO vo);
	
	
	//레코드 수
	public int totalRecord(PagingVO pVO);
	//글목록 가져오기 
	public List<MySavedVO> boardList(PagingVO pVO);
	
	
	
}
