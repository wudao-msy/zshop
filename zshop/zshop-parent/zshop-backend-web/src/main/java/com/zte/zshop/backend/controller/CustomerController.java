package com.zte.zshop.backend.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zte.zshop.constants.Constant;
import com.zte.zshop.entity.Customer;
import com.zte.zshop.exception.CustomerNameExistException;
import com.zte.zshop.params.CustomerParam;
import com.zte.zshop.service.CustomerService;
import com.zte.zshop.utils.ResponseResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Author:msy
 * Date:2020-06-05 11:28
 * Description:<描述>
 */
@Controller
@RequestMapping("/backend/customer")
public class CustomerController {

    @Autowired
    private CustomerService customerService;

    @RequestMapping("/findAll")
    public String findAll(Integer pageNum, Model model){
        if(ObjectUtils.isEmpty(pageNum)){
            pageNum = Constant.PAGE_NUM;
        }

        //查找所有商品类型
        PageInfo<Customer> pageInfo = customerService.findAll(pageNum,Constant.PAGE_SIZE);
        //将集合放入作用域
        model.addAttribute("data",pageInfo);
        return "customerManager";
    }


    @RequestMapping("/findById")
    @ResponseBody
    public ResponseResult findById(Integer id){
        Customer customer=customerService.findById(id);
        return ResponseResult.success(customer);
    }

    @RequestMapping("/modify")
    public String modify(Customer customer,Model model,Integer pageNum){
        customer.setRegistDate(new Date());
        try {
            customerService.modify(customer);
            model.addAttribute("successMsg","修改成功");
        } catch (CustomerNameExistException e) {
            e.printStackTrace();
            model.addAttribute("errorMsg",e.getMessage());
        }
        return "forward:findAll?pageNum="+pageNum;
    }

    @RequestMapping("/checkName")
    @ResponseBody
    public Map<String,Object> checkName(String name){

        Map<String,Object> map=  new HashMap<>();
        boolean res=customerService.checkName(name);
        //如果名字不存在，可用
        if(res){
            map.put("valid",true);
        }
        else{
            //不可用，需要设置valid和message两个属性，remote.js会自动读取这两个值，当valid值为false时，输出message所对应的值
            map.put("valid",false);
            map.put("message","用户("+name+")已经存在");
        }

        return  map;

    }

    @RequestMapping("/findByParams")
    public String findByParams(CustomerParam customerParam, Integer pageNum, Model model)
    {
        if(ObjectUtils.isEmpty(pageNum)){
            pageNum=Constant.PAGE_NUM;
        }
        PageHelper.startPage(pageNum,2);
        List<Customer> customers=customerService.findByParams(customerParam);
        PageInfo<Customer> pageInfo=new PageInfo<>(customers);
        model.addAttribute("data",pageInfo);
        model.addAttribute("customerParam",customerParam);

        return "customerManager";
    }

    //修改用户状态
    @RequestMapping("/modifyStatus")
    @ResponseBody
    public ResponseResult modifyStatus(Integer id,Integer isValid){
        if(isValid==Constant.CUSTOMER_VALID){
            isValid=Constant.CUSTOMER_INVALID;
        }else if(isValid==Constant.CUSTOMER_INVALID){
            isValid=Constant.CUSTOMER_VALID;
        }
        try {
            customerService.modifyStatus(id,isValid);
            return ResponseResult.success("更新成功");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseResult.fail("更新失败");
        }

    }

}
