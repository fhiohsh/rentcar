package com.fh.rentcar.config;

import com.alibaba.fastjson.JSON;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@Component
public class MyAccessDeniedHandler implements AccessDeniedHandler {
    @Override
    public void handle(HttpServletRequest request, HttpServletResponse response, AccessDeniedException accessDeniedException) throws IOException, ServletException {
        System.out.println(accessDeniedException.getMessage());
//        String ks = "<div style='margin:0 auto;'><h1>没有访问权限噢！点击<a href='/logout'>退出</a></h1></div>";
////        <script>alert("+jsonString+");window.location.href ='/admin/toLogin'</script>
//        response.setCharacterEncoding("UTF-8");
//        response.setContentType("text/html; charset=utf-8");
//        PrintWriter out = response.getWriter();
//        out.print(ks);

//        request.setAttribute("errors",accessDeniedException.getMessage());
        response.sendRedirect("/admin/ToError");//没有权限访问时的通知

    }
}
