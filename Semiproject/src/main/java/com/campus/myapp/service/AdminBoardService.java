package com.campus.myapp.service;

import java.util.List;

import org.springframework.stereotype.Repository;
import com.campus.myapp.vo.BoardVO;
import com.campus.myapp.vo.FestivalVO;
import com.campus.myapp.vo.PagingVO;


public interface AdminBoardService {

    public List<FestivalVO> alist();
    public List<FestivalVO> aaa();
}

