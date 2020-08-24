package com.zte.zshop.service;

import com.zte.zshop.entity.Sysuser;
import com.zte.zshop.exception.SysuserNotExistException;
import com.zte.zshop.params.SysuserParam;
import com.zte.zshop.service.vo.SysuserVO;

import java.util.List;

/**
 * Author:msy
 * Date:2020-06-04 14:57
 * Description:<描述>
 */
public interface SysuserService {

    public List<Sysuser> findAll();

    public Sysuser findById(int id);

    public void add(SysuserVO sysuserVO);

    public void modify(SysuserVO sysuserVO);

    public void modifyStatus(int id);

    public boolean checkName(String loginName);

    public List<Sysuser> findByParams(SysuserParam sysuserParam);

    public Sysuser login(String loginName, String password)throws SysuserNotExistException;
}
