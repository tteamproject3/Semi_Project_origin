package com.novicecoders.ontheway.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.novicecoders.ontheway.dao.DAO;

@Service
public class as implements com.novicecoders.ontheway.service.Service {
	@Inject
	DAO dao;

}