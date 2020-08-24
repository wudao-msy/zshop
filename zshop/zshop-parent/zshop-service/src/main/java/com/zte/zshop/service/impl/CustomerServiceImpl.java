package com.zte.zshop.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zte.zshop.constants.Constant;
import com.zte.zshop.dao.CustomerDAO;
import com.zte.zshop.entity.Customer;
import com.zte.zshop.exception.CustomerNameExistException;
import com.zte.zshop.exception.LoginErrorException;
import com.zte.zshop.params.CustomerParam;
import com.zte.zshop.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Author:msy
 * Date:2020-06-18 14:57
 * Description:<描述>
 */
@Service
@Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
public class CustomerServiceImpl implements CustomerService {

    @Autowired
    private CustomerDAO customerDAO;

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public PageInfo<Customer> findAll(Integer page, Integer rows) {
        PageHelper.startPage(page,rows);
        List<Customer> customers = customerDAO.selectAll();
        PageInfo<Customer> pageInfo = new PageInfo<>(customers);
        return pageInfo;
    }

    @Override
    public void add(Customer customer) throws CustomerNameExistException {
        Customer c=customerDAO.selectByName(customer.getName());
        if(c!=null){
            throw new CustomerNameExistException("用户名已经存在");
        }
        customerDAO.insert(customer);
    }

    @Override
    public boolean checkName(String name){
        Customer customer=customerDAO.selectByName(name);
        if(customer!=null){
            return false;
        }
        return true;
    }

    @Override
    public void modify(Customer customer) throws CustomerNameExistException {
        Customer c=customerDAO.selectByName(customer.getName());
        if(c!=null&&!(c.getName().equals(customer.getName()))){
            throw new CustomerNameExistException("用户名已经存在");
        }
        customerDAO.update(customer);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public Customer findById(Integer id) {
        return customerDAO.selectById(id);
    }

    @Override
    public void modifyStatus(Integer id, Integer isValid) {
        customerDAO.updateStatus(id,isValid);

    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<Customer> findByParams(CustomerParam customerParam) {

        return customerDAO.selectByParams(customerParam);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public Customer login(String loginName, String password) throws LoginErrorException {

        Customer customer=customerDAO.selectByLoginNameAndPass(loginName,password, Constant.SYSUSER_VALID);
        if(customer==null){
            throw  new LoginErrorException("登录失败，用户名或者密码不正确");
        }

        return customer;
    }
}
