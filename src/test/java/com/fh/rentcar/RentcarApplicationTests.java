package com.fh.rentcar;

import com.fh.rentcar.pojo.Cars;
import com.fh.rentcar.service.CarsService;
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
    @Test
    void contextLoads() {
    }
    @Test
    void listSort() {
//        HashMap<String,Object> condition = new HashMap<String, Object>();
//
//        condition.put("name","红旗Rs2");
//        condition.put("shop_id",1201);
        System.out.println("卧槽卧槽卧槽卧槽卧槽卧槽我");
        PageHelper.startPage(2,2);
        List<Cars> carsList = carsService.getAllCars();
        PageInfo<Cars> pages = new PageInfo<>(carsList);

        System.out.println(pages.getPages());
        System.out.println(pages.getPageNum());
//        for (Cars cars : carsList) {
//            System.out.println(cars);
//        }

        }

}
