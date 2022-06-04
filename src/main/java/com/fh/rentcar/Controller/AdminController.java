package com.fh.rentcar.Controller;

import com.fh.rentcar.pojo.OrderDetail;
import com.fh.rentcar.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private OrderService orderService;


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
    public String adminOrder(Model model){
        HashMap<String,Object> maps = new HashMap<String, Object>();
        List<OrderDetail> orderDetailList;
        orderDetailList = orderService.getAllOrderWith(maps);//空map
        //显示订单
        model.addAttribute("orderlist",orderDetailList);
        return "admin/order";
    }

    @RequestMapping("/carmanage")
    public String adminCarManage(){
        return "admin/carManage";
    }
}
