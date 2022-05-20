package com.fh.rentcar.service;

import com.fh.rentcar.pojo.Cars;

import java.util.List;
import java.util.Map;

public interface CarsService {
    /**
     * 根据城市查询车辆
     */
    List<Cars> carByCity(Integer cid);
    /**
     * 所有车型
     */
    List<Cars> getAllCars();

    //多条件
    List<Cars> findCarByCondition(Map<String,Object> objectMap);
}
