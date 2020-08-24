package com.zte.zshop.front.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

/**
 * Author:msy
 * Date:2020-06-30 14:37
 * Description:<描述>
 */
public class Test {

    //根据时间随机生成订单号
    public static String getOrderIdByTime(){
        SimpleDateFormat sdf= new SimpleDateFormat("yyyyMMddHHmmss");
        String newDate = sdf.format(new Date());
        String result="";
        Random random = new Random();
        for (int i=0;i<3;i++){
            //获取0(包括)到10(不包括)之间的任意整数
            result+=random.nextInt(10);//返回0-9之间任何值
        }
        return  newDate+result;

    }
    public static void main(String[] args) {

        String orderIdByTime = getOrderIdByTime();
        System.out.println(orderIdByTime);

    }
}
