package com.novicecoders.ontheway.controller;


import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping("/main/*")
public class MainController {
	
	@GetMapping("maps")
	public ModelAndView maps() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("main/googleMaps");
		return mav; // 파일명
	}
}
