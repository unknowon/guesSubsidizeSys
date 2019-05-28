package cn.edu.gues.web.controller;

import cn.edu.gues.pojo.AdminUser;
import cn.edu.gues.pojo.Class;
import cn.edu.gues.pojo.College;
import cn.edu.gues.pojo.NextLevelTeacher;
import cn.edu.gues.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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



    @RequestMapping("/fuDaoYuanNextLevelList.do")
    public ModelAndView shujilist(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView("fuDaoYuanNextLevel/list");

        Long banZhuRenRoleId = 2L;
        AdminUser adminUser = (AdminUser) request.getSession().getAttribute("adminUser");
        Class clz = classAdminUserService.selectFirstListBySecondId(adminUser.getId()).get(0);


        return modelAndView;
    }
}
