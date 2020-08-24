package com.zte.level_46.backend.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zte.level_46.constants.Constant;
import com.zte.level_46.entity.Exam;
import com.zte.level_46.entity.Score;
import com.zte.level_46.entity.Student;
import com.zte.level_46.exception.StudentNameExistException;
import com.zte.level_46.params.StudentParam;
import com.zte.level_46.service.ExamService;
import com.zte.level_46.service.ScoreService;
import com.zte.level_46.service.StudentService;
import com.zte.level_46.utils.ResponseResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Author:msy
 * Date:2020-06-29 0:20
 * Description:<描述>
 */
@Controller
@RequestMapping("/backend/student")
public class StudentController {
    @Autowired
    private StudentService studentService;

    @Autowired
    private ExamService examService;

    @Autowired
    private ScoreService scoreService;

    @ModelAttribute("examPlays")
    //执行该路径下所有请求，都会先执行ModelAttribute对应的方法，返回值会赋值给ModelAttribute对应的key
    public List<Exam> loadExamPalys(){
        List<Exam> examPlays= examService.findEnable(Constant.EXAM_ENABLE);
        return examPlays;
    }


    @RequestMapping("/findAll_4")
    public String findAll_4(Integer pageNum, Model model){
        if(ObjectUtils.isEmpty(pageNum)){
            pageNum = Constant.PAGE_NUM;
        }

        //查找所有商品类型
        PageInfo<Student> pageInfo = studentService.findAll_4(pageNum,Constant.PAGE_SIZE);
        //将集合放入作用域
        model.addAttribute("data",pageInfo);
        return "studentManager_4";
    }

    @RequestMapping("/findAll_6")
    public String findAll_6(Integer pageNum, Model model){
        if(ObjectUtils.isEmpty(pageNum)){
            pageNum = Constant.PAGE_NUM;
        }

        //查找所有商品类型
        PageInfo<Student> pageInfo = studentService.findAll_6(pageNum,Constant.PAGE_SIZE);
        //将集合放入作用域
        model.addAttribute("data",pageInfo);
        return "studentManager_6";
    }


    @RequestMapping("/findById")
    @ResponseBody
    public ResponseResult findById(Integer id){
        Student student=studentService.findById(id);
        return ResponseResult.success(student);
    }

    @RequestMapping("/add_4")
    public String add_4(Student student, Model model){
        student.setGmtCreate(new Date());
        student.setGmtModified(new Date());
        student.setIsValid(Constant.STUDENT_ENABLE);
        Score score=new Score();
        score.setKe(student.getScore().getKe());
        score.setAllScores(student.getScore().getAllScores());
        score.setHearing(student.getScore().getHearing());
        score.setReading(student.getScore().getReading());
        score.setWriting(student.getScore().getWriting());
        score.setGmtCreate(new Date());
        score.setGmtModified(new Date());


        try {
            Integer scid=scoreService.add(score);
            student.getScore().setId(scid);
            studentService.add(student);
            model.addAttribute("successMsg","添加成功");
        }catch (StudentNameExistException e){
            model.addAttribute("errorMsg",e.getMessage());
        }
        return  "forward:findAll_4";
    }

    @RequestMapping("/modify_4")
    public String modify_4(Student student,Model model,Integer pageNum){
        student.setGmtModified(new Date());
        Score score=new Score();
        score.setKe(student.getScore().getKe());
        score.setAllScores(student.getScore().getAllScores());
        score.setHearing(student.getScore().getHearing());
        score.setReading(student.getScore().getReading());
        score.setWriting(student.getScore().getWriting());
        score.setGmtModified(new Date());

        try {
            Integer scid=scoreService.add(score);
            student.getScore().setId(scid);
            studentService.modify(student);
            model.addAttribute("successMsg","修改成功");
        } catch (StudentNameExistException e) {
            e.printStackTrace();
            model.addAttribute("errorMsg",e.getMessage());
        }
        return "forward:findAll_4?pageNum="+pageNum;
    }

    @RequestMapping("/add_6")
    public String add_6(Student student, Model model){
        student.setGmtCreate(new Date());
        student.setGmtModified(new Date());
        student.setIsValid(Constant.STUDENT_ENABLE);
        Score score=new Score();
        score.setKe(student.getScore().getKe());
        score.setAllScores(student.getScore().getAllScores());
        score.setHearing(student.getScore().getHearing());
        score.setReading(student.getScore().getReading());
        score.setWriting(student.getScore().getWriting());
        score.setGmtCreate(new Date());
        score.setGmtModified(new Date());


        try {
            Integer scid=scoreService.add(score);
            student.getScore().setId(scid);
            studentService.add(student);
            model.addAttribute("successMsg","添加成功");
        }catch (StudentNameExistException e){
            model.addAttribute("errorMsg",e.getMessage());
        }
        return  "forward:findAll_6";
    }

    @RequestMapping("/modify_6")
    public String modify_6(Student student,Model model,Integer pageNum){
        student.setGmtModified(new Date());
        Score score=new Score();
        score.setKe(student.getScore().getKe());
        score.setAllScores(student.getScore().getAllScores());
        score.setHearing(student.getScore().getHearing());
        score.setReading(student.getScore().getReading());
        score.setWriting(student.getScore().getWriting());
        score.setGmtModified(new Date());

        try {
            Integer scid=scoreService.add(score);
            student.getScore().setId(scid);
            studentService.modify(student);
            model.addAttribute("successMsg","修改成功");
        } catch (StudentNameExistException e) {
            e.printStackTrace();
            model.addAttribute("errorMsg",e.getMessage());
        }
        return "forward:findAll_6?pageNum="+pageNum;
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

    @RequestMapping("/findByParams_4")
    public String findByParams_4(StudentParam studentParam, Integer pageNum, Model model)
    {
        if(ObjectUtils.isEmpty(pageNum)){
            pageNum= Constant.PAGE_NUM;
        }
        PageHelper.startPage(pageNum,5);
        List<Student> students=studentService.findByParams_4(studentParam);
        PageInfo<Student> pageInfo=new PageInfo<>(students);
        model.addAttribute("data",pageInfo);
        model.addAttribute("studentParam",studentParam);

        return "studentManager_4";
    }

    @RequestMapping("/findByParams_6")
    public String findByParams_6(StudentParam studentParam, Integer pageNum, Model model)
    {
        if(ObjectUtils.isEmpty(pageNum)){
            pageNum= Constant.PAGE_NUM;
        }
        PageHelper.startPage(pageNum,5);
        List<Student> students=studentService.findByParams_4(studentParam);
        PageInfo<Student> pageInfo=new PageInfo<>(students);
        model.addAttribute("data",pageInfo);
        model.addAttribute("studentParam",studentParam);

        return "studentManager_6";
    }

    //修改用户状态
    @RequestMapping("/modifyStatus")
    @ResponseBody
    public ResponseResult modifyStatus(Integer id,Integer isValid){
        if(isValid==Constant.CUSTOMER_VALID){
            isValid=Constant.CUSTOMER_INVALID;
        }else if(isValid==Constant.CUSTOMER_INVALID){
            isValid=Constant.CUSTOMER_VALID;
        }
        try {
            studentService.modifyStatus(id,isValid);
            return ResponseResult.success("更新成功");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseResult.fail("更新失败");
        }

    }
}
