package com.zte.level_46.service.Dto;

import java.io.InputStream;
import java.util.Date;

/**
 * Author:msy
 * Date:2020-07-31 12:17
 * Description:<描述>
 */
public class PdfDto {
    private Integer id;
    private String name;
    private Integer status;
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

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
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

    public PdfDto() {
    }

    public PdfDto(Integer id, String name, Integer status, Date gmtCreate, Date gmtModify, InputStream inputStream, String fileName, String path) {
        this.id = id;
        this.name = name;
        this.status = status;
        this.gmtCreate = gmtCreate;
        this.gmtModify = gmtModify;
        this.inputStream = inputStream;
        this.fileName = fileName;
        this.path = path;
    }

    @Override
    public String toString() {
        return "PdfDto{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", status=" + status +
                ", gmtCreate=" + gmtCreate +
                ", gmtModify=" + gmtModify +
                ", inputStream=" + inputStream +
                ", fileName='" + fileName + '\'' +
                ", path='" + path + '\'' +
                '}';
    }
}
