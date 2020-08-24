package com.zte.level_46.service.Dto;

import java.io.InputStream;
import java.util.Date;

/**
 * Author:msy
 * Date:2020-07-31 12:17
 * Description:<描述>
 */
public class ImgDto {
    private Integer id;
    private String name;
    private Date gmtCreate;
    private Date gmtModify;

    private InputStream inputStream;
    //文件名称
    public String fileName;
    //文件的上传路径
    private String path;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getGmtCreate() {
        return gmtCreate;
    }

    public void setGmtCreate(Date gmtCreate) {
        this.gmtCreate = gmtCreate;
    }

    public Date getGmtModify() {
        return gmtModify;
    }

    public void setGmtModify(Date gmtModify) {
        this.gmtModify = gmtModify;
    }

    public InputStream getInputStream() {
        return inputStream;
    }

    public void setInputStream(InputStream inputStream) {
        this.inputStream = inputStream;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public ImgDto() {
    }

    public ImgDto(Integer id, String name, Date gmtCreate, Date gmtModify, InputStream inputStream, String fileName, String path) {
        this.id = id;
        this.name = name;
        this.gmtCreate = gmtCreate;
        this.gmtModify = gmtModify;
        this.inputStream = inputStream;
        this.fileName = fileName;
        this.path = path;
    }

    @Override
    public String toString() {
        return "ImgDto{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", gmtCreate=" + gmtCreate +
                ", gmtModify=" + gmtModify +
                ", inputStream=" + inputStream +
                ", fileName='" + fileName + '\'' +
                ", path='" + path + '\'' +
                '}';
    }
}
