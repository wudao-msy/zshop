package com.zte.level_46.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zte.level_46.dao.ImgDAO;
import com.zte.level_46.entity.Img;
import com.zte.level_46.exception.ImgNameExistException;
import com.zte.level_46.service.Dto.ImgDto;
import com.zte.level_46.service.ImgService;
import com.zte.level_46.utils.FtpUtil;
import com.zte.level_46.utils.JedisClients;
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
public class ImgServiceImpl implements ImgService {

    @Autowired
    private ImgDAO imgDAO;

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
    public PageInfo<Img> findAll(Integer page, Integer rows) {
        PageHelper.startPage(page,rows);
        List<Img> imgs = imgDAO.selectAll();
        PageInfo<Img> pageInfo = new PageInfo<>(imgs);
        return pageInfo;
    }

    @Override
    public void add(ImgDto imgDto) throws IOException,ImgNameExistException {
        Img p=imgDAO.selectByName(imgDto.getName());
        if(p!=null&&!(p.getName().equals(imgDto.getName()))){
            throw new ImgNameExistException("标题已经存在");
        }
        //String suffix = imgDto.getFileName().substring(imgDto.getFileName().lastIndexOf(".") + 1);
        String fileName = UUID.randomUUID()+imgDto.getFileName().substring(imgDto.getFileName().lastIndexOf("."));
        //String savePath=basePath+filePath + "/" + imgDto.getName();
        imgDto.setPath("http://"+host+"/"+fileName);
        boolean flag=FtpUtil.uploadFile(host, port, username, password, basePath, filePath, fileName, imgDto.getInputStream());
        if(!flag){
            throw new IOException("上传失败");
        }

        Img img=new Img();
        try{
            //填充id,name,path,status
            PropertyUtils.copyProperties(img,imgDto);
            imgDAO.insert(img);
        }catch (Exception e) {
            e.printStackTrace();
        }

    }

    @Override
    public boolean checkName(String name){
        Img img=imgDAO.selectByName(name);
        if(img!=null){
            return false;
        }
        return true;
    }

    @Override
    public void modify(ImgDto imgDto) throws IOException,ImgNameExistException {
        Img p=imgDAO.selectByName(imgDto.getName());
        if(p!=null&&!(p.getName().equals(imgDto.getName()))){
            throw new ImgNameExistException("标题已经存在");
        }
        String fileName = UUID.randomUUID()+imgDto.getFileName().substring(imgDto.getFileName().lastIndexOf("."));
        //String savePath=basePath+filePath + "/" + imgDto.getName();
        imgDto.setPath("http://"+host+"/"+fileName);
        boolean flag=FtpUtil.uploadFile(host, port, username, password, basePath, filePath, fileName, imgDto.getInputStream());
        if(!flag){
            throw new IOException("上传失败");
        }

        Img img=new Img();
        try{
            //填充id,name,path,status
            PropertyUtils.copyProperties(img,imgDto);
            imgDAO.update(img);
        }catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public Img findById(Integer id) {
        if (JedisClients.exists("lanrenzhijia01")) {
            // 如果存在取出,取出后判断是否为null或""
            String value = JedisClients.get("lanrenzhijia01");
            Img i = new Img();
            i.setPath(value);
            return i;
        } else{
            JedisClients.set("lanrenzhijia01", imgDAO.selectById(id).getPath());
            return imgDAO.selectById(id);
        }
    }

    @Override
    public void removeById(Integer id){
        imgDAO.deteleById(id);
    }





}
