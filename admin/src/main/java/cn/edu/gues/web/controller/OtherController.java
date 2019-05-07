package cn.edu.gues.web.controller;

import cn.edu.gues.pojo.AdminUser;
import cn.edu.gues.pojo.User;
import cn.edu.gues.service.AdminUserService;
import cn.edu.gues.service.UserService;
import cn.edu.gues.util.ImageCodeUtils;
import org.springframework.beans.factory.annotation.Autowired;
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
@RequestMapping("/")
public class OtherController {

    @Autowired
    private AdminUserService adminUserService;

    @Autowired
    private UserService userService;

    @RequestMapping("/")
    public ModelAndView indexStu(HttpServletRequest request){
        /*AdminUser adminUser = (AdminUser) request.getSession().getAttribute("adminUser");
        User user = (User) request.getSession().getAttribute("user");
        if(adminUser == null && user == null) {
            return new ModelAndView("redirect:/login.do");
        } else if(adminUser != null){
            //TODO:indexAdminOrTeacher
        } else if(user != null){
            return new ModelAndView("indexStu");
        }
        return new ModelAndView("redirect:/login.do");*/

        return new ModelAndView("indexStu");
    }

    @RequestMapping(value = "login.do", method = RequestMethod.GET)
    public ModelAndView login(){
        return new ModelAndView("login");
    }

    @RequestMapping(value = "login.do", method = RequestMethod.POST)
    public ModelAndView loginSubmit(String account, String password, String imageCode, HttpServletRequest request){
        // TODO:数据校验

        if(!ImageCodeUtils.checkImageCode(request.getSession(), imageCode)){
            return new ModelAndView("adminUser/login", "message","验证码不正确");
        }
        AdminUser adminUser = adminUserService.login(account, password);
        User user = userService.login(account, password);
        if(adminUser == null && user==null){
            return new ModelAndView("adminUser/login", "message","账号或密码错误");
        } else if(adminUser != null){
            request.getSession().setAttribute("adminUser", adminUser);
        } else if(user != null){
            request.getSession().setAttribute("user", user);
        }
        return new ModelAndView("redirect:/");
    }
}
