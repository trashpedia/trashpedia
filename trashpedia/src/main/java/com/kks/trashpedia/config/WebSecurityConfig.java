package com.kks.trashpedia.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

import com.kks.trashpedia.auth.filter.JwtFilter;
import com.kks.trashpedia.auth.model.jwt.JwtTokenProvider;

import lombok.RequiredArgsConstructor;

@Configuration
@EnableWebSecurity
@RequiredArgsConstructor
public class WebSecurityConfig {
	
	private final JwtTokenProvider jwtProvider;
	
	@Bean
	public PasswordEncoder passwordEncoder() {
		PasswordEncoder encoder = new BCryptPasswordEncoder();
		return encoder;
	}
	
	@Bean
	public SecurityFilterChain filterChain(HttpSecurity http) throws Exception{
		http
		.csrf( (csrf) -> csrf.disable())
		.authorizeHttpRequests( (authorizeReq) -> 
			authorizeReq
			.requestMatchers("/**").permitAll()
			//.requestMatchers("/login").permitAll()
			//.requestMatchers("/pledge/updateComment/**").permitAll()
//			.requestMatchers("/**").hasRole("USER") // 그외 URL은 이용하려면 USER권한이 필요함을 의미. 
			.requestMatchers("/admin/**").hasRole("ADMIN")
			.anyRequest().authenticated()
			//.anyRequest().anonymous()
		);
		//.addFilterBefore( new JwtFilter(jwtProvider) , UsernamePasswordAuthenticationFilter.class);
		return http.build();
	}
}
