package com.zte.level_46.vo;

import java.io.Serializable;
import java.util.Date;

/**
 * Author:msy
 * Date:2020-07-02 13:31
 * Description:<描述>
 */
public class StudentVO implements Serializable {
    private String name;
    private String password;
    private String phone;
    private String email;
    private String cert;
    private Integer isValid;
    private Date gmtCreate;
    private Date gmtModified;

    public StudentVO() {
    }

    public StudentVO(String name, String password, String phone, String email, String cert, Integer isValid, Date gmtCreate, Date gmtModified) {
        this.name = name;
        this.password = password;
        this.phone = phone;
        this.email = email;
        this.cert = cert;
        this.isValid = isValid;
        this.gmtCreate = gmtCreate;
        this.gmtModified = gmtModified;
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

    public String getCert() {
        return cert;
    }

    public void setCert(String cert) {
        this.cert = cert;
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
        return "StudentVO{" +
                "name='" + name + '\'' +
                ", password='" + password + '\'' +
                ", phone='" + phone + '\'' +
                ", email='" + email + '\'' +
                ", cert='" + cert + '\'' +
                ", isValid=" + isValid +
                ", gmtCreate=" + gmtCreate +
                ", gmtModified=" + gmtModified +
                '}';
    }
}
