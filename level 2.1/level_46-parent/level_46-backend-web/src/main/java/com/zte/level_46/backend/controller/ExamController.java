package com.zte.level_46.backend.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zte.level_46.constants.Constant;
import com.zte.level_46.entity.Exam;
import com.zte.level_46.exception.ExamNameExistException;
import com.zte.level_46.params.ExamParam;
import com.zte.level_46.service.ExamService;
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
 * Date:2020-06-30 10:45
 * Description:<描述>
 */
@Controller
@RequestMapping("/backend/exam")
public class ExamController {

    @Autowired
    private ExamService examService;


    @ModelAttribute("examPlays")
    //执行该路径下所有请求，都会先执行ModelAttribute对应的方法，返回值会赋值给ModelAttribute对应的key
    public List<Exam> loadExamPalys(){
        List<Exam> examPlays= examService.findEnable(Constant.EXAM_ENABLE);
        return examPlays;
    }

    @RequestMapping("/findAll")
    public String findAll(Integer pageNum, Model model){
        if(ObjectUtils.isEmpty(pageNum)){
            pageNum = Constant.PAGE_NUM;
        }

        //查找所有商品类型
        PageInfo<Exam> pageInfo = examService.findAll(pageNum,Constant.PAGE_SIZE);
        //将集合放入作用域
        model.addAttribute("data",pageInfo);
        return "examManager";
    }

    @RequestMapping("/add")
    public String add(Exam exam, Model model){
        exam.setGmtCreate(new Date());
        exam.setGmtModified(new Date());
        exam.setIsValid(Constant.EXAM_ENABLE);
        try {
            examService.add(exam);
            model.addAttribute("successMsg","添加成功");
        }catch (ExamNameExistException e){
            model.addAttribute("errorMsg",e.getMessage());
        }
        return  "forward:findAll";
    }

    @RequestMapping("/findById")
    @ResponseBody
    public ResponseResult findById(Integer id){
        Exam exam=examService.findById(id);
        return ResponseResult.success(exam);
    }

    @RequestMapping("/modify")
    public String modify(Exam exam,Model model,Integer pageNum){
        exam.setGmtModified(new Date());
        try {
            examService.modify(exam);
            model.addAttribute("successMsg","修改成功");
        } catch (ExamNameExistException e) {
            e.printStackTrace();
            model.addAttribute("errorMsg",e.getMessage());
        }
        return "forward:findAll?pageNum="+pageNum;
    }

    @RequestMapping("/checkName")
    @ResponseBody
    public Map<String,Object> checkName(String name){

        Map<String,Object> map=  new HashMap<>();
        boolean res=examService.checkName(name);
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

    @RequestMapping("/findByParams")
    public String findByParams(ExamParam examParam, Integer pageNum, Model model)
    {
        if(ObjectUtils.isEmpty(pageNum)){
            pageNum=Constant.PAGE_NUM;
        }
        PageHelper.startPage(pageNum,5);
        List<Exam> exams=examService.findByParams(examParam);
        PageInfo<Exam> pageInfo=new PageInfo<>(exams);
        model.addAttribute("data",pageInfo);
        model.addAttribute("examParam",examParam);

        return "examManager";
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
            examService.modifyStatus(id,isValid);
            return ResponseResult.success("更新成功");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseResult.fail("更新失败");
        }

    }

}
