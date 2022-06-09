package com.fh.rentcar.util;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Random;

public class ImgCodeUtil {
    public void code(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("进行图片验证>>>");
        //创建空白图片
        BufferedImage image=new BufferedImage(60,25,BufferedImage.TYPE_3BYTE_BGR);
        //获取图片画笔
        Graphics g=image.getGraphics();
        Random r=new Random();
        //设置画笔颜色
//        g.setColor(new Color(r.nextInt(225),r.nextInt(225),r.nextInt(225)));
        //绘制矩形背景
        g.fillRect(0,0,60,25);
        //绘制5条干扰线
        for (int i=0;i<5;i++){
            g.setColor(new Color(r.nextInt(225),r.nextInt(225),r.nextInt(225)));
            g.drawLine(r.nextInt(60),r.nextInt(25),r.nextInt(60),r.nextInt(25));
        }
        //设置画笔颜色
        g.setColor(new Color(r.nextInt(225),r.nextInt(225),r.nextInt(225)));
        //获取随机字符串
        String number=getNumber(4);
        HttpSession session=request.getSession();
        session.setAttribute("r_code",number);//保存到session中
        g.setFont(new Font(null,Font.PLAIN,20));
        g.drawString(number,3,23);
        response.setContentType("image/jpeg");
        OutputStream out= null;
        try {
            out = response.getOutputStream();
        } catch (IOException e) {
            e.printStackTrace();
        }
        try {
            //将图片通过流的形式输出到客户端
            ImageIO.write(image,"jpeg",out);
        } catch (IOException e) {
            e.printStackTrace();
        }
        try {
            out.close();//关闭输出流对象
        } catch (IOException e) {
            e.printStackTrace();
        }

//        return image;
    }

    //获取随机字符
    private String getNumber(int size) {
        String str="QWERTYUIOPASDFGHJKLZXCVBNM1234567890";
        String number="";
        Random r=new Random();
        for (int i=0;i<size;i++){
            char c= str.charAt(r.nextInt(str.length()));
            number=number+c;
        }
        return number;

    }
}
