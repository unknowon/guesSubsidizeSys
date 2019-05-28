package cn.edu.gues.web.controller;

import cn.edu.gues.pojo.*;
import cn.edu.gues.pojo.Class;
import cn.edu.gues.service.*;
import cn.edu.gues.util.AjaxResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * StudentAccountController
 *
 * @author lulu
 * @date 2019-05-28
 **/
@Controller
@RequestMapping("/BanZhuRenNextLevel")
public class BanZhuRenNextLevelController {

    @Autowired
    private AdminUserService adminUserService;

    @Autowired
    private RoleService roleService;

    @Autowired
    private UserService userService;

    @Autowired
    private ClassAdminUserService classAdminUserService;

    @Autowired
    private ClassUserService classUserService;

    @RequestMapping("/banZhuRenNextLevelList.do")
    public ModelAndView list(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView("banZhuRenNextLevel/list");

        AdminUser adminUser = (AdminUser) request.getSession().getAttribute("adminUser");
        Class clz = classAdminUserService.selectFirstListBySecondId(adminUser.getId()).get(0);

        List<User> studentList = userService.selectListByClassId(clz.getId());
        modelAndView.addObject("studentList", studentList);

        return modelAndView;
    }

    @RequestMapping(value = "/banZhuRenNextLevelAdd.do", method = RequestMethod.GET)
    public ModelAndView add(){
        return new ModelAndView("banZhuRenNextLevel/add");
    }

    @RequestMapping(value = "/banZhuRenNextLevelAdd.do", method = RequestMethod.POST)
    public @ResponseBody AjaxResult addSubmit(String name, Boolean gender, String idCardNum, String studentNum, String phone, HttpServletRequest request){
        AdminUser adminUser = (AdminUser) request.getSession().getAttribute("adminUser");
        Class clz = classAdminUserService.selectFirstListBySecondId(adminUser.getId()).get(0);

        User user = userService.newStudent(name, gender, idCardNum, studentNum, phone);

        ClassUser classUser = new ClassUser();
        classUser.setClassId(clz.getId());
        classUser.setUserId(user.getId());

        classUserService.insert(classUser);

        return AjaxResult.successInstance("添加成功");
    }


}
