package com.fh.rentcar.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderDetail {
    private int id;
    private int car_id;
    private String pickcartime;
    private String returncartime;
    private String pickaddress;
    private String returnaddress;
    private int shop_id;
    private String returntime;
    private int uid;
    private String totalprice;
    private String rentprice;
    private String deposit;
    private String renttime;
    private String renttype;
    private String rentfrom;
    private String ordertime;
    private String orderstatus;
    private String contractimg;

    Cars car;
    Shops shop;
    User user;

}
