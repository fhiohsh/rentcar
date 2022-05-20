package com.fh.rentcar.service;

import com.fh.rentcar.pojo.Shops;

import java.util.List;

public interface ShopService {

    /**
     *   搜索门店 by城市
     * */
    List<Shops> getShopsByCity(int cityId);
    /**
     *   搜索门店 by门店id
     * */
    Shops getShopById(int sid);
}
