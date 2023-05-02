package com.green.erp.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.green.erp.handler.BoardIntercepter;
import com.green.erp.handler.AdminIntercepter;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer{
	
	@Autowired
	private AdminIntercepter adminIntercepter;
	@Autowired
	private BoardIntercepter boardIntercepter;
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(adminIntercepter)
				.addPathPatterns("/notice/post")
				.addPathPatterns("/notice/update")
				.addPathPatterns("/notice/write");
		// 인터 셉터 등록 
		//registry.addInterceptor(new AdminInterceptor()) // 2. 인터셉터 등록 방법 
		registry.addInterceptor(boardIntercepter)
				.addPathPatterns("/board/**");
		// 인터셉터 내용이 같아서 noticeIntercepter 사용
		registry.addInterceptor(adminIntercepter)
				.addPathPatterns("/erp/adminpage/**")
				.addPathPatterns("/erp/signUp/**");
	}
	
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/admin/privacy/**")
                .addResourceLocations("file:///C:\\Users\\GGG\\Desktop\\새 폴더/");
    }
}
