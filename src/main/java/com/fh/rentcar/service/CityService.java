package com.fh.rentcar.service;

import com.fh.rentcar.pojo.Cars;
import com.fh.rentcar.pojo.City;
import com.fh.rentcar.pojo.Street;

import java.util.List;

public interface CityService {
    List<City> AllCity();
    City getCityName(String cname);
    City getCityId(int cid);

    List<Street> getStreetId(int cid);
}
