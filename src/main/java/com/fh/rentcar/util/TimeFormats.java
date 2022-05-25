package com.fh.rentcar.util;

import java.text.DateFormat;
import java.util.Date;

public class TimeFormats {
    /**
     * 日期路径 即年/月/日 如2018/08/08
     * @return
     */
    public static String datetime() {
        Date now = new Date();
        DateFormat formatdatetime = DateFormat.getDateTimeInstance();
        String nows = formatdatetime.format(now);
        System.out.println("当前时间-------->"+nows);//String
        return nows;
    }

    public static String changeTime(String time){
        DateFormat formatdatetime = DateFormat.getDateTimeInstance();
        String nows = formatdatetime.format(time);
        System.out.println("当前时间-------->"+nows);//String
        return nows;
    }
}
