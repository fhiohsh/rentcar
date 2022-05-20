package com.fh.rentcar;

import com.fh.rentcar.pojo.Cars;
import com.fh.rentcar.pojo.City;
import com.fh.rentcar.service.CarsService;
import com.fh.rentcar.service.CityService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.text.Collator;
import java.util.*;

@SpringBootTest
class RentcarApplicationTests {
    @Autowired
    private CarsService carsService;
    @Autowired
    private CityService cityService;
    @Test
    void contextLoads() {
    }
    @Test
    void listSort() {
        HashMap<String,Object> condition = new HashMap<String, Object>();
        City city = cityService.getCityName("成都");
//        condition.put("name","红旗Rs2");
        condition.put("cityId",city.getId());
        List<Cars> carsList = carsService.findCarByCondition(condition);
        for (Cars cars : carsList) {
             System.out.println(cars);
        }

//        System.out.println("卧槽卧槽卧槽卧槽卧槽卧槽88888我");
//        PageHelper.startPage(2,2);
//        List<Cars> carsList = carsService.getAllCars();
//        PageInfo<Cars> pages = new PageInfo<>(carsList);
//        System.out.println(pages.getPages());
//        System.out.println(pages.getPageNum());


        }

}
