package com.fh.rentcar.mapper;

import com.fh.rentcar.pojo.OrderDetail;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface OrderMapper {

    int addOrder(OrderDetail order);
}
