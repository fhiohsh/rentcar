package com.fh.rentcar.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Cars {
    private Integer id;
    private String name;
    private String seats;
    private String carml;
    private String img;
    private Integer rentstatus;
    private String points;
//    private Integer shop_id;
    Shops shops;
    City city;
    Street street;
}
