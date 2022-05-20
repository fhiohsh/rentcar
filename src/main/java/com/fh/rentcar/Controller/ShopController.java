package com.fh.rentcar.Controller;

import com.fh.rentcar.service.CarsService;
import com.fh.rentcar.service.CityService;
import com.fh.rentcar.service.ShopService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ShopController {
    @Autowired
    private CityService cityService;
    @Autowired
    private CarsService carsService;
    @Autowired
    private ShopService shopService;

    @RequestMapping("/toShop")
    public String toShops(){
        return "shopCars";
    }


}
