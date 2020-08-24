package com.zte.level_46.service.impl;

import com.zte.level_46.constants.Constant;
import com.zte.level_46.dao.SysuserDAO;
import com.zte.level_46.entity.Sysuser;
import com.zte.level_46.exception.SysuserNotExistException;
import com.zte.level_46.service.SysuserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

/**
 * Author:msy
 * Date:2020-06-26 19:11
 * Description:<描述>
 */
@Service
@Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
public class SysuserServiceImpl implements SysuserService {

    @Autowired
    private SysuserDAO sysuserDAO;

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<Sysuser> findAll() {
        return sysuserDAO.selectAll();
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public Sysuser findById(Integer id) {
        return sysuserDAO.selectById(id);
    }

    @Override
    public void add(Sysuser sysuser) {
        sysuser.setIsValid(Constant.SYSUSER_VALID);
        //默认时间为当前时间
        sysuser.setGmtCreate(new Date());
        sysuser.setGmtModified(new Date());
        sysuserDAO.insert(sysuser);
    }

    @Override
    public void modifyName(Integer id,String name) {
        sysuserDAO.updateName(id,name);
    }


    @Override
    public void modifyStatus(Integer id) {
        Sysuser sysuser=sysuserDAO.selectById(id);
        Integer isValid = sysuser.getIsValid();
        if(isValid==Constant.SYSUSER_VALID){
            isValid=Constant.SYSUSER_INVALID;
        }
        else{
            isValid=Constant.SYSUSER_VALID;

        }
        sysuserDAO.updateStatus(id,isValid);
    }

    @Override
    public boolean checkName(String loginName) {
        Sysuser sysuser=sysuserDAO.selectByName(loginName);
        if(sysuser!=null){
            return false;
        }

        return true;
    }

    @Override
    public Sysuser login(String name, String password) throws SysuserNotExistException {
        Sysuser sysuser= sysuserDAO.selectByNameAndPass(name,password, Constant.SYSUSER_VALID);
        if(sysuser!=null){
            return sysuser;
        }
        throw new SysuserNotExistException("用户名或密码不正确");

    }
}

