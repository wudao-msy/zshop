package com.zte.zshop.dao;

import com.zte.zshop.entity.Sysuser;
import com.zte.zshop.params.SysuserParam;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Author:msy
 * Date:2020-06-04 14:25
 * Description:<描述>
 */
@Repository
public interface SysuserDAO {

    public List<Sysuser> selectAll();

    public Sysuser selectById(int id);

    public void insert(Sysuser sysuser);

    public void update(Sysuser sysuser);

    public void updateStatus(@Param("id")int id,@Param("isValid") int isValid);

    public Sysuser selectByName(String loginName);

    public List<Sysuser> selectByParams(SysuserParam sysuserParam);

    public Sysuser selectByLoginNameAndPass(@Param("loginName")String loginName, @Param("password")String password, @Param("isValid")Integer sysuserValid);
}
