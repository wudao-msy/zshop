package com.zte.zshop.service;

import com.github.pagehelper.PageInfo;
import com.zte.zshop.entity.Customer;
import com.zte.zshop.exception.CustomerNameExistException;
import com.zte.zshop.exception.LoginErrorException;
import com.zte.zshop.params.CustomerParam;

import java.util.List;

/**
 * Author:msy
 * Date:2020-06-18 14:48
 * Description:<描述>
 */
public interface CustomerService {

    public PageInfo<Customer> findAll(Integer page, Integer rows);

    public void add(Customer customer) throws CustomerNameExistException;

    public boolean checkName(String name);

    public void modify(Customer customer) throws CustomerNameExistException;

    public Customer findById(Integer id);

    public void modifyStatus(Integer id, Integer isValid);

    public List<Customer> findByParams(CustomerParam customerParam);

    public Customer login(String loginName, String password)throws LoginErrorException;


}
