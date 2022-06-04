package com.fh.rentcar.util;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
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
    //String转date
    public static Date toDate(String dateTime) throws ParseException {

        SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
        Date date = sf.parse(dateTime);
        //打印Date
        System.out.println(date);

        return date;
    }
    //date转String
    public static String toDateString(Date date){
        SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
        return sf.format(date);
    }

    //时间增加 天数
    public static String dateAdd(String date,int index) throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        //String转化date
        Date toDate = toDate(date);
        Calendar cal = Calendar.getInstance();
        cal.setTime(toDate);//设置起时间
        //增加
        cal.add(Calendar.DATE, index);
        return sdf.format(cal.getTime());
    }
}

//cal.add(Calendar.YEAR, 1);//增加一年
//cd.add(Calendar.DATE, 1);//增加一天
//cd.add(Calendar.DATE, -10);//减10天
//cd.add(Calendar.MONTH, 1);//增加一个月
//转化
//Calendar calendat = Calendar.getInstance();