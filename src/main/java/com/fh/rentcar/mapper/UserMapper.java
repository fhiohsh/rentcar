package com.fh.rentcar.mapper;

import com.fh.rentcar.pojo.User;
import org.apache.ibatis.annotations.Mapper;

import java.util.Map;

@Mapper
public interface UserMapper {

    //登录
    User selectOne(Map<String,Object> UserMap);

    //注册
    int register(User user);
    //注册验证
}
