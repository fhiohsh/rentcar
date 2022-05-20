package com.fh.rentcar.Controller;

import com.fh.rentcar.pojo.Cars;
import com.fh.rentcar.pojo.City;
import com.fh.rentcar.service.CarsService;
import com.fh.rentcar.service.CityService;
import com.fh.rentcar.service.ShopService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class CarController {
    @Autowired
    private CityService cityService;
    @Autowired
    private CarsService carsService;
    @Autowired
    private ShopService shopService;

    /**
     * 分页默认成都第一页
     */
    @RequestMapping("/pages/{pageNo}")
    public String shopByCar(@PathVariable("pageNo") int pageNo,Model mc){
        City city = cityService.getCityName("成都");
        PageHelper.startPage(pageNo,2);
        List<Cars> list = carsService.carByCity(city.getId());
        PageInfo<Cars> pages = new PageInfo<Cars>(list);
        mc.addAttribute("citys",city);
        mc.addAttribute("pages",pages);
        return "carlistByCity";
    }
    /**
     * 根据城市选出车辆
     */
    @RequestMapping("/pages/{cname}/{pageNo}")
//    @ResponseBody
    public String optCarByCity(@PathVariable("cname") String cname,@PathVariable("pageNo") int pageNo,Model model){

        //获取城市id
        City city = cityService.getCityName(cname);
        //根据id获取车辆
        PageHelper.startPage(pageNo,1);
        List<Cars> list = carsService.carByCity(city.getId());
        PageInfo<Cars> pages = new PageInfo<Cars>(list);
        model.addAttribute("citys",city);
        model.addAttribute("pages",pages);
        String cn = cname+"/";
        model.addAttribute("cn",cn);
        return "carlistByCity";
    }
}