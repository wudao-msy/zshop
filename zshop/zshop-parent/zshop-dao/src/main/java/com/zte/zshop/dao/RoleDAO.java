package com.zte.zshop.dao;

import com.zte.zshop.entity.Role;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Author:msy
 * Date:2020-06-06 9:05
 * Description:<描述>
 */
@Repository
public interface RoleDAO {
    public List<Role> selectAll();
}
