package com.fh.rentcar.mapper;

import com.fh.rentcar.pojo.Shops;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ShopMapper {

    List<Shops> getShopsByCity(int cityId);

    Shops getShopById(int sid);
}
