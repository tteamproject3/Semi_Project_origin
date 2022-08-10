package com.campus.myapp.controller;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.campus.myapp.service.BoardService;

@RestController
@RequestMapping("/board/*")
public class BoardController {
    @Inject
    BoardService service;
    
	ModelAndView mav = null;
}
