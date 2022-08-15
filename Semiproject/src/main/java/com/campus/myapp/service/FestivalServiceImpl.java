package com.campus.myapp.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.campus.myapp.dao.FestivalDAO;

@Service
public class FestivalServiceImpl implements FestivalService {
	@Inject
	FestivalDAO dao;
}
