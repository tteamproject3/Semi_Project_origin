package com.campus.myapp.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import com.campus.myapp.dao.AdminBoardDAO;
import com.campus.myapp.vo.BoardVO;
import com.campus.myapp.vo.FestivalVO;
import com.campus.myapp.vo.PagingVO;

@Service
public class AdminBoardServiceImpl implements AdminBoardService {
	@Inject
    AdminBoardDAO dao;

    @Override
    public List<FestivalVO> alist() {
    	List<FestivalVO> a =  dao.alist();
    	System.out.println(a);
        return  a;
    }

	@Override
	public List<FestivalVO> aaa() {
		// TODO Auto-generated method stub
		System.out.println(1111);
		List<FestivalVO> a =  dao.aaa();
    	System.out.println(a);
		return a;
	}

}
