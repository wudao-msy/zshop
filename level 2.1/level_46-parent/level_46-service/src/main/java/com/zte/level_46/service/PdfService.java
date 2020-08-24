package com.zte.level_46.service;

import com.github.pagehelper.PageInfo;
import com.zte.level_46.entity.Pdf;
import com.zte.level_46.exception.PdfNameExistException;
import com.zte.level_46.service.Dto.PdfDto;

import java.io.IOException;
import java.util.List;


/**
 * Author:msy
 * Date:2020-07-29 17:15
 * Description:<描述>
 */
public interface PdfService {

    public PageInfo<Pdf> findAll(Integer page, Integer rows);

    public void add(PdfDto pdfDto) throws IOException,PdfNameExistException;

    public boolean checkName(String name);

    public void modify(PdfDto pdfDto) throws IOException,PdfNameExistException;

    public Pdf findById(Integer id);

    public void removeById(Integer id);

    public List<Pdf> findByStatus(Integer status);


}
