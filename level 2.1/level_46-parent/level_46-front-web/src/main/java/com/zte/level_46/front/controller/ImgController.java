package com.zte.level_46.front.controller;

import com.zte.level_46.service.ImgService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Author:msy
 * Date:2020-08-06 22:23
 * Description:<描述>
 */
@Controller
@RequestMapping("/front/Img")
public class ImgController {
    @Autowired
    private ImgService imgService;

    @RequestMapping("/lanrenzhijia01")
    public String findPicture(Model model){
        model.addAttribute("pic", imgService.findById(7).getPath());
        return "Index";
    }
}
