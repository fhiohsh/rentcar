package com.fh.rentcar.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderRecord {
    private int id;
    private String ordertime;
    private String orderstatus;
}
