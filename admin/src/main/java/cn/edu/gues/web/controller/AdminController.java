package cn.edu.gues.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * AdminController
 *
 * @author lulu
 * @date 2019-05-16
 **/
@Controller
@RequestMapping("/Admin")
public class AdminController {

    @RequestMapping("/indexTeacher.do")
    public ModelAndView indexTeacher(){
        return new ModelAndView("indexTeacher");
    }
}
