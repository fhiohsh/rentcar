package com.fh.rentcar.Controller;

import com.fh.rentcar.pojo.User;
import com.fh.rentcar.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class AccountController {
    @Autowired
    private UserService userService;

    @RequestMapping("/usercenter")
    public String userCenter(){
        return "usercenter";
    }

    //用户注销
    @RequestMapping("/logout")
    @ResponseBody
    public Map<String,Object> userLogout(HttpSession session){
        HashMap<String,Object> maps = new HashMap<String, Object>();
        session.invalidate();
        maps.put("result","logout");
        return maps;
    }

    //用户登录
    @RequestMapping("/login")
    @ResponseBody
    public Map<String,Object> login(Map<String, Object> map, User user, HttpSession session, HttpServletRequest request){

        String username = user.getUsername();
        String psd = user.getPassword();
        //判断是邮箱还是手机号的正则表达式
        String email = "^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$";
        String phone = "^[1][34578]\\d{9}$";
        //验证map
        HashMap<String,Object> maps = new HashMap<String, Object>();
        StringBuffer re= request.getRequestURL();
        String res = re.toString();
        System.out.println(res);
        if (username.matches(phone)) {//手机号登录
            map.put("phone", username);
            map.put("password", psd);
            User userphone = userService.selectUserByPhone(map);
            if (userphone != null) {
                maps.put("result","oks");
                session.setAttribute("user",userphone);
            }else{
                maps.put("result","noPhone");
            }
        } else if (username.matches(email)) {//手机号登录
            map.put("email", username);
            map.put("password", psd);
            User useremail = userService.selectUserByEmail(map);
            if (useremail != null) {
                maps.put("result","oks");
                session.setAttribute("user",useremail);
            }else{
                maps.put("result","noEmail");
            }
        }else{
            map.put("username", username);
            map.put("password", psd);
            User uname = userService.selectUserByUserName(map);
            if (uname != null) {
                maps.put("result","oks");
                session.setAttribute("user",uname);
            }else{
                maps.put("result","noUsername");
            }
        }
        return maps;
    }


}
