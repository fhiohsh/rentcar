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

    @Autowired
    private CityService cityService;

    @Autowired
    private CarsService carsService;
    @Autowired
    private ShopService shopService;

    /**
     * 测试静态资源
     */
    @RequestMapping("/a")
    public String index(){
        return "home";
    }
    /**
     * 所有车
     */
    @RequestMapping("/carList")
    public String carlist(Model model){
        List<Cars> carsList = carsService.getAllCars();
        model.addAttribute("carlist",carsList);
        return "carlistByCity";
    }
    /**
     * 根据城市选出车辆
     */
    @RequestMapping("/carByCity/{cname}")
//    @ResponseBody
    public String optCarByCity(@PathVariable("cname") String cname,Model model){

        //获取城市id
        City city = cityService.getCityName(cname);

        //根据id获取车辆
        List<Cars> carsList = carsService.carByCity(city.getId());
        model.addAttribute("citys",city);
        model.addAttribute("carlist",carsList);
        return "carlistByCity";
    }

    /**
     * test
     * @return
     */
    @RequestMapping("/carInfo")
    public String carinfo(){
        return "carInfo";
    }

    /**
     * 根据城市选门店
     */
    @RequestMapping("/shopmap/{cityId}")
    public String shopmap(@PathVariable("cityId") int cityId,Model model){
        //获取门店信息
        City city = cityService.getCityId(cityId);
        List<Shops> shopsList = shopService.getShopsByCity(cityId);
        List<Street> streetList = cityService.getStreetId(cityId);
        model.addAttribute("city",city);
        model.addAttribute("shopList",shopsList);
        model.addAttribute("streetList",streetList);
        return "shopmap";
    }
    @RequestMapping("/shopByCity/{cname}")
    public String shopByCity(@PathVariable("cname") String cname,Model model){
        City city = cityService.getCityName(cname);
        //获取门店信息
        List<Shops> shopsList = shopService.getShopsByCity(city.getId());
        List<Street> streetList = cityService.getStreetId(city.getId());
        System.out.println(streetList);
        model.addAttribute("city",city);
        model.addAttribute("streetList",streetList);
        model.addAttribute("shopList",shopsList);
        return "shopmap";
    }
    @RequestMapping("/shopByCity")
    public String shopByCity2(Model model){
        //获取门店信息
        int cityId = 15;
        City city = cityService.getCityId(cityId);
        List<Shops> shopsList = shopService.getShopsByCity(cityId);
        List<Street> streetList = cityService.getStreetId(cityId);
        model.addAttribute("city",city);
        model.addAttribute("shopList",shopsList);
        model.addAttribute("streetList",streetList);
        return "shopmap";
    }
    /**
     * 根据门店id选门店
     */
    @RequestMapping("/getShopById/{sid}")
    @ResponseBody
    public List<Shops> getShopById(@PathVariable("sid") int cid){
        return shopService.getShopsByCity(cid);
    }

    /**
     * 显示城市
     */
    @RequestMapping("/shop")
    public String shop(Model model){

        List<City> cities = cityService.AllCity();

        String az = "ABCDEFGHIJKLMNPQRSTUVWXYZ";
        List<String> al = new ArrayList<String>();
        for (int j = 0; j < az.length(); j++){
            al.add(az.substring(j, j + 1));
        }
        model.addAttribute("letters",al);
        model.addAttribute("cities",cities);

        return "shopNav";
    }





}
