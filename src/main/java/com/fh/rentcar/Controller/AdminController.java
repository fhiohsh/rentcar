package com.fh.rentcar.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @RequestMapping("/ad")
    public String adminCenter(){
        return "admin/index";
    }
    @RequestMapping("/shoppage")
    public String adminShop(){
        return "admin/shops";
    }
    @RequestMapping("/users")
    public String adminUser(){
        return "admin/users";
    }
    @RequestMapping("/orders")
    public String adminOrder(){
        return "admin/order";
    }

    @RequestMapping("/carmanage")
    public String adminCarManage(){
        return "admin/carManage";
    }
}
