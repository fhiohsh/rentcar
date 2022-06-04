package com.fh.rentcar.Controller;

import com.fh.rentcar.pojo.Cars;
import com.fh.rentcar.pojo.City;
import com.fh.rentcar.pojo.Shops;
import com.fh.rentcar.pojo.Street;
import com.fh.rentcar.service.CarsService;
import com.fh.rentcar.service.CityService;
import com.fh.rentcar.service.ShopService;
import com.fh.rentcar.util.codeShift;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.configurationprocessor.json.JSONObject;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Controller
public class TestController {

    /**
     * 测试静态资源
     */
    @RequestMapping({"a","/"})
    public String index(){
        return "home";
    }
}
