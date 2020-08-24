package com.zte.level_46.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * Author:msy
 * Date:2020-07-29 17:20
 * Description:<描述>
 */
public class Pdf implements Serializable {
    private Integer id;
    private String name;
    private String path;
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

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
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

    public Pdf() {
    }

    public Pdf(Integer id, String name, String path, Integer status, Date gmtCreate, Date gmtModify) {
        this.id = id;
        this.name = name;
        this.path = path;
        this.status = status;
        this.gmtCreate = gmtCreate;
        this.gmtModify = gmtModify;
    }

    @Override
    public String toString() {
        return "Pdf{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", path='" + path + '\'' +
                ", status=" + status +
                ", gmtCreate=" + gmtCreate +
                ", gmtModify=" + gmtModify +
                '}';
    }
}
