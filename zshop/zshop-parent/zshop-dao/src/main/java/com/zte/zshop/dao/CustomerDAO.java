package com.zte.zshop.dao;

import com.zte.zshop.entity.Customer;
import com.zte.zshop.params.CustomerParam;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Author:msy
 * Date:2020-06-18 14:59
 * Description:<描述>
 */
@Repository
public interface CustomerDAO {

    public List<Customer> selectAll();

    public void insert(Customer customer);

    public Customer selectByName(String name);

    public void update(Customer customer);

    public Customer selectById(Integer id);

    public void updateStatus(@Param("id") Integer id, @Param("isValid") Integer isVaild);

    public List<Customer> selectByParams(CustomerParam customerParam);

    public Customer selectByLoginNameAndPass(@Param("loginName") String loginName, @Param("password") String password, @Param("isValid") Integer isValid);
}
