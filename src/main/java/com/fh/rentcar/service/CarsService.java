package com.fh.rentcar.service;

import com.fh.rentcar.pojo.Cars;
import com.fh.rentcar.pojo.RenewOrder;

import java.util.List;
import java.util.Map;

public interface CarsService {
    /**
     * 根据城id查询车辆
     */
    List<Cars> carByCity(Integer cid);
    /**
     * 所有车型
     */
    List<Cars> getAllCars();

    //多条件
    List<Cars> findCarByCondition(Map<String,Object> objectMap);

    //车名查车
    Cars carByName(String cname);

    //id
    Cars getCarByCarId(int carId);

    //更新车辆状态
    void updateCarStatus(Cars cars);
}
