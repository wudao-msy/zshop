package com.zte.level_46.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * Author:msy
 * Date:2020-06-27 18:13
 * Description:<描述>
 */
public class Exam implements Serializable {
    private Integer id;
    private String name;
    private String play;
    private Integer kind;
    private Integer isValid;
    private Date gmtCreate;
    private Date gmtModified;

    public Exam() {
    }

    public Exam(Integer id, String name, String play, Integer kind, Integer isValid, Date gmtCreate, Date gmtModified) {
        this.id = id;
        this.name = name;
        this.play = play;
        this.kind = kind;
        this.isValid = isValid;
        this.gmtCreate = gmtCreate;
        this.gmtModified = gmtModified;
    }

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

    public String getPlay() {
        return play;
    }

    public void setPlay(String play) {
        this.play = play;
    }

    public Integer getKind() {
        return kind;
    }

    public void setKind(Integer kind) {
        this.kind = kind;
    }

    public Integer getIsValid() {
        return isValid;
    }

    public void setIsValid(Integer isValid) {
        this.isValid = isValid;
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

    @Override
    public String toString() {
        return "Exam{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", play='" + play + '\'' +
                ", kind=" + kind +
                ", isValid=" + isValid +
                ", gmtCreate=" + gmtCreate +
                ", gmtModified=" + gmtModified +
                '}';
    }
}
