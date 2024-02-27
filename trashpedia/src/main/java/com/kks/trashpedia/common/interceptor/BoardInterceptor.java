package com.kks.trashpedia.common.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class BoardInterceptor implements HandlerInterceptor {

	@Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        //현재 URL을 세션에 저장
        String currentUrl = request.getRequestURI(); 
       
        String contextPath = request.getContextPath();
        String url = currentUrl.substring(contextPath.length()  );
       
        request.getSession().setAttribute("lastUrl", url);
        return true;
    }
	
}
