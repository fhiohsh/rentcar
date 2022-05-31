package com.fh.rentcar.mapper;

import com.fh.rentcar.pojo.OrderDetail;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface OrderMapper {
    //增加订单
    int addOrder(OrderDetail order);

    //修改订单
    void updateOrder(Map<String,Object> orderMap);

    //显示订单
    List<OrderDetail> getAllOrder();


}
