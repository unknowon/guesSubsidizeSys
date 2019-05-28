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
 * ShuJiNextLevelController
 *
 * @author lulu
 * @date 2019-05-28
 **/
@Controller
@RequestMapping("/ShuJiNextLevel")
public class ShuJiNextLevelController {
    @Autowired
    private AdminUserService adminUserService;

    @Autowired
    private RoleService roleService;

    @Autowired
    private AdminUserRoleService adminUserRoleService;

    @Autowired
    private ClassAdminUserService classAdminUserService;

    @Autowired
    private CollegeClassService collegeClassService;

    @RequestMapping("/shuJiNextLevelList.do")
    public ModelAndView shujilist(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView("shuJiNextLevel/list");

        Long fuDaoYuanRoleId = 5L;

        AdminUser adminUser = (AdminUser) request.getSession().getAttribute("adminUser");
        Class clz = classAdminUserService.selectFirstListBySecondId(adminUser.getId()).get(0);
        College college = collegeClassService.selectFirstListBySecondId(clz.getId()).get(0);

        List<NextLevelTeacher> adminUserAndRoleList = adminUserService.selectAllNextLevelByRoleAndCollegeId(fuDaoYuanRoleId, college.getId());
        modelAndView.addObject("nextLevelList", adminUserAndRoleList);

        return modelAndView;
    }
}
