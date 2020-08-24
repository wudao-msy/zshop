package com.zte.level_46.front.controller;

import com.zte.level_46.constants.Constant;
import com.zte.level_46.entity.Exam;
import com.zte.level_46.entity.Student;
import com.zte.level_46.exception.LoginErrorException;
import com.zte.level_46.service.ExamService;
import com.zte.level_46.service.StudentService;
import com.zte.level_46.utils.ResponseResult;
import com.zte.level_46.vo.StudentVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Author:msy
 * Date:2020-07-01 14:45
 * Description:<描述>
 */
@Controller
@RequestMapping("/front/student")
public class StudentController {

    @Autowired
    private StudentService studentService;

    @Autowired
    private ExamService examService;

    @ModelAttribute("examPlays")
    //执行该路径下所有请求，都会先执行ModelAttribute对应的方法，返回值会赋值给ModelAttribute对应的key
    public List<Exam> loadExamPalys(){
        List<Exam> examPlays= examService.findEnable(Constant.EXAM_ENABLE);
        return examPlays;
    }

    @RequestMapping("/main")
    public String main(){
        return "main";
    }


    @RequestMapping("/checkName")
    @ResponseBody
    public Map<String,Object> checkName(String name){

        Map<String,Object> map=  new HashMap<>();
        boolean res=studentService.checkName(name);
        //如果名字不存在，可用
        if(res){
            map.put("valid",true);
        }
        else{
            //不可用，需要设置valid和message两个属性，remote.js会自动读取这两个值，当valid值为false时，输出message所对应的值
            map.put("valid",false);
            map.put("message","用户("+name+")已经存在");
        }

        return  map;

    }


    @RequestMapping("/loginByAccount")
    public String login(String email, String password,HttpSession session,Model model) {

        try {
            Student student=studentService.login(email,password);
            session.setAttribute("student",student);
            return "studentDetail";
        } catch (LoginErrorException e) {
            //e.printStackTrace();
            model.addAttribute("errorMsg",e.getMessage());
            return "main";
        }
    }

    //退出
    @RequestMapping("/loginOut")
    @ResponseBody
    public ResponseResult loginOut(HttpSession session){
        //清除session
        //session.invalidate();
        session.removeAttribute("student");
        return ResponseResult.success("退出成功");

    }

    @RequestMapping("/toRegist")
    public String toRegist(){
        return "regist";
    }

    @RequestMapping("/add")
    public String add(StudentVO student, Model model){
        student.setGmtCreate(new Date());
        student.setGmtModified(new Date());
        student.setIsValid(Constant.STUDENT_ENABLE);
        if(student.getCert().equals("")){
            student.setCert(null);
        }
        if(student.getName().equals("")){
            student.setName(null);
        }
        try {
            studentService.addStudent(student);
            model.addAttribute("successMsg","添加成功");
        }catch (Exception e){
            model.addAttribute("errorMsg","添加失败");
        }
        return  "forward:main";
    }

    @RequestMapping("/modifyDetail")

    public String modifyDetail(StudentVO student, Model model){
        student.setGmtModified(new Date());
        try {
            studentService.modifyDetail(student);
            model.addAttribute("successMsg","更新成功");
        }catch (Exception e){
            model.addAttribute("errorMsg","更新失败");
        }
        return  "studentDetail";
    }

    @RequestMapping("/modifyPassword")

    public String modifyPassword(String email, String password, Model model){
        try {
            studentService.modifyPassword(email,password);
            model.addAttribute("successMsg","更新成功");
        }catch (Exception e){
            model.addAttribute("errorMsg","更新失败");
        }
        return  "studentDetail";
    }


    @RequestMapping("/select")
    public String select(){
        return "center";
    }

    @RequestMapping("/findScore")
    public String findScore(String ke, String name, Integer eid, Model model,HttpSession session){
        try {
            if(ke.equals("")||name.equals("")){
                model.addAttribute("errorMsg","查询错误");
                return "center";
            }else{
                Student student=studentService.findScore(ke,name,eid);
                session.setAttribute("student",student);
                return "scoreDetail";
            }
        } catch (Exception e) {
            //e.printStackTrace();
            model.addAttribute("errorMsg","查询错误");
            return "center";
        }
    }


}
