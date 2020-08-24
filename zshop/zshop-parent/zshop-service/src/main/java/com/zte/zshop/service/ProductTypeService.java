package com.zte.zshop.service;

import com.github.pagehelper.PageInfo;
import com.zte.zshop.entity.ProductType;
import com.zte.zshop.exception.ProductTypeExistException;

import java.util.List;

/**
 * Author:msy
 * Date:2020-05-19 11:25
 * Description:<描述>
 */
public interface ProductTypeService {

    //查询所有商品类型信息
    public PageInfo<ProductType> findAll(Integer page,Integer rows);


    //添加商品类型
    //判断商品类型是否已经存在,如果存在，抛出异常，如果不存在，添加
    public void add(String productTypeName) throws ProductTypeExistException;


    public ProductType findById(Integer id);

    public void modifyName(Integer id, String name)throws ProductTypeExistException;

    public void deleteById(Integer id);

    public void modifyStatus(Integer id);

    public List<ProductType> findEnable(Integer productTypeEnable);
}
