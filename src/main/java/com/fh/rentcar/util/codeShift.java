package com.fh.rentcar.util;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Base64;

public class codeShift {
    /**
     * 测试base64转图片，并存储到本地
     * @param base64 base64字符串
     *
     */
    public static void base64To(String base64,String fname) throws IOException {
        byte[] bs = new byte[1024];
        base64 = base64.substring(base64.indexOf(",", 1) + 1, base64.length());
        bs = Base64.getMimeDecoder().decode(base64);
        BufferedOutputStream bos = null;
        FileOutputStream fos = null;
        File file = null;
        //todo 修改路径
        String fis = "E:\\java大二下\\项目\\RentCar\\src\\main\\webapp\\statics\\imgs";
        file = new File(fis+"\\"+fname+".jpg");
        try {
            fos = new FileOutputStream(file);
            bos = new BufferedOutputStream(fos);
            bos.write(bs);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (bos != null) {
                try {
                    bos.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            if (fos != null) {
                try {
                    fos.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
