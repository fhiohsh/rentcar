package com.fh.rentcar.config;

import com.alibaba.fastjson.JSON;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.AuthenticationEntryPoint;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
@Component
public class MyAuthenticationEntryPoint implements AuthenticationEntryPoint {
    /**
     * 用户未登录异常通知
     * @param request
     * @param response
     * @param authException
     * @throws IOException
     * @throws ServletException
     */
    @Override
    public void commence(HttpServletRequest request, HttpServletResponse response, AuthenticationException authException) throws IOException, ServletException {
        String jsonString = JSON.toJSONString("请您登录！");
        String ks = "<div style='margin:0 auto;'><h1>您还未登录，权限不足！点击<a href='/admin/toLogin'>登录</a></h1></div>";
//        <script>alert("+jsonString+");window.location.href ='/admin/toLogin'</script>
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=utf-8");
        PrintWriter out = response.getWriter();
        out.print(ks);
    }
}
