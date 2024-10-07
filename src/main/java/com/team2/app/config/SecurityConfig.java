package com.team2.app.config;

import java.net.URLEncoder;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import com.team2.app.config.security.LoginFailureHandler;
import com.team2.app.config.security.LoginSuccessHandler;
import com.team2.app.config.security.OutSuccessHandler;

import lombok.extern.slf4j.Slf4j;

@Configuration
@EnableWebSecurity
@Slf4j
public class SecurityConfig {
	
	@Autowired
	LoginSuccessHandler loginSuccessHandler;
	
	@Autowired
	LoginFailureHandler loginFailureHandler;
	
	@Autowired
	OutSuccessHandler outSuccessHandler;
	
	@Bean
	WebSecurityCustomizer webSecurityCustomizer() throws Exception {
		
		return web -> web
						.ignoring()
							.requestMatchers("/resources/**"); // front자원에 대한 요청 분리

	}
	
	@Bean
	SecurityFilterChain securityFilterChain(HttpSecurity security) throws Exception {
		
		
		security
			.cors()
			.and()
			.csrf()
			.disable();
		
		security
			.authorizeHttpRequests(
					(authorizeRequests)->
						authorizeRequests
							.requestMatchers("/").permitAll()
							.requestMatchers("/employee/mypage").authenticated()
							.requestMatchers("/employee/delete").hasAnyRole("OWNER","PERSONEL")
//							.requestMatchers("/notice/*").hasRole("OWNER")
							.anyRequest().permitAll()
					)
			.formLogin(
					(login)->
						login
							.loginPage("/employee/login")
							.successHandler(loginSuccessHandler)
							.failureHandler(loginFailureHandler)
							.usernameParameter("empNum")
							.passwordParameter("empPwd")
							.permitAll()
					)
			.logout(
					(logout)->
						logout
							.logoutRequestMatcher(new AntPathRequestMatcher("/employee/logout"))
							.logoutSuccessHandler(outSuccessHandler)
							.invalidateHttpSession(true)
					);
			
		
		return security.build();
	}
	
	
	//PasswordEncoder 객체
	@Bean
	PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}

}
