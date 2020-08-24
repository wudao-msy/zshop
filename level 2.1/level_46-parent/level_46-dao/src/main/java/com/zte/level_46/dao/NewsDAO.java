package com.zte.level_46.dao;

import com.zte.level_46.entity.News;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Author:msy
 * Date:2020-06-27 19:00
 * Description:<描述>
 */
@Repository
public interface NewsDAO {

    public List<News> selectAll();

    public void insert(News news);

    public News selectByTitle(String title);

    public void update(News news);

    public News selectById(Integer id);

    public void deteleById(Integer id);

}
