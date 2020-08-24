package com.zte.level_46.front.controller;

import com.zte.level_46.entity.Student;
import com.zte.level_46.exception.LoginErrorException;
import com.zte.level_46.service.StudentService;
import com.zte.level_46.utils.ResponseResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * Author:msy
 * Date:2020-08-22 10:55
 * Description:<描述>
 */
@Controller
@RequestMapping("/front/plug")
public class PlugController {


    @Autowired
    private StudentService studentService;

    @RequestMapping("/VerifyPassport")
    public String VerifyPassport(){
        return "VerifyPassport";
    }

    @RequestMapping("/loginByAccount")
    public String login(String email, String password, HttpSession session, Model model) {

        try {
            Student student=studentService.login(email,password);
            session.setAttribute("student",student);
            return "bao";
        } catch (LoginErrorException e) {
            //e.printStackTrace();
            model.addAttribute("errorMsg",e.getMessage());
            return "VerifyPassport";
        }
    }

    @RequestMapping("loginOut")
    @ResponseBody
    public ResponseResult loginOut(HttpSession session){
        //清除session
        //session.invalidate();
        session.removeAttribute("student");
        return ResponseResult.success("退出成功");
    }

    @RequestMapping("DetailsAG")
    public String DetailsAG(){
        return "DeatilsAG";
    }
}

