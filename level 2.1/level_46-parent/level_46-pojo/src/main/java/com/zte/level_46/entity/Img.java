package com.zte.level_46.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * Author:msy
 * Date:2020-08-04 23:20
 * Description:<描述>
 */
public class Img implements Serializable {

    private Integer id;
    private String name;
    private String path;
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

    public Img() {
    }

    public Img(Integer id, String name, String path, Date gmtCreate, Date gmtModify) {
        this.id = id;
        this.name = name;
        this.path = path;
        this.gmtCreate = gmtCreate;
        this.gmtModify = gmtModify;
    }

    @Override
    public String toString() {
        return "Img{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", path='" + path + '\'' +
                ", gmtCreate=" + gmtCreate +
                ", gmtModify=" + gmtModify +
                '}';
    }
}
