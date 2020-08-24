package com.zte.zshop.front.controller;

import com.zte.zshop.entity.Customer;
import com.zte.zshop.exception.LoginErrorException;
import com.zte.zshop.service.CustomerService;
import com.zte.zshop.utils.ResponseResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * Author:msy
 * Date:2020-06-18 14:45
 * Description:<描述>
 */
@Controller
@RequestMapping("/front/customer")
public class CustomerController {

    @Autowired
    private CustomerService customerService;

    @RequestMapping("/loginByAccount")
    @ResponseBody
    public ResponseResult login(String loginName, String password,HttpSession session) {

        try {
            Customer customer = customerService.login(loginName, password);
            session.setAttribute("customer",customer);
            return ResponseResult.success(customer);
        } catch (LoginErrorException e) {
            //e.printStackTrace();
            return ResponseResult.fail("登录失败");
        }

    }

    //退出
    @RequestMapping("/loginOut")
    @ResponseBody
    public ResponseResult loginOut(HttpSession session){
        //清除session
        //session.invalidate();
        session.removeAttribute("customer");
        return ResponseResult.success("退出成功");

    }


}
