package com.fh.rentcar.service.imp;

import com.fh.rentcar.mapper.CityMapper;
import com.fh.rentcar.pojo.Cars;
import com.fh.rentcar.pojo.City;
import com.fh.rentcar.pojo.Street;
import com.fh.rentcar.service.CityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class CityServiceImp implements CityService {

    @Autowired
    private CityMapper cityMapper;

    @Override
    public List<City> AllCity() {
        return cityMapper.AllCity();
    }

    @Override
    public City getCityName(String cname) {
        return cityMapper.getCityName(cname);
    }

    @Override
    public List<Street> getStreetId(int cid) {
        return cityMapper.getStreetId(cid);
    }

    @Override
    public City getCityId(int cid) {
        return cityMapper.getCityId(cid);
    }
}
