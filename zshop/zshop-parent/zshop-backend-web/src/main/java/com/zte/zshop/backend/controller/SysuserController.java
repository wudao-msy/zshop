package com.zte.zshop.backend.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zte.zshop.constants.Constant;
import com.zte.zshop.entity.Role;
import com.zte.zshop.entity.Sysuser;
import com.zte.zshop.exception.SysuserNotExistException;
import com.zte.zshop.params.SysuserParam;
import com.zte.zshop.service.RoleService;
import com.zte.zshop.service.SysuserService;
import com.zte.zshop.service.vo.SysuserVO;
import com.zte.zshop.utils.ResponseResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Author:msy
 * Date:2020-05-19 9:09
 * Description:<描述>
 */
@Controller
@RequestMapping("/backend/sysuser")
public class SysuserController {

    @Autowired
    private SysuserService sysuserService;

    @Autowired
    private RoleService roleService;

    @ModelAttribute("roles")
    public List<Role> loadRoles(){
        return roleService.findAll();
    }

    @RequestMapping("/login")
    public String login(String loginName,String password,HttpSession session,Model model){
        try {
            Sysuser sysuser=sysuserService.login(loginName, password);
            //将该用户存入session作用域
            session.setAttribute("sysuser",sysuser);

            //返回视图名
            return "main";
        } catch (SysuserNotExistException e) {
            //e.printStackTrace();
            model.addAttribute("errorMsg",e.getMessage());
            return "login";

        }
    }

    @RequestMapping("/findAll")
    public String findAll(Integer pageNum,Model model){
        if(ObjectUtils.isEmpty(pageNum)){
            pageNum= Constant.PAGE_NUM;
        }
        PageHelper.startPage(pageNum,2);
        List<Sysuser> sysusers = sysuserService.findAll();
        PageInfo<Sysuser> pageInfo = new PageInfo<>(sysusers);
        model.addAttribute("pageInfo",pageInfo);
        return "sysuserManager";

    }

    @RequestMapping("/add")
    @ResponseBody
    public ResponseResult add(SysuserVO sysuserVO){
        try {
            sysuserService.add(sysuserVO);
            return ResponseResult.success("添加成功");
        } catch (Exception e) {
            //e.printStackTrace();
            return ResponseResult.fail("添加失败");

        }

    }

    @RequestMapping("/checkName")
    @ResponseBody
    public Map<String,Object> checkName(String loginName){

        Map<String,Object> map = new HashMap<>();
        boolean res=sysuserService.checkName(loginName);
        //如果名称存在，可用--->返回valid=true,不做校验，否则不可用----->valid=false,message='提示消息',校验器会根据valid值为false,输出meaasge的值
        if(res){
            map.put("valid",true);
        }
        else{
            map.put("valid",false);
            map.put("message","账号("+loginName+")已经存在");
        }
        return map;

    }

    //按条件查询
    @RequestMapping("/findByParams")
    public String findByParams(SysuserParam sysuserParam,Integer pageNum,Model model){
        if(ObjectUtils.isEmpty((pageNum))){
            pageNum=Constant.PAGE_NUM;

        }
        PageHelper.startPage(pageNum,2);
        List<Sysuser> sysusers= sysuserService.findByParams(sysuserParam);
        PageInfo<Sysuser> pageInfo= new PageInfo<>(sysusers);
        model.addAttribute("pageInfo",pageInfo);
        //设置数据回显
        model.addAttribute("sysuserParam",sysuserParam);
        return "sysuserManager";


    }

    //修改用户状态
    @RequestMapping("/modifyStatus")
    @ResponseBody
    public ResponseResult modifyStatus(int id){
        try {
            sysuserService.modifyStatus(id);
            return ResponseResult.success("更新成功");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseResult.fail("更新失败");
        }

    }
}
