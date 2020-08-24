package com.zte.level_46.backend.controller.vo;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

import java.util.Date;

/**
 * Author:msy
 * Date:2020-07-31 12:12
 * Description:<描述>
 */
public class PdfVO {
    private Integer id;
    private String name;
    private CommonsMultipartFile file;
    private Integer status;
    private Date gmtCreate;
    private Date gmtModify;

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

    public CommonsMultipartFile getFile() {
        return file;
    }

    public void setFile(CommonsMultipartFile file) {
        this.file = file;
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

    public Date getGmtModifiy() {
        return gmtModify;
    }

    public void setGmtModifiy(Date gmtModify) {
        this.gmtModify = gmtModify;
    }

    public PdfVO() {
    }

    public PdfVO(Integer id, String name, CommonsMultipartFile file, Integer status, Date gmtCreate, Date gmtModify) {
        this.id = id;
        this.name = name;
        this.file = file;
        this.status = status;
        this.gmtCreate = gmtCreate;
        this.gmtModify = gmtModify;
    }

    @Override
    public String toString() {
        return "PdfVO{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", file=" + file +
                ", status=" + status +
                ", gmtCreate=" + gmtCreate +
                ", gmtModify=" + gmtModify +
                '}';
    }
}
