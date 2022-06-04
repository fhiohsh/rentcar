package com.fh.rentcar.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RenewOrder {
    private int orderrenewid;
    private String oldreturntime;
    private String newreturntime;
    private int orderid;
    private String reordertime;
}
