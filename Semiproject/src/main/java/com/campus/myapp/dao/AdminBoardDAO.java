package com.campus.myapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import com.campus.myapp.vo.FestivalVO;


@Mapper
@Repository
public interface AdminBoardDAO {


    public List<FestivalVO> alist();
    public List<FestivalVO> aaa();
}
