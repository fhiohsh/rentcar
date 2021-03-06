package com.fh.rentcar.service.imp;

import com.fh.rentcar.mapper.OrderMapper;
import com.fh.rentcar.pojo.OrderDetail;
import com.fh.rentcar.pojo.RenewOrder;
import com.fh.rentcar.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class OrderServiceImp implements OrderService {
    @Autowired
    private OrderMapper orderMapper;

    @Override
    public int addOrder(OrderDetail order) {
        return orderMapper.addOrder(order);
    }

    @Override
    public void updateOrder(Map<String,Object> orderMap) {
        orderMapper.updateOrder(orderMap);
    }

    @Override
    public List<OrderDetail> getAllOrder() {
        return orderMapper.getAllOrder();
    }

    @Override
    public List<OrderDetail> getAllOrderWith(Map<String, Object> orderMap) {
        return orderMapper.getAllOrderWith(orderMap);
    }

    @Override
    public int addRenewOrder(RenewOrder orderRenew) {
        return orderMapper.addRenewOrder(orderRenew);
    }
}
