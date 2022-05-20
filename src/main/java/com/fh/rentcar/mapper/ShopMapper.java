package com.fh.rentcar.mapper;

import com.fh.rentcar.pojo.Shops;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ShopMapper {
    //城市查门店
    List<Shops> getShopsByCity(int cityId);
    //根据门店id
    Shops getShopById(int sid);
}
