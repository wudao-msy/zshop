package com.zte.level_46.service;

import com.github.pagehelper.PageInfo;
import com.zte.level_46.entity.Img;
import com.zte.level_46.exception.ImgNameExistException;
import com.zte.level_46.service.Dto.ImgDto;

import java.io.IOException;


/**
 * Author:msy
 * Date:2020-07-29 17:15
 * Description:<描述>
 */
public interface ImgService {

    public PageInfo<Img> findAll(Integer page, Integer rows);

    public void add(ImgDto imgDto) throws IOException,ImgNameExistException;

    public boolean checkName(String name);

    public void modify(ImgDto pdfDto) throws IOException,ImgNameExistException;

    public Img findById(Integer id);

    public void removeById(Integer id);



}
