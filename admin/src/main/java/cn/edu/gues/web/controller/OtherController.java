package cn.edu.gues.web.controller;

import cn.edu.gues.pojo.AdminUser;
import cn.edu.gues.pojo.User;
import cn.edu.gues.service.AdminUserService;
import cn.edu.gues.service.UserService;
import cn.edu.gues.util.CommonUtils;
import cn.edu.gues.util.ImageCodeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.Date;

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
        AdminUser adminUser = (AdminUser) request.getSession().getAttribute("adminUser");
        if(adminUser != null){
            //TODO:indexAdminOrTeacher
            return new ModelAndView("redirect:/login.do");
        }

        User user = (User) request.getSession().getAttribute("user");
        if(user != null){
            return new ModelAndView("indexStu");
        }

        return new ModelAndView("redirect:/login.do");
    }

    @RequestMapping(value = "/login.do", method = RequestMethod.GET)
    public ModelAndView login(){
        return new ModelAndView("login");
    }

    @RequestMapping(value = "/login.do", method = RequestMethod.POST)
    public ModelAndView loginSubmit(String account, String password, String imageCode, HttpServletRequest request){
        // TODO:数据校验

        if(!ImageCodeUtils.checkImageCode(request.getSession(), imageCode)){
            return new ModelAndView("login", "message","验证码不正确");
        }
        AdminUser adminUser = adminUserService.login(account, password);
        if(adminUser != null){
            request.getSession().setAttribute("adminUser", adminUser);
        }
        User user = userService.login(account, password);
        if(user != null){
            request.getSession().setAttribute("user", user);
        } else if(adminUser == null && user==null){
            return new ModelAndView("login", "message","账号或密码错误");
        }
        return new ModelAndView("redirect:/");
    }

    @RequestMapping("/imageCode.do")
    public void imageCode(HttpServletRequest request, HttpServletResponse response){
        ImageCodeUtils.sendImageCode(request.getSession(), response);
    }

    /*@RequestMapping("/addUser.do")
    public ModelAndView addUser(){


        User user = new User();
        user.setId(3L);
        user.setName("王似超");
        user.setGender(true);
        user.setIdCardNum("520113199804191210");
        user.setBirthday(new Date());
        user.setStudentNum("38381616120");
        user.setPhone("13639108097");
        user.setPassword(CommonUtils.calculateMD5("123456"+"fuckSalt"));
        user.setPasswordSalt("fuckSalt");
        user.setDeleted(false);
        user.setChecked(true);


        userService.update(user);
        System.out.println("成功更新用户 : "+user.toString());
        return new ModelAndView("redirect:/");
    }*/
}
