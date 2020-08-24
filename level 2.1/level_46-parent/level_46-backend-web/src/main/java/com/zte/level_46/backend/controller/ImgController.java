package com.zte.level_46.backend.controller;

import com.github.pagehelper.PageInfo;
import com.zte.level_46.backend.controller.vo.ImgVO;
import com.zte.level_46.constants.Constant;
import com.zte.level_46.entity.Img;
import com.zte.level_46.service.Dto.ImgDto;
import com.zte.level_46.service.ImgService;
import com.zte.level_46.utils.ResponseResult;
import org.apache.commons.beanutils.PropertyUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * Author:msy
 * Date:2020-07-29 17:11
 * Description:<描述>
 */
@Controller
@RequestMapping("/backend/img")
public class ImgController {
    
    @Autowired
    private ImgService imgService;


    @RequestMapping("/findAll")
    public String findAll(Integer pageNum, Model model){
        if(ObjectUtils.isEmpty(pageNum)){
            pageNum = Constant.PAGE_NUM;
        }

        //查找所有商品类型
        PageInfo<Img> pageInfo = imgService.findAll(pageNum,Constant.PAGE_SIZE);
        //将集合放入作用域
        model.addAttribute("data",pageInfo);
        return "imgManager";
    }

    @RequestMapping("/add")
    //将图片上传至ftp服务器
    public String add(ImgVO imgVO,Integer pageNum, Model model){
        ImgDto imgDto=  new ImgDto();
        try {
            //将vo中的值拷贝到dto,注意：这里只有属性名称一致的才能被拷贝
            PropertyUtils.copyProperties(imgDto,imgVO);
            imgDto.setFileName(imgVO.getFile().getOriginalFilename());
            imgDto.setInputStream(imgVO.getFile().getInputStream());
            imgDto.setGmtCreate(new Date());
            imgDto.setGmtModify(new Date());
            imgService.add(imgDto);
            model.addAttribute("successMsg","添加成功");

        }
        catch (Exception e){
            model.addAttribute("errorMsg",e.getMessage());

        }
        //转到到产品列表页
        return  "forward:findAll?pageNum="+pageNum;
    }



    @RequestMapping("/findById")
    @ResponseBody
    public ResponseResult findById(Integer id){
        Img img=imgService.findById(id);
        return ResponseResult.success(img);
    }

    @RequestMapping("/modify")
    public String modify(ImgVO imgVO,Integer pageNum, Model model){

        ImgDto imgDto=  new ImgDto();
        try {
            //将vo中的值拷贝到dto,注意：这里只有属性名称一致的才能被拷贝
            PropertyUtils.copyProperties(imgDto,imgVO);
            imgDto.setFileName(imgVO.getFile().getOriginalFilename());
            imgDto.setInputStream(imgVO.getFile().getInputStream());
            imgDto.setGmtModify(new Date());
            imgService.modify(imgDto);
            model.addAttribute("successMsg","修改成功");

        }
        catch (Exception e){
            model.addAttribute("errorMsg",e.getMessage());

        }
        //转到到产品列表页
        return  "forward:findAll?pageNum="+pageNum;
    }

    @RequestMapping("/checkName")
    @ResponseBody
    public Map<String,Object> checkName(String name){

        Map<String,Object> map=  new HashMap<>();
        boolean res=imgService.checkName(name);
        //如果名字不存在，可用
        if(res){
            map.put("valid",true);
        }
        else{
            //不可用，需要设置valid和message两个属性，remote.js会自动读取这两个值，当valid值为false时，输出message所对应的值
            map.put("valid",false);
            map.put("message","标题("+name+")已经存在");
        }

        return  map;

    }

    @RequestMapping("/removeById")
    @ResponseBody
    public ResponseResult removeById(int id){
        try {
            imgService.removeById(id);
            return ResponseResult.success("删除成功");
        } catch (Exception e) {
            //e.printStackTrace();
            return ResponseResult.fail("删除失败");
        }

    }


    
}
