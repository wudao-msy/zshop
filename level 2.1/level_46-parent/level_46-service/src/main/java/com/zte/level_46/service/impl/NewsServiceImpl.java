package com.zte.level_46.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zte.level_46.dao.NewsDAO;
import com.zte.level_46.entity.News;
import com.zte.level_46.exception.NewsNameExistException;
import com.zte.level_46.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Author:msy
 * Date:2020-06-30 10:45
 * Description:<描述>
 */
@Service
@Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
public class NewsServiceImpl implements NewsService {

    @Autowired
    private NewsDAO newsDAO;

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public PageInfo<News> findAll(Integer page, Integer rows) {
        PageHelper.startPage(page,rows);
        List<News> newss = newsDAO.selectAll();
        PageInfo<News> pageInfo = new PageInfo<>(newss);
        return pageInfo;
    }

    @Override
    public void add(News news) throws NewsNameExistException {
        News c=newsDAO.selectByTitle(news.getTitle());
        if(c!=null){
            throw new NewsNameExistException("标题已经存在");
        }
        newsDAO.insert(news);
    }

    @Override
    public boolean checkTitle(String title){
        News news=newsDAO.selectByTitle(title);
        if(news!=null){
            return false;
        }
        return true;
    }

    @Override
    public void modify(News news) throws NewsNameExistException {
        News c=newsDAO.selectByTitle(news.getTitle());
        if(c!=null&&!(c.getTitle().equals(news.getTitle()))){
            throw new NewsNameExistException("标题已经存在");
        }
        newsDAO.update(news);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public News findById(Integer id) {
        return newsDAO.selectById(id);
    }

    @Override
    public void removeById(Integer id){
        newsDAO.deteleById(id);
    }

}
