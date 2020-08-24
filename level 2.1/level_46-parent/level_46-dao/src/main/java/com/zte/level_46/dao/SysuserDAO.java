package com.zte.level_46.dao;

import com.zte.level_46.entity.Sysuser;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Author:msy
 * Date:2020-06-26 16:34
 * Description:<描述>
 */
@Repository
public interface SysuserDAO {

    public List<Sysuser> selectAll();

    public Sysuser selectById(Integer id);

    public void insert(Sysuser sysuser);

    public void updateName(@Param("id")Integer id, @Param("name") String name);

    public void updateStatus(@Param("id")Integer id, @Param("isValid") Integer isValid);

    public Sysuser selectByName(String name);

    public Sysuser selectByNameAndPass(@Param("name")String name, @Param("password")String password, @Param("isValid")Integer isValid);
}
