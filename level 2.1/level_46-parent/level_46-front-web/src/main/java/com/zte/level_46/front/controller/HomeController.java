package com.zte.level_46.front.controller;

import com.zte.level_46.constants.Constant;
import com.zte.level_46.entity.Pdf;
import com.zte.level_46.service.ImgService;
import com.zte.level_46.service.PdfService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * Author:msy
 * Date:2020-07-22 22:22
 * Description:<描述>
 */
@Controller
@RequestMapping("/front/Home")
public class HomeController {

    @Autowired
    private PdfService pdfService;

    @Autowired
    private ImgService imgService;

    @ModelAttribute("pdf0s")
    public List<Pdf> loadPdf0(){
        List<Pdf> pdf0= pdfService.findByStatus(Constant.HOME_0);
        return pdf0;
    }

    @ModelAttribute("pdf1s")
    public List<Pdf> loadPdf1(){
        List<Pdf> pdf1= pdfService.findByStatus(Constant.HOME_1);
        return pdf1;
    }

    @ModelAttribute("pdf2s")
    public List<Pdf> loadPdf2(){
        List<Pdf> pdf2= pdfService.findByStatus(Constant.HOME_2);
        return pdf2;
    }

    @ModelAttribute("pdf3s")
    public List<Pdf> loadPdf3(){
        List<Pdf> pdf3= pdfService.findByStatus(Constant.HOME_3);
        return pdf3;
    }

    @RequestMapping("/Index")
    public String Index(Model model){
        model.addAttribute("pic", imgService.findById(7).getPath());
        return "Index";
    }

    @RequestMapping("/ExamIntroduction")
    public String ExamIntroduction(){
        return "ExamIntroduction";
    }

    @RequestMapping("/CandidateNotice")
    public String CandidateNotice(){
        return "CandidateNotice";
    }

    @RequestMapping("/TestDatePlan")
    public String TestDatePlan(){
        return "TestDatePlan";
    }

    @RequestMapping("/RegisterFlow")
    public String RegisterFlow(){
        return "RegisterFlow";
    }

    @RequestMapping("/CommonProblem")
    public String CommonProblem(){
        return "CommonProblem";
    }

    @RequestMapping("/DelayTestNotice")
    public String DelayTestNotice(){
        return "DelayTestNotice";
    }

}
