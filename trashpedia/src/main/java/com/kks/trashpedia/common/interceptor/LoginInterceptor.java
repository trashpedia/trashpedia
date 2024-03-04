package com.kks.trashpedia.common.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class LoginInterceptor implements HandlerInterceptor {

	@Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String currentUrl = request.getRequestURI(); 
       
        String contextPath = request.getContextPath();
        String url = currentUrl.substring(contextPath.length()  );
       
        request.getSession().setAttribute("lastUrl", url);
        return true;
    }
	
}
