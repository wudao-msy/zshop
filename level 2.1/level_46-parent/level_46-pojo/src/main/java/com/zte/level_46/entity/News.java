package com.zte.level_46.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * Author:msy
 * Date:2020-06-28 16:23
 * Description:<描述>
 */
public class News implements Serializable {

    private Integer id;
    private String title;
    private String content;
    private Date gmtCreate;
    private Date gmtModified;

    public News() {
    }

    public News(Integer id, String title, String content, Date gmtCreate, Date gmtModified) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.gmtCreate = gmtCreate;
        this.gmtModified = gmtModified;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getGmtCreate() {
        return gmtCreate;
    }

    public void setGmtCreate(Date gmtCreate) {
        this.gmtCreate = gmtCreate;
    }

    public Date getGmtModified() {
        return gmtModified;
    }

    public void setGmtModified(Date gmtModified) {
        this.gmtModified = gmtModified;
    }
}
