package com.fh.rentcar.config;

import com.fh.rentcar.mapper.UserMapper;
import com.fh.rentcar.service.imp.UserAuthService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import javax.annotation.Resource;

@EnableWebSecurity
public class WebConfig extends WebSecurityConfigurerAdapter {
    @Autowired
    UserAuthService userAuthService;
    @Resource
    private MyAccessDeniedHandler myAccessDeniedHandler;
    @Resource
    private MyAuthenticationEntryPoint myAuthenticationEntryPoint;
    @Bean
    PasswordEncoder passwordEncoder(){
        return new BCryptPasswordEncoder();
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                //关闭csrf
                .csrf().disable()
                .authorizeRequests()
                .antMatchers("/statics/**","/mgestyle/**").permitAll()
                .antMatchers("/","/a","/user/**","/cars/**","/shopIn/**",
                        "/orders/**","/admin/toLogin","/admin/passcode/**","/admin/ad","/admin/verifyCode/**","/admin/ToError").permitAll()
                //放行.antMatchers("/admin/**").hasRole("dba")
                // 权限  授予权限 该角色访问时必须拥有对应的权限
                .antMatchers("/admin/shoppage","/admin/carmanage").hasRole("v1")
                .antMatchers("/admin/orders","/admin/users").hasRole("dba")
                .anyRequest().authenticated();
        http
                .formLogin()
                .loginPage("/admin/toLogin")
                .loginProcessingUrl("/login")//允许的登录请求
                .and()
                .logout().logoutSuccessUrl("/admin/toLogin")//返回的页面
                .and()
                .rememberMe()
                .and()
                .exceptionHandling()
                .accessDeniedHandler(myAccessDeniedHandler)
                .authenticationEntryPoint(myAuthenticationEntryPoint);

//        http.headers().frameOptions().sameOrigin();
        http.headers().frameOptions().sameOrigin();//解除iframe限制
    }
    /**
     * 身份认证接口
     */
    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userAuthService);
    }
}
