package com.fh.rentcar.Controller;

import com.fh.rentcar.pojo.*;
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

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.ParseException;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
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

    OrderDetail orderDetails = new OrderDetail();

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

    /**
     * 保存订单对象
     * @param orderDetail
     * @param model
     * @return
     */
    @PostMapping("/Order/SecondStep")
    public String orderSecond(OrderDetail orderDetail, Model model){
        orderDetails = null;
        Shops shops = shopService.getShopById(orderDetail.getShop_id());
        Cars cars = carsService.getCarByCarId(orderDetail.getCar_id());

        int price = Integer.parseInt(orderDetail.getRentprice());
        int days = Integer.parseInt(orderDetail.getRenttime());
        String rentprice = String.valueOf(price * days);
        orderDetail.setTotalprice(rentprice);
        orderDetail.setShop(shops);
        orderDetail.setCar(cars);

        orderDetail.setPickcartime(orderDetail.getPickcartime());
        orderDetail.setRenttime(orderDetail.getRenttime());
        orderDetail.setReturncartime(orderDetail.getReturncartime());

        orderDetails = orderDetail;
        model.addAttribute("ordetails",orderDetail);
        return "payfor";
    }
    /**
     *  增加订单
     */
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
            //修改车辆状态
            Cars cars = new Cars();
            cars.setId(orderDetails.getCar_id());
            cars.setRentstatus(2);
            carsService.updateCarStatus(cars);
        }
        return "paysuccess";
    }
    /**
     * 查看订单
     */
    @RequestMapping("/user/usercenters/{uid}")
    public String userOrders(Model model, @PathVariable("uid") int uid, HttpSession session){
        HashMap<String,Object> maps = new HashMap<String, Object>();
        User us = (User) session.getAttribute("user");
        System.out.println(uid);
        System.out.println(us.getId());
        if(uid != us.getId()){
            return "/error";
        }else{
            maps.put("uid",uid);
            List<OrderDetail> orderDetailList;
            orderDetailList = orderService.getAllOrderWith(maps);
            model.addAttribute("orderList",orderDetailList);
        }
        return "usercenter";
    }

    /**
     * 取消订单 + 订单结算
     */
    @RequestMapping("/user/Cancel")
    @ResponseBody
    public Map<String, Object> CancelOrder(String fg,String orderId,String uid,String carId){
        //订单取消1 超时0  车辆1 可租 2 已租   还车后4 后台确定5
        HashMap<String,Object> maps = new HashMap<>();
        maps.put("id",orderId);
        maps.put("uid",uid);
        maps.put("orderstatus",fg);
        orderService.updateOrder(maps);

        if(fg.equals("1") || fg.equals("4")){
            Cars cars = new Cars();
            cars.setId(Integer.parseInt(carId));
            cars.setRentstatus(1);
            carsService.updateCarStatus(cars);
            maps.put("result","1");
        }else if(fg.equals("0")){
            maps.put("result","0");
        }
        return maps;
    }

    /**
     * 选择还车地址
     */
    OrderDetail ToReturnAddress=new OrderDetail();

    @GetMapping("/orderReturnAddress/{orderId}")
    public String orderReturnAddress(@PathVariable("orderId") int orderId){
        ToReturnAddress.setId(orderId);
        return "redirect:/shopByCity";
    }
    @RequestMapping("/saveReturnAddress/{returnCity}/{returnStreet}/{returnAddress}/{returnShopName}/{uid}")
    public String optReturnAddress(@PathVariable("returnCity") String returnCity,
                                   @PathVariable("returnStreet") String returnStreet,
                                   @PathVariable("returnAddress") String returnAddress,
                                   @PathVariable("returnShopName") String returnShopName,
                                   @PathVariable("uid") String uid){
        String address = returnCity+returnStreet+returnAddress+returnShopName;
        System.out.println(address);
        if(uid.equals("")){
            return "error";
        }else{
            if(ToReturnAddress.getId()!=0){
                int orderId = ToReturnAddress.getId();
                HashMap<String,Object> maps = new HashMap<>();
                maps.put("id",orderId);
                maps.put("returnaddress",address);
                orderService.updateOrder(maps);
            }else{
                System.out.println("error·····");
                return "error";
            }
        }
        return "redirect:/user/usercenters/"+uid;
    }
    /**
     * 续租订单
     */
    @RequestMapping("/order/renew/{orderId}/{newDays}/{returnTime}/{nowDays}/{rentPrice}/{uid}")
    public String orderRenew(@PathVariable("orderId") int orderId,
                             @PathVariable("newDays") int newDays,
                             @PathVariable("returnTime") String returnTime,
                             @PathVariable("nowDays") int nowDays,
                             @PathVariable("rentPrice") int rentPrice,
                             @PathVariable("uid") String uid){
        HashMap<String,Object> maps = new HashMap<>();
        try {
            String newReturnTime = TimeFormats.dateAdd(returnTime,newDays);
            String newRentDay = String.valueOf(nowDays+newDays);
            String newtotalprice = String.valueOf(rentPrice * (Integer.parseInt(newRentDay)));
            System.out.println("新还车时间"+newReturnTime);
            System.out.println("新天数"+newRentDay);
            System.out.println("新租车价"+newtotalprice);
            //修改订单
            maps.put("id",orderId);
            maps.put("returncartime",newReturnTime);
            maps.put("renttime",newRentDay);
            maps.put("totalprice",newtotalprice);
            orderService.updateOrder(maps);
            //续租单记录+1
            RenewOrder renewOrder = new RenewOrder();
            renewOrder.setOrderid(orderId);
            renewOrder.setNewreturntime(newReturnTime);
            renewOrder.setOldreturntime(returnTime);
            renewOrder.setReordertime(TimeFormats.datetime());
            orderService.addRenewOrder(renewOrder);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        return "redirect:/user/usercenters/"+uid;
    }

    /**
     *  订单合同照片保存
     */
    @RequestMapping("/tbase")
    @ResponseBody
    public String contractSave(String bases,String orderId,String uid) throws IOException {
        System.out.println(bases);
        //保存照片
        codeShift.base64To(bases,orderId+uid);
        //上传图片to数据库
        HashMap<String,Object> maps = new HashMap<>();
        maps.put("id",orderId);
        maps.put("orderstatus","3");
        maps.put("contractimg",orderId+uid+".jpg");
        orderService.updateOrder(maps);
        return "ok";
    }
}
