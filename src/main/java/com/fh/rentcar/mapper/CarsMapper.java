package com.fh.rentcar.mapper;

import com.fh.rentcar.pojo.Cars;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface CarsMapper {
    List<Cars> getCarByCity(Integer cid);

    List<Cars> getAllCars();



    List<Cars> getCarsByName(String carName);
//    Cars getCarsById(Integer carId);

    //多条件查询-mybatis
    List<Cars> findCarByCondition(Map<String,Object> objectMap);
    //车名
    Cars carByName(String cname);

    //id
    Cars getCarByCarId(int carId);
}
