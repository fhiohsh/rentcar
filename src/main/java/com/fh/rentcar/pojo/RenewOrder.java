package com.fh.rentcar.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RenewOrder {
    private int id;
    private int orderid;
    private String renewtime;
    private String oldrenttime;
    private String newrenttime;
    private int price;

    OrderDetail orderDetail;
}
