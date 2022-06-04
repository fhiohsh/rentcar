package com.fh.rentcar.service.imp;

import com.fh.rentcar.mapper.CarsMapper;
import com.fh.rentcar.pojo.Cars;
import com.fh.rentcar.service.CarsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class CarListServiceImp implements CarsService {

    @Autowired
    private CarsMapper carsMapper;
    //根据城市选车车
    @Override
    public List<Cars> carByCity(Integer cid) {
        return carsMapper.getCarByCity(cid);
    }

    @Override
    public List<Cars> getAllCars() {
        return carsMapper.getAllCars();
    }

    @Override
    public List<Cars> findCarByCondition(Map<String, Object> objectMap) {
        return carsMapper.findCarByCondition(objectMap);
    }

    @Override
    public Cars carByName(String cname) {
        return carsMapper.carByName(cname);
    }

    @Override
    public Cars getCarByCarId(int carId) {
        return carsMapper.getCarByCarId(carId);
    }

    @Override
    public void updateCarStatus(Cars cars) {
        carsMapper.updateCarStatus(cars);
    }
}
