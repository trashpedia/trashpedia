package com.kks.trashpedia.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

import com.kks.trashpedia.auth.filter.LoginFilter;

import lombok.RequiredArgsConstructor;

@Configuration
@EnableWebSecurity
@RequiredArgsConstructor
public class WebSecurityConfig {

	private final AuthenticationConfiguration authenticationConfiguration;
	private final UserDetailsService userDetailsService;
	
	@Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
	
	@Bean
	public SecurityFilterChain filterChain(HttpSecurity http) throws Exception{
	http
		.csrf( (csrf) -> csrf.disable())
		.formLogin((auth) -> auth.disable())
		.httpBasic((auth) -> auth.disable())
		.authorizeHttpRequests((auth) -> auth
//				.requestMatchers("/admin/**").hasAuthority("ROLE_ADMIN")
//				.requestMatchers("/write/**").hasAnyAuthority("ROLE_USER,ROLE_ADMIN")
//				.requestMatchers("/update/**").hasAnyAuthority("USER,ADMIN")
//				.requestMatchers("/board/delete/**").hasAnyAuthority("USER,ADMIN")
//				.requestMatchers("/board/insert").hasAnyAuthority("USER,ADMIN")
//				.requestMatchers("/board/insertNC").hasAnyAuthority("USER,ADMIN")
//				.requestMatchers("/board/deleteNC/**").hasAnyAuthority("USER,ADMIN")
//				.requestMatchers("/information/delete/**").hasAnyAuthority("USER,ADMIN")
//				.requestMatchers("/member/update.me").hasAuthority("USER")
//				.requestMatchers("/member/pwdAuth.me").hasAuthority("USER")
//				.requestMatchers("/pledge/modify").hasAnyAuthority("USER,ADMIN")
//				.requestMatchers("/pledge/delete/**").hasAnyAuthority("USER,ADMIN")
//				.requestMatchers("/pledge/insertComment").hasAnyAuthority("USER,ADMIN")
//				.requestMatchers("/pledge/updateComment/**").hasAnyAuthority("USER,ADMIN")
//				.requestMatchers("/pledge/deleteComment/**").hasAnyAuthority("USER,ADMIN")
//				.requestMatchers("/pledge/insertSignature").hasAuthority("USER")
//				.requestMatchers("/report/**").hasAnyAuthority("USER,ADMIN")
//				.requestMatchers("/trash/list").hasAnyAuthority("USER,ADMIN")
//				.requestMatchers("/trash/detail/**").hasAnyAuthority("USER,ADMIN")
//				.requestMatchers("/trash/request/**").hasAnyAuthority("USER,ADMIN")
//				.requestMatchers("/trash/**").hasAuthority("ADMIN")
				.anyRequest().permitAll())
		.logout((logout) -> logout
				.logoutUrl("/logout")
				.logoutSuccessUrl("/")
				.invalidateHttpSession(true)
				.deleteCookies("JSESSIONID"));
	 http
     	.addFilterAt(new LoginFilter(authenticationManager(authenticationConfiguration)), UsernamePasswordAuthenticationFilter.class);
		return http.build();
	}
	
	@Bean
    public DaoAuthenticationProvider daoAuthenticationProvider() {
        DaoAuthenticationProvider provider = new DaoAuthenticationProvider();
        provider.setUserDetailsService(userDetailsService);
        provider.setPasswordEncoder(passwordEncoder());
        return provider;
    }
	
	@Bean
    AuthenticationManager authenticationManager(AuthenticationConfiguration authenticationConfiguration) throws Exception {
        return authenticationConfiguration.getAuthenticationManager();
    }
}