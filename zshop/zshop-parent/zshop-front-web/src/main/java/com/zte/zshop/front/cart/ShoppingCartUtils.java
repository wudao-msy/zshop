package com.zte.zshop.front.cart;

import com.zte.zshop.cart.ShoppingCart;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

/**
 * Author:msy
 * Date:2020-06-23 9:10
 * Description:<描述>
 */
public class ShoppingCartUtils {


    /*
        从session中获取购物车对象
        逻辑：
            若session中没有该对象，创建一个新的对象，放入到session作用域中，若有，直接返回(单例)

     */
    public static ShoppingCart getShoppingCart(HttpSession session){
        //懒汉式单例
        ShoppingCart sc = (ShoppingCart)session.getAttribute("shoppingCart");
        if(sc==null){
            sc=new ShoppingCart();
            session.setAttribute("shoppingCart",sc);
        }
        return sc;


    }
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

}
