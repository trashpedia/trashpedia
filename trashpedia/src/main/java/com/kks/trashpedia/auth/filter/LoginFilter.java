package com.kks.trashpedia.auth.filter;

import java.io.IOException;
import java.util.List;

import org.springframework.http.server.ServerHttpRequest;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.util.StringUtils;

import com.kks.trashpedia.member.model.vo.Member;

import jakarta.servlet.FilterChain;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
public class LoginFilter extends UsernamePasswordAuthenticationFilter{
	
	private final AuthenticationManager authenticationManager;
	
	@Override
	public Authentication attemptAuthentication(HttpServletRequest request, HttpServletResponse response) {
		String userEmail = obtainUsername(request);
		String userPwd = obtainPassword(request);
		UsernamePasswordAuthenticationToken authToken = new UsernamePasswordAuthenticationToken(userEmail, userPwd, null);
		
		return authenticationManager.authenticate(authToken);
	}
	
	@Override
    protected void successfulAuthentication(HttpServletRequest request, HttpServletResponse response, FilterChain chain, Authentication authentication) {
		Member o = (Member)authentication.getPrincipal();
		new Member();
		Member m = Member.builder()
				.userNo(o.getUserNo())
				.role(o.getRole())
				.userEmail(o.getUserEmail())
				.userName(o.getUserName())
				.userNickname(o.getUserNickname())
				.point(o.getPoint())
				.build();
		try {
			String currentUrl = request.getRequestURI(); 
	        String contextPath = request.getContextPath();
	        String url = currentUrl.substring(contextPath.length());
	        System.out.println("currentUrl : "+currentUrl);
	        System.out.println("contextPath : "+contextPath);
	        System.out.println("url : "+url);
			request.getSession().setAttribute("authentication", m);
			response.sendRedirect(request.getContextPath()+"/");
		} catch (IOException e) {
			e.printStackTrace();
		}
    }
	
	@Override
    protected void unsuccessfulAuthentication(HttpServletRequest request, HttpServletResponse response, AuthenticationException failed) {
		try {
			response.sendRedirect(request.getContextPath()+"/login");
			request.getSession().setAttribute("alert", "로그인에 실패했습니다. 다시 시도해주세요");
		} catch (IOException e) {
			e.printStackTrace();
		}
    }
}