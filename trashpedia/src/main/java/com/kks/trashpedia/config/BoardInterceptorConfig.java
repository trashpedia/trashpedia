package com.kks.trashpedia.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import com.kks.trashpedia.common.interceptor.BoardInterceptor;

@Configuration
public class BoardInterceptorConfig implements WebMvcConfigurer{

	  @Override
	    public void addInterceptors(InterceptorRegistry registry) {
		  
		  	//BoardInterceptor 등록 - 파일 수정/등록 시 사용
	        registry.addInterceptor(new BoardInterceptor())
	                .addPathPatterns("/trash/**")
	                .addPathPatterns("/board/**")
	                .addPathPatterns("/pledge/**")
	                .addPathPatterns("/information/**");
	    }
}
