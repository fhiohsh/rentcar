package com.fh.rentcar.service.imp;

import com.fh.rentcar.mapper.UserMapper;
import com.fh.rentcar.pojo.User;
import com.fh.rentcar.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class UserServiceImp implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public User selectUserByPhone(Map<String, Object> UserMap) {

        HashMap<String,Object> condition = new HashMap<String, Object>();
        condition.put("phone",UserMap.get("phone"));
        condition.put("password",UserMap.get("password"));
        User user = userMapper.login(condition);
        if(user == null){
            System.out.println("手机号或密码错误");
        }
        return user;
    }

    @Override
    public User selectUserByEmail(Map<String, Object> UserMap) {
        HashMap<String,Object> condition2 = new HashMap<String, Object>();
        condition2.put("email",UserMap.get("email"));
        condition2.put("password",UserMap.get("password"));
        User user = userMapper.login(condition2);
        if(user == null){
            System.out.println("邮箱或密码错误");
        }
        return user;
    }

    @Override
    public User selectUserByUserName(Map<String, Object> UserMap) {
        HashMap<String,Object> condition3 = new HashMap<String, Object>();
        condition3.put("username",UserMap.get("username"));
        condition3.put("password",UserMap.get("password"));
        User user = userMapper.login(condition3);
        if(user == null){
            System.out.println("用户名或密码错误");
        }
        return user;
    }
}
