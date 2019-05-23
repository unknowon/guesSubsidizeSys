package cn.edu.gues.web.controller;

import cn.edu.gues.pojo.AdminUser;
import cn.edu.gues.pojo.Class;
import cn.edu.gues.pojo.User;
import cn.edu.gues.service.AdminUserService;
import cn.edu.gues.service.ClassAdminUserService;
import cn.edu.gues.service.UserService;
import cn.edu.gues.util.AjaxResult;
import cn.edu.gues.util.CommonUtils;
import cn.edu.gues.util.ImageCodeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

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

    @Autowired
    private ClassAdminUserService classAdminUserService;


    @RequestMapping("/")
    public ModelAndView indexStu(HttpServletRequest request){
        AdminUser adminUser = (AdminUser) request.getSession().getAttribute("adminUser");
        if(adminUser != null){
            //TODO:indexAdminOrTeacher
            return new ModelAndView("redirect:/Admin/indexTeacher.do", "adminUser", adminUser);
        }

        User user = (User) request.getSession().getAttribute("user");
        if(user != null){
            return new ModelAndView("redirect:/User/stuInformation.do","user", user);
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
            List<Class> classList = classAdminUserService.selectFirstListBySecondId(adminUser.getId());
            request.getSession().setAttribute("classList", classList);
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

    @RequestMapping("/logout.do")
    public ModelAndView logout(HttpServletRequest request){
        request.getSession().invalidate();
        return new ModelAndView("redirect:/login.do");
    }

    @RequestMapping(value = "/updatePassword.do", method = RequestMethod.GET)
    public ModelAndView updatePassword(){
        return new ModelAndView("user/updatePassword");
    }

    @RequestMapping(value = "/updatePassword.do", method = RequestMethod.POST)
    public @ResponseBody AjaxResult updatePasswordSubmit(String password, String newpassword, String renewpassword, HttpServletRequest request){
        if(CommonUtils.isEmpty(password)){
            return AjaxResult.errorInstance("旧密码不能为空");
        } else if(CommonUtils.isEmpty(newpassword)){
            return AjaxResult.errorInstance("新密码不能为空");
        } else if(CommonUtils.isEmpty(renewpassword)){
            return AjaxResult.errorInstance("重复密码不能为空");
        } else if(!newpassword.equals(renewpassword)){
            return AjaxResult.errorInstance("重复密码与新密码不相同");
        }

        User user = (User) request.getSession().getAttribute("user");

        if(!CommonUtils.calculateMD5(password +user.getPasswordSalt()).equals(user.getPassword())){
            return AjaxResult.errorInstance("旧密码不正确");
        }

        user.setPassword(CommonUtils.calculateMD5(newpassword + user.getPasswordSalt()));
        userService.update(user);
        return AjaxResult.successInstance("密码修改成功");
    }
}
