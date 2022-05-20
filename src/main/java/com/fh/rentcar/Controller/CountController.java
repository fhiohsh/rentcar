package com.fh.rentcar.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CountController {

    @RequestMapping("/usercenter")
    public String userCenter(){
        return "usercenter";
    }
}
