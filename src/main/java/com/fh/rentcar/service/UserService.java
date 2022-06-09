package com.fh.rentcar.service;

import com.fh.rentcar.pojo.Role;
import com.fh.rentcar.pojo.User;

import java.util.List;
import java.util.Map;

public interface UserService {
    //登录多条件验证
    User selectUserByPhone(Map<String,Object> UserMap);
    User selectUserByEmail(Map<String,Object> UserMap);
    User selectUserByUserName(Map<String,Object> UserMap);

    //注册
    int register(User user);

    //登录验证
    User verifyUser(String username);

    //获取权限
    List<Role> getUserRolesByUid(Integer id);
}
