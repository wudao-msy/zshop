package com.zte.level_46.entity;

import java.io.Serializable;
import java.util.Date;


public class Sysuser implements Serializable {

  private Integer id;
  private String name;
  private String password;
  private Integer isValid;
  private Date gmtCreate;
  private Date gmtModified;

  private Exam exam;

  private News news;

  public Sysuser() {
  }

  public Sysuser(Integer id, String name, String password, Integer isValid, Date gmtCreate, Date gmtModified) {
    this.id = id;
    this.name = name;
    this.password = password;
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

  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
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

  public Exam getExam() {
    return exam;
  }

  public void setExam(Exam exam) {
    this.exam = exam;
  }

  public News getNews() {
    return news;
  }

  public void setNews(News news) {
    this.news = news;
  }
}
