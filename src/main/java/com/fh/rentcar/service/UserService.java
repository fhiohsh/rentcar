package com.fh.rentcar.service;

import com.fh.rentcar.pojo.User;

import java.util.Map;

public interface UserService {
    //登录多条件验证
    User selectUserByPhone(Map<String,Object> UserMap);
    User selectUserByEmail(Map<String,Object> UserMap);
    User selectUserByUserName(Map<String,Object> UserMap);
}
