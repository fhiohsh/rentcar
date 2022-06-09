package com.fh.rentcar.Controller;

import com.fh.rentcar.pojo.City;
import com.fh.rentcar.pojo.Shops;
import com.fh.rentcar.pojo.Street;
import com.fh.rentcar.service.CarsService;
import com.fh.rentcar.service.CityService;
import com.fh.rentcar.service.ShopService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/shopIn")
public class ShopController {
    @Autowired
    private CityService cityService;
    @Autowired
    private CarsService carsService;
    @Autowired
    private ShopService shopService;


    /**
     * 根据城市选门店
     */
    @RequestMapping("/shopmap/{cityId}")
    public String shopmap(@PathVariable("cityId") int cityId, Model model){
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
    //默认选择
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
