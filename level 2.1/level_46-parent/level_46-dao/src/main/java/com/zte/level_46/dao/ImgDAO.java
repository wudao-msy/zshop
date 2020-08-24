package com.zte.level_46.dao;

import com.zte.level_46.entity.Img;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Author:msy
 * Date:2020-07-29 17:15
 * Description:<描述>
 */
@Repository
public interface ImgDAO {

    public List<Img> selectAll();

    public void insert(Img img);

    public void update(Img img);

    public Img selectById(Integer id);

    public void deteleById(Integer id);

    public Img selectByName(String Name);


}
