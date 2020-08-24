package com.zte.level_46.entity;


import java.io.Serializable;
import java.util.Date;

public class Student implements Serializable {

  private Integer id;
  private String name;
  private String password;
  private Integer sex;
  private String phone;
  private String email;
  private String cert;
  private Integer isValid;
  private Date gmtCreate;
  private Date gmtModified;

  private Exam exam;

  private Score score;


  public Student() {
  }

  public Student(Integer id, String name, String password, Integer sex,String phone, String email, String cert, Integer isValid, Date gmtCreate, Date gmtModified) {
    this.id = id;
    this.name = name;
    this.password = password;
    this.sex=sex;
    this.phone = phone;
    this.email = email;
    this.cert = cert;
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

  public Integer getSex() {
    return sex;
  }

  public void setSex(Integer sex) {
    this.sex = sex;
  }

  public String getPhone() {
    return phone;
  }

  public void setPhone(String phone) {
    this.phone = phone;
  }

  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
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

  public String getCert() {
    return cert;
  }

  public void setCert(String cert) {
    this.cert = cert;
  }

  public Exam getExam() {
    return exam;
  }

  public void setExam(Exam exam) {
    this.exam = exam;
  }

  public Score getScore() {
    return score;
  }

  public void setScore(Score score) {
    this.score = score;
  }

    @Override
    public String toString() {
        return "Student{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", password='" + password + '\'' +
                ", sex=" + sex +
                ", phone='" + phone + '\'' +
                ", email='" + email + '\'' +
                ", cert='" + cert + '\'' +
                ", isValid=" + isValid +
                ", gmtCreate=" + gmtCreate +
                ", gmtModified=" + gmtModified +
                ", exam=" + exam +
                ", score=" + score +
                '}';
    }
}
