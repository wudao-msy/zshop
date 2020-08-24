package com.zte.zshop.utils;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

/**
 * Author:helloboy
 * Date:2020-05-28 15:00
 * Description:<描述>
 */
public class StringUtils {

    //根据文件名称，生成一个随机字符串
    public static String renameFileName(String fileName){

        //a.jpg---->2020052815062399.jpg
        //获取.对应的索引
        int dotIndex = fileName.lastIndexOf(".");
        //获取文件后缀名，如.jpg
        String suffix = fileName.substring(dotIndex);
        return new SimpleDateFormat("yyyyMMddhhmmss").format(new Date())+
                new Random().nextInt(100)+suffix;
    }

    //获得文件名的哈希值，生成二级目录
    public static String generateRandomDir(String fileName){
        int hashCode = fileName.hashCode();
        int dir1=hashCode & 0xf;   //得到名称为1-16的一级目录
        int dir2=(hashCode & 0xf0)>>4;//得到名称为1-16的二级目录
        return "/"+dir1+"/"+dir2;



    }


    public static void main(String[] args) {

        String s = StringUtils.renameFileName("f/a.jpg");
        System.out.println(s);
        String fileName = generateRandomDir("mike");
        System.out.println(fileName);


    }




}
