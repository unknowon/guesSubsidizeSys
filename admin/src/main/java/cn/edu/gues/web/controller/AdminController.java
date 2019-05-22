package cn.edu.gues.web.controller;

import cn.edu.gues.mapper.SubsidizeInfoMapper;
import cn.edu.gues.pojo.AdminUser;
import cn.edu.gues.pojo.User;
import cn.edu.gues.service.SubsidizeInfoService;
import cn.edu.gues.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

/**
 * AdminController
 *
 * @author lulu
 * @date 2019-05-16
 **/
@Controller
@RequestMapping("/Admin")
public class AdminController {

    @Autowired
    private SubsidizeInfoService subsidizeInfoService;

    @Autowired
    private UserService userService;

    @RequestMapping("/indexTeacher.do")
    public ModelAndView indexTeacher(){
        return new ModelAndView("indexTeacher");
    }

    @RequestMapping(value = "/teaCheck.do", method = RequestMethod.GET)
    public ModelAndView teaCheck(int checkStatus, String name, Date year, HttpServletRequest request){

        


        return new ModelAndView("teacher/teaCheck");
    }
}