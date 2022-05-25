package com.fh.rentcar.service;

import com.fh.rentcar.pojo.OrderDetail;

public interface OrderService {

    //增加订单
    int addOrder(OrderDetail order);

}
