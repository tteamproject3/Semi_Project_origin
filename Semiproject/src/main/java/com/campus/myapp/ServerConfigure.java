package com.campus.myapp;

import java.util.Arrays;
import java.util.List;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import com.campus.myapp.interceptor.LoginInterceptor;


@Configuration
public class ServerConfigure implements WebMvcConfigurer {
	//인터셉트가 처리될 매핑주소를 List 컬렉션으로 작성
	private static final List<String> URL_PATTERNS_L = Arrays.asList(

			"/mypage/mySavedList" ,"/mypage/myWriteList" , "/mypage/myCommentList",
			
			"/userboard/boardForm","/userboard/boardFormNotice" , "/userboard/boardFormOk",
			"/userboard/editForm","/userboard/editFormOk",
			"/userboard/boardDel","/userboard/multiDel",
			
			"/adminboard/themeList","/adminboard/themeView","/adminboard/themeEdit","/adminboard/themeForm"

			);
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(new LoginInterceptor()).addPathPatterns(URL_PATTERNS_L);
	}
	
	
}
