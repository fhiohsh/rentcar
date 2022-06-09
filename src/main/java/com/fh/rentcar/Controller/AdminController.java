package com.fh.rentcar.Controller;

import com.fh.rentcar.pojo.OrderDetail;
import com.fh.rentcar.service.OrderService;
import com.fh.rentcar.util.ImgCodeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.*;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private OrderService orderService;

    @RequestMapping("/ad")
    public String adminCenter(){
        String n = SecurityContextHolder.getContext().getAuthentication().getName();
        if(n.equals("anonymousUser")){
            System.out.println("登录鉴权未通过 用户名："+n);
            return "redirect:/admin/toLogin";
        }else{
            Collection<? extends GrantedAuthority> list = SecurityContextHolder.getContext().getAuthentication().getAuthorities();
            System.out.println("当前用户名"+n+"->已授予的权限"+list);
        }
        return "/admin/index";
    }
    @RequestMapping("/shoppage")
    public String adminShop(){
        return "/admin/shops";
    }
    @RequestMapping("/users")
    public String adminUser(){
        return "/admin/users";
    }
    @RequestMapping("/carmanage")
    public String adminCarManage(){
        return "/admin/carManage";
    }

    @RequestMapping("/orders")
    public String adminOrder(Model model){
        HashMap<String,Object> maps = new HashMap<String, Object>();
        List<OrderDetail> orderDetailList;
        orderDetailList = orderService.getAllOrderWith(maps);//空map
        //显示订单
        model.addAttribute("orderlist",orderDetailList);
        return "/admin/order";
    }

    /**
     * 后台登录
     */
    @RequestMapping("/toLogin")
    public String toLogin(){
        return "/admin/loginAdmin";
    }

    /**
     *  登录验证码
     */
    @RequestMapping("/passcode")
    @ResponseBody
    public void code(HttpServletRequest request, HttpServletResponse response) {
        ImgCodeUtil imageCode=new ImgCodeUtil();
        try {
            imageCode.code(request,response);
            HttpSession session= request.getSession();
            String c= (String) session.getAttribute("r_code");
            System.out.println("图片验证码====="+c);
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    @RequestMapping("/verifyCode")
    @ResponseBody
    public Map<String, Object> verifyCode(String code, HttpServletRequest request){
        HttpSession session= request.getSession();
        String c= (String) session.getAttribute("r_code");

        HashMap<String,Object> maps = new HashMap<String, Object>();
        String UperCode = code.toUpperCase();
        System.out.println("当前验证码:->"+UperCode);
//        System.out.println("大写转小写："+s.toLowerCase());
        if(UperCode.equals(c)){
            maps.put("result","1");
        }else {
            maps.put("result","0");
        }
        return maps;
    }

    //未登录错误权限提示
    @RequestMapping("/ToError")
    public String ToError(){
        return "admin/error";
    }

}
