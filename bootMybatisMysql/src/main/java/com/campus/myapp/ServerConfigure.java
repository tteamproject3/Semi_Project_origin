package com.campus.myapp;

import java.util.Arrays;
import java.util.List;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.campus.myapp.interceptor.LoginInterceptor;

//InterceptorRegistry 이폴더이랑
//지금 이파일은 다른주소로 가더라도 로그인 상태가 아니면 로그인창을 띄우는 것 이라네요

@Configuration
public class ServerConfigure implements WebMvcConfigurer {
	private static final List<String> URL_PATTERNS = Arrays.asList(
			"/member/memberEdit",
			"/board/boardForm",
			"/member/memberEditOk",
			"/board/boardForm",
			"/board/boardFormOk",
			"/board/boardEdit/*",
			"/board/boardEditOk",
			"/board/multiDel",
			"/data/dataWrite",
			"/data/dataWrtieOk",
			"/data/dataEditForm1/*",
			"/data/dataEditFormOk",
			"/data/dataDel"
			
			);

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(new LoginInterceptor()).addPathPatterns(URL_PATTERNS);
	}
}
