package com.fh.rentcar.mapper;

import com.fh.rentcar.pojo.User;
import org.apache.ibatis.annotations.Mapper;

import java.util.Map;

@Mapper
public interface UserMapper {

    //登录
    User login(Map<String,Object> UserMap);
}
