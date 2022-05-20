package com.fh.rentcar.mapper;

import com.fh.rentcar.pojo.City;
import com.fh.rentcar.pojo.Street;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CityMapper {
    List<City> AllCity();
    City getCityName(String cname);
    City getCityId(int cid);

    //查街道
    List<Street> getStreetId(int cid);
}
