package com.fh.rentcar.service.imp;

import com.fh.rentcar.mapper.UserMapper;
import com.fh.rentcar.pojo.Role;
import com.fh.rentcar.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserAuthService implements UserDetailsService {


    @Autowired
    UserMapper userMapper;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

        User user = userMapper.verifyUser(username);
        if (user == null){
            throw new BadCredentialsException("账号不存在");
        }
        List<Role> roles = userMapper.getUserRolesByUid(user.getId());
        user.setRoles(roles);
        System.out.println("数据库密码"+user.getPassword() +"账户名"+user.getUsername());
        String encode = new BCryptPasswordEncoder().encode(user.getPassword());

        return org.springframework.security.core.userdetails.User.withUsername(user.getName())
                .password(encode).authorities(user.getAuthorities()).build();
    }
}

