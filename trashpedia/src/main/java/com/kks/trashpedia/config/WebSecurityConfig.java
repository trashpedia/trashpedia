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
//			.requestMatchers("/admin/**").hasRole("ADMIN")
//			.requestMatchers("/write/**").hasAnyRole("USER,ADMIN")
//			.requestMatchers("/update/**").hasAnyRole("USER,ADMIN")
//			.requestMatchers("/board/delete/**").hasAnyRole("USER,ADMIN")
//			.requestMatchers("/board/insert").hasAnyRole("USER,ADMIN")
//			.requestMatchers("/board/insertNC").hasAnyRole("USER,ADMIN")
//			.requestMatchers("/board/deleteNC/**").hasAnyRole("USER,ADMIN")
//			.requestMatchers("/information/delete/**").hasAnyRole("USER,ADMIN")
//			.requestMatchers("/member/update.me").hasRole("USER")
//			.requestMatchers("/member/pwdAuth.me").hasRole("USER")
//			.requestMatchers("/pledge/modify").hasAnyRole("USER,ADMIN")
//			.requestMatchers("/pledge/delete/**").hasAnyRole("USER,ADMIN")
//			.requestMatchers("/pledge/insertComment").hasAnyRole("USER,ADMIN")
//			.requestMatchers("/pledge/updateComment/**").hasAnyRole("USER,ADMIN")
//			.requestMatchers("/pledge/deleteComment/**").hasAnyRole("USER,ADMIN")
//			.requestMatchers("/pledge/insertSignature").hasRole("USER")
//			.requestMatchers("/report/**").hasAnyRole("USER,ADMIN")
//			.requestMatchers("/trash/request/**").hasAnyRole("USER,ADMIN")
//			.requestMatchers("/trash/**").permitAll()
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