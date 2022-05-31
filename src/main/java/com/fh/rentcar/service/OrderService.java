package com.fh.rentcar.service;

import com.fh.rentcar.pojo.OrderDetail;

import java.util.List;
import java.util.Map;

public interface OrderService {

    //增加订单
    int addOrder(OrderDetail order);

    //修改订单
    void updateOrder(Map<String,Object> orderMap);

    //显示订单
    List<OrderDetail> getAllOrder();


}
