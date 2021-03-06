package com.fh.rentcar.Controller;

import com.fh.rentcar.pojo.Cars;
import com.fh.rentcar.pojo.City;
import com.fh.rentcar.pojo.Shops;
import com.fh.rentcar.pojo.Street;
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

import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("/cars")
public class CarController {
    @Autowired
    private CityService cityService;
    @Autowired
    private CarsService carsService;
    @Autowired
    private ShopService shopService;

    /**
     * 车型查询 (按城市显示车辆)
     * 分页默认按成都第一页
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
     * 根据城市选出车辆(按城市显示车辆+分页)
     */
    @RequestMapping("/pages/{cname}/{pageNo}")
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

    /**
     * 根据车名和城市显示 门店
     */
    @RequestMapping("/carShops/{city}/{cname}")
    public String optCarByCarCityName(@PathVariable("city") String cityName,@PathVariable("cname") String carName,Model model){
        City city = cityService.getCityName(cityName);
        //map动态存储条件
        HashMap<String,Object> condition = new HashMap<String, Object>();
        condition.put("cityId",city.getId());
        condition.put("name",carName);

        List<Cars> carsList = carsService.findCarByCondition(condition);
        List<Street> streetList = cityService.getStreetId(city.getId());
        Cars cars = carsService.carByName(carName);

        model.addAttribute("streetList",streetList);
        model.addAttribute("carShopList",carsList);
        model.addAttribute("car",cars);
        model.addAttribute("citys",city);
        return "carInfo";
    }
    /**
     * 根据街道显示 门店
     */
    @RequestMapping("/carShops/{city}/{cname}/{street}")
    public String optCarByStreetName(@PathVariable("city") String cityName,@PathVariable("cname") String carName,@PathVariable("street") String street,Model model){
        City city2 = cityService.getCityName(cityName);
        //map动态存储条件
        HashMap<String,Object> condition = new HashMap<String, Object>();
        condition.put("cityId",city2.getId());
        condition.put("name",carName);
        condition.put("streetId",street);
        List<Cars> carsList = carsService.findCarByCondition(condition);
        List<Street> streetList = cityService.getStreetId(city2.getId());
        Cars cars = carsService.carByName(carName);

        model.addAttribute("streetList",streetList);
        model.addAttribute("carShopList",carsList);
        model.addAttribute("car",cars);
        model.addAttribute("citys",city2);
        return "carInfo";
    }
    /**
     * 查看门店车辆
     * 根据 sid
     */
    @RequestMapping("/shopsCar/{sid}")
    public String optCarListByShop(@PathVariable("sid") int sid,Model model){
        HashMap<String,Object> condition = new HashMap<String, Object>();
        condition.put("shop_id",sid);
        List<Cars> carsList = carsService.findCarByCondition(condition);
        Shops shop = shopService.getShopById(sid);
        model.addAttribute("shopCarList",carsList);
        model.addAttribute("shop",shop);
        return "shopCars";
    }


}
