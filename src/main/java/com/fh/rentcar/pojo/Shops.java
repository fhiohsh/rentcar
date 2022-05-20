package com.fh.rentcar.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Shops {
    private int id;
    private String name;
    private String phone;
    private Date Business_hours;
    private String address;
    private String point;

    City city;
    Street street;
}
