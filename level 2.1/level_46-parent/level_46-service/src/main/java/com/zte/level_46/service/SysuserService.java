package com.zte.level_46.service;

import com.zte.level_46.entity.Sysuser;
import com.zte.level_46.exception.SysuserNotExistException;

import java.util.List;

/**
 * Author:msy
 * Date:2020-06-26 19:04
 * Description:<描述>
 */
public interface SysuserService {

    public List<Sysuser> findAll();

    public Sysuser findById(Integer id);

    public void add(Sysuser sysuser);

    public void modifyName(Integer id,String name);

    public void modifyStatus(Integer id);

    public boolean checkName(String name);

    public Sysuser login(String name, String password)throws SysuserNotExistException;
}