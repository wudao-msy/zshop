package com.zte.level_46.service;

import com.github.pagehelper.PageInfo;
import com.zte.level_46.entity.News;
import com.zte.level_46.exception.NewsNameExistException;

/**
 * Author:msy
 * Date:2020-06-29 0:10
 * Description:<描述>
 */

public interface NewsService {

    public PageInfo<News> findAll(Integer page, Integer rows);

    public void add(News news) throws NewsNameExistException;

    public boolean checkTitle(String title);

    public void modify(News news) throws NewsNameExistException;

    public News findById(Integer id);

    public void removeById(Integer id);



}
