package cn.edu.gues.web.controller;

import cn.edu.gues.pojo.AdminUser;
import cn.edu.gues.pojo.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

/**
 * OtherController
 *
 * @author lulu
 * @date 2019-05-06
 **/
@Controller
public class OtherController {
    @RequestMapping("/")
    public ModelAndView indexStu(HttpServletRequest request){
        AdminUser adminUser = (AdminUser) request.getSession().getAttribute("adminUser");
        User user = (User) request.getSession().getAttribute("user");
        if(adminUser == null && user == null) {
            return new ModelAndView("redirect:/login.do");
        } else if(adminUser != null){

        } else if(user != null){
            return new ModelAndView("indexStu");
        }
        return new ModelAndView("404");
    }

    @RequestMapping(value = "login.do", method = RequestMethod.GET)
    public ModelAndView login(){
        return new ModelAndView("login");
    }
}
