package com.fh.rentcar.Controller;

import com.fh.rentcar.pojo.Cars;
import com.fh.rentcar.pojo.OrderDetail;
import com.fh.rentcar.pojo.Shops;
import com.fh.rentcar.service.CarsService;
import com.fh.rentcar.service.CityService;
import com.fh.rentcar.service.OrderService;
import com.fh.rentcar.service.ShopService;
import com.fh.rentcar.util.TimeFormats;
import com.fh.rentcar.util.codeShift;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@Controller
public class OrderController {
    @Autowired
    private CityService cityService;
    @Autowired
    private CarsService carsService;
    @Autowired
    private ShopService shopService;
    @Autowired
    private OrderService orderService;


    OrderDetail orderDetails=null;

    @RequestMapping("/orderforit")
    @ResponseBody
    public String jumpsuc(){
        return "Success";
    }

    @RequestMapping("/topay")
    public String payFor(){
        return "payfor";
    }
    @RequestMapping("/paysuccess")
    public String paySuc(){
        return "paysuccess";
    }


    @PostMapping("/Order/SecondStep")
    public String orderSecond(OrderDetail orderDetail, Model model){
        Shops shops = shopService.getShopById(orderDetail.getShop_id());
        Cars cars = carsService.getCarByCarId(orderDetail.getCar_id());
        orderDetail.setShop(shops);
        orderDetail.setCar(cars);
        orderDetail.setPickcartime(orderDetail.getPickcartime());
        orderDetail.setRenttime(orderDetail.getRenttime());
        orderDetail.setReturncartime(orderDetail.getReturncartime());
        orderDetails = orderDetail;
        model.addAttribute("ordetails",orderDetail);
        return "payfor";
    }
    @RequestMapping("/Order/addorder")
    public String addOrder(OrderDetail order){
        if(orderDetails == null){
            System.err.println("对象为空，异常哟");
        }else{
            orderDetails.setUid(order.getUid());
            orderDetails.setPickaddress(order.getPickaddress());
            orderDetails.setOrderstatus(order.getOrderstatus());
            orderDetails.setOrdertime(TimeFormats.datetime());
            orderService.addOrder(orderDetails);
        }
        return "paysuccess";
    }


    //订单合同照片保存
    @RequestMapping("/tbase")
    @ResponseBody
    public String tbase(String bases,String orderId,String uid) throws IOException {
        System.out.println(bases);
        //保存照片
        codeShift.base64To(bases,orderId+uid);
        //上传图片to数据库
        HashMap<String,Object> maps = new HashMap<>();
        maps.put("id",orderId);
        maps.put("uid",uid);
        maps.put("contractimg",orderId+uid);
        orderService.updateOrder(maps);
        return "ok";
    }
}
