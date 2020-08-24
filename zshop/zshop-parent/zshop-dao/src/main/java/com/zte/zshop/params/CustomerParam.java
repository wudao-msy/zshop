package com.zte.zshop.params;

/**
 * Author:msy
 * Date:2020-06-12 15:00
 * Description:<描述>
 */
public class CustomerParam {
    private String name;
    private String loginName;
    private String phone;
    private String address;
    private Integer isValid;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLoginName() {
        return loginName;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Integer getIsValid() {
        return isValid;
    }

    public void setIsValid(Integer isValid) {
        this.isValid = isValid;
    }

    public CustomerParam() {
    }

    public CustomerParam(String name, String loginName, String phone, String address, Integer isValid) {
        this.name = name;
        this.loginName = loginName;
        this.phone = phone;
        this.address = address;
        this.isValid = isValid;
    }

    @Override
    public String toString() {
        return "CustomerParam{" +
                "name='" + name + '\'' +
                ", loginName='" + loginName + '\'' +
                ", phone='" + phone + '\'' +
                ", address='" + address + '\'' +
                ", isValid=" + isValid +
                '}';
    }
}
