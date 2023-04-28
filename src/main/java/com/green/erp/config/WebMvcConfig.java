package com.green.erp.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.green.erp.handler.BoardIntercepter;
import com.green.erp.handler.NoticeIntercepter;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer{
	
	@Autowired
	private NoticeIntercepter noticeIntercepter;
	@Autowired
	private BoardIntercepter boardIntercepter;
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(noticeIntercepter)
				.addPathPatterns("/notice/**");  // 1. path 더 추가 하능 방법
		// 인터 셉터 등록 
		//registry.addInterceptor(new AdminInterceptor()) // 2. 인터셉터 등록 방법 
		registry.addInterceptor(boardIntercepter)
				.addPathPatterns("/board/**");
	}
}
