package com.campus.myapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	@RequestMapping("/")
	public String home() {
		return "index";
	}

	@RequestMapping("/home/term")
	public String term() {
		return "home/term";
	}
	
	@RequestMapping("/home/aboutus")
	public String aboutus() {
		return "home/aboutus";
	}
	@RequestMapping("/home/policy")
	public String policy() {
		return "home/policy";
	}
}
