package com.zte.zshop.front.controller;

import com.zte.zshop.front.cart.ShoppingCartUtils;
import com.zte.zshop.service.OrderService;
import com.zte.zshop.utils.ResponseResult;
import com.zte.zshop.vo.OrderVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;

/**
 * Author:msy
 * Date:2020-06-30 15:29
 * Description:<描述>
 */
@Controller
@RequestMapping("/front/order")
public class OrderController {

    @Autowired
    private OrderService orderService;

    //显示订单
    @RequestMapping("/showOrder")
    public String showOrder(){
        return "order";
    }


    //生成订单
    @RequestMapping("/generateOrder")
    @ResponseBody
    public ResponseResult generateOrder(OrderVO orderVO){

        try {
            String no = ShoppingCartUtils.getOrderIdByTime();
            orderVO.setNo(no);
            orderVO.setCreateDate(new Date());
            orderService.addOrder(orderVO);
            return ResponseResult.success(orderVO);
        } catch (Exception e) {
            //e.printStackTrace();
            return ResponseResult.fail("生成订单失败");
        }


    }
}
