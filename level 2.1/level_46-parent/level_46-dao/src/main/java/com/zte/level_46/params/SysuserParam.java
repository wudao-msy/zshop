package com.zte.level_46.params;

/**
 * Author:helloboy
 * Date:2020-06-09 9:11
 * Description:<描述>
 * 该类用于封装查询所需的字段
 */
public class SysuserParam {

    //注意：这里的属性必须和对应的表单的元素的name属性值一致，这样springmvc才能完成注入
    private String name;

    private String loginName;

    private String phone;

    private Integer roleId;

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

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    public Integer getIsValid() {
        return isValid;
    }

    public void setIsValid(Integer isValid) {
        this.isValid = isValid;
    }
}
