package com.zte.level_46.backend.controller;

import com.github.pagehelper.PageInfo;
import com.zte.level_46.constants.Constant;
import com.zte.level_46.entity.News;
import com.zte.level_46.exception.NewsNameExistException;
import com.zte.level_46.service.NewsService;
import com.zte.level_46.utils.ResponseResult;
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
 * Date:2020-06-30 10:45
 * Description:<描述>
 */
@Controller
@RequestMapping("/backend/news")
public class NewsController {

    @Autowired
    private NewsService newsService;

    @RequestMapping("/findAll")
    public String findAll(Integer pageNum, Model model){
        if(ObjectUtils.isEmpty(pageNum)){
            pageNum = Constant.PAGE_NUM;
        }

        //查找所有商品类型
        PageInfo<News> pageInfo = newsService.findAll(pageNum,Constant.PAGE_SIZE);
        //将集合放入作用域
        model.addAttribute("data",pageInfo);
        return "newsManager";
    }

    @RequestMapping("/add")
    public String add(News news, Model model){
        news.setGmtCreate(new Date());
        news.setGmtModified(new Date());;
        try {
            newsService.add(news);
            model.addAttribute("successMsg","添加成功");
        }catch (NewsNameExistException e){
            model.addAttribute("errorMsg",e.getMessage());
        }
        return  "forward:findAll";
    }

    @RequestMapping("/findById")
    @ResponseBody
    public ResponseResult findById(Integer id){
        News news=newsService.findById(id);
        return ResponseResult.success(news);
    }

    @RequestMapping("/modify")
    public String modify(News news,Model model,Integer pageNum){
        news.setGmtModified(new Date());
        try {
            newsService.modify(news);
            model.addAttribute("successMsg","修改成功");
        } catch (NewsNameExistException e) {
            e.printStackTrace();
            model.addAttribute("errorMsg",e.getMessage());
        }
        return "forward:findAll?pageNum="+pageNum;
    }

    @RequestMapping("/checkName")
    @ResponseBody
    public Map<String,Object> checkName(String title){

        Map<String,Object> map=  new HashMap<>();
        boolean res=newsService.checkTitle(title);
        //如果名字不存在，可用
        if(res){
            map.put("valid",true);
        }
        else{
            //不可用，需要设置valid和message两个属性，remote.js会自动读取这两个值，当valid值为false时，输出message所对应的值
            map.put("valid",false);
            map.put("message","标题("+title+")已经存在");
        }

        return  map;

    }

    @RequestMapping("/removeById")
    @ResponseBody
    public ResponseResult removeById(int id){
        try {
            newsService.removeById(id);
            return ResponseResult.success("删除成功");
        } catch (Exception e) {
            //e.printStackTrace();
            return ResponseResult.fail("删除失败");
        }

    }

}
