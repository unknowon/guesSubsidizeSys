package cn.edu.gues.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * UserController
 *
 * @author lulu
 * @date 2019-05-06
 **/
@Controller
@RequestMapping("/User")
public class UserController {

    @RequestMapping(value = "stuInformation.do", method = RequestMethod.GET)
    public ModelAndView stuInformation(){

        return new ModelAndView("user/stuInformation");
    }



}
