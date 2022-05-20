package com.fh.rentcar.service.imp;

import com.fh.rentcar.mapper.CityMapper;
import com.fh.rentcar.mapper.ShopMapper;
import com.fh.rentcar.pojo.Shops;
import com.fh.rentcar.service.ShopService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ShopServiceImp implements ShopService {
    @Autowired
    private ShopMapper shopMapper;


    @Override
    public List<Shops> getShopsByCity(int cityId) {
        return shopMapper.getShopsByCity(cityId);
    }

    @Override
    public Shops getShopById(int sid) {
        return shopMapper.getShopById(sid);
    }
}
