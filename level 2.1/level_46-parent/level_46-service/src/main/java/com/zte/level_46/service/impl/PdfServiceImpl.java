package com.zte.level_46.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zte.level_46.dao.PdfDAO;
import com.zte.level_46.entity.Pdf;
import com.zte.level_46.exception.PdfNameExistException;
import com.zte.level_46.service.Dto.PdfDto;
import com.zte.level_46.service.PdfService;
import com.zte.level_46.utils.FtpUtil;
import org.apache.commons.beanutils.PropertyUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.io.IOException;
import java.util.List;
import java.util.UUID;

/**
 * Author:msy
 * Date:2020-06-30 10:45
 * Description:<描述>
 */
@Service
@Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
public class PdfServiceImpl implements PdfService {

    @Autowired
    private PdfDAO pdfDAO;

    @Value("${ftpclient.host}")
    private String host;
    @Value("${ftpclient.port}")
    private int port;
    @Value("${ftpclient.username}")
    private String username;
    @Value("${ftpclient.password}")
    private String password;
    @Value("${ftpclient.basePath}")
    private String basePath;
    @Value("${ftpclient.filepath}")
    private String filePath;

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public PageInfo<Pdf> findAll(Integer page, Integer rows) {
        PageHelper.startPage(page,rows);
        List<Pdf> pdfs = pdfDAO.selectAll();
        PageInfo<Pdf> pageInfo = new PageInfo<>(pdfs);
        return pageInfo;
    }

    @Override
    public void add(PdfDto pdfDto) throws IOException,PdfNameExistException {
        Pdf p=pdfDAO.selectByName(pdfDto.getName());
        if(p!=null&&!(p.getName().equals(pdfDto.getName()))){
            throw new PdfNameExistException("标题已经存在");
        }
        //String suffix = pdfDto.getFileName().substring(pdfDto.getFileName().lastIndexOf(".") + 1);
        String fileName = UUID.randomUUID()+pdfDto.getFileName().substring(pdfDto.getFileName().lastIndexOf("."));
        //String savePath=basePath+filePath + "/" + pdfDto.getName();
        pdfDto.setPath("http://"+host+"/"+fileName);
        boolean flag=FtpUtil.uploadFile(host, port, username, password, basePath, filePath, fileName, pdfDto.getInputStream());
        if(!flag){
            throw new IOException("上传失败");
        }

        Pdf pdf=new Pdf();
        try{
            //填充id,name,path,status
            PropertyUtils.copyProperties(pdf,pdfDto);
            pdfDAO.insert(pdf);
        }catch (Exception e) {
            e.printStackTrace();
        }

    }

    @Override
    public boolean checkName(String name){
        Pdf pdf=pdfDAO.selectByName(name);
        if(pdf!=null){
            return false;
        }
        return true;
    }

    @Override
    public void modify(PdfDto pdfDto) throws IOException,PdfNameExistException {
        Pdf p=pdfDAO.selectByName(pdfDto.getName());
        if(p!=null&&!(p.getName().equals(pdfDto.getName()))){
            throw new PdfNameExistException("标题已经存在");
        }
        String fileName = UUID.randomUUID()+pdfDto.getFileName().substring(pdfDto.getFileName().lastIndexOf("."));
        //String savePath=basePath+filePath + "/" + pdfDto.getName();
        pdfDto.setPath("http://"+host+"/"+fileName);
        boolean flag=FtpUtil.uploadFile(host, port, username, password, basePath, filePath, fileName, pdfDto.getInputStream());
        if(!flag){
            throw new IOException("上传失败");
        }

        Pdf pdf=new Pdf();
        try{
            //填充id,name,path,status
            PropertyUtils.copyProperties(pdf,pdfDto);
            pdfDAO.update(pdf);
        }catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public Pdf findById(Integer id) {
        return pdfDAO.selectById(id);
    }

    @Override
    public void removeById(Integer id){
        pdfDAO.deteleById(id);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<Pdf> findByStatus(Integer status) {
        return pdfDAO.selectByStatus(status);
    }



}
