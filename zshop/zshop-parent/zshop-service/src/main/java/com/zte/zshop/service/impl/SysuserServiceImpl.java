package com.zte.zshop.service.impl;

import com.zte.zshop.constants.Constant;
import com.zte.zshop.dao.SysuserDAO;
import com.zte.zshop.entity.Role;
import com.zte.zshop.entity.Sysuser;
import com.zte.zshop.exception.SysuserNotExistException;
import com.zte.zshop.params.SysuserParam;
import com.zte.zshop.service.SysuserService;
import com.zte.zshop.service.vo.SysuserVO;
import org.apache.commons.beanutils.PropertyUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.lang.reflect.InvocationTargetException;
import java.util.Date;
import java.util.List;

/**
 * Author:msy
 * Date:2020-06-04 14:59
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
    public Sysuser findById(int id) {
        return sysuserDAO.selectById(id);
    }

    @Override
    public void add(SysuserVO sysuserVO) {
        Sysuser sysuser = new Sysuser();
        try {
            PropertyUtils.copyProperties(sysuser,sysuserVO);
            //默认有效状态
            sysuser.setIsValid(Constant.SYSUSER_VALID);
            //默认时间为当前时间
            sysuser.setCreateDate(new Date());
            //设置角色id
            Role role = new Role();
            role.setId(sysuserVO.getRoleId());
            sysuser.setRole(role);
            sysuserDAO.insert(sysuser);

        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        } catch (NoSuchMethodException e) {
            e.printStackTrace();
        }


    }

    @Override
    public void modify(SysuserVO sysuserVO) {

    }


    @Override
    public void modifyStatus(int id) {
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
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<Sysuser> findByParams(SysuserParam sysuserParam) {
        return sysuserDAO.selectByParams(sysuserParam);
    }

    @Override
    public Sysuser login(String loginName, String password) throws SysuserNotExistException {
        Sysuser sysuser= sysuserDAO.selectByLoginNameAndPass(loginName,password,Constant.SYSUSER_VALID);
        if(sysuser!=null){
            return sysuser;
        }
        throw new SysuserNotExistException("用户名或密码不正确");

    }
}
