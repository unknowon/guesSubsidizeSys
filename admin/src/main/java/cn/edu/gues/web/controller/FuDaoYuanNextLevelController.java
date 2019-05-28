package cn.edu.gues.web.controller;

import cn.edu.gues.pojo.AdminUser;
import cn.edu.gues.pojo.Class;
import cn.edu.gues.pojo.College;
import cn.edu.gues.pojo.NextLevelTeacher;
import cn.edu.gues.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * FuDaoYuanNextLevelController
 *
 * @author lulu
 * @date 2019-05-28
 **/
@Controller
@RequestMapping("/FuDaoYuanNextLevel")
public class FuDaoYuanNextLevelController {
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

    @RequestMapping("/fuDaoYuanNextLevelList.do")
    public ModelAndView list(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView("fuDaoYuanNextLevel/list");

        Long banZhuRenRoleId = 2L;
        AdminUser adminUser = (AdminUser) request.getSession().getAttribute("adminUser");
        Class clz = classAdminUserService.selectFirstListBySecondId(adminUser.getId()).get(0);
        College collegetmp = collegeClassService.selectFirstListBySecondId(clz.getId()).get(0);

        List<NextLevelTeacher> list = adminUserService.selectAllNextLevelByRoleAndCollegeId(banZhuRenRoleId, collegetmp.getId());
        modelAndView.addObject("nextLevelList", list);

        return modelAndView;
    }

    @RequestMapping(value = "fuDaoYuanNextLevelAdd.do", method = RequestMethod.GET)
    public ModelAndView add(HttpServletRequest request){
        AdminUser adminUser = (AdminUser) request.getSession().getAttribute("adminUser");
        Class clz = classAdminUserService.selectFirstListBySecondId(adminUser.getId()).get(0);
        College collegetmp = collegeClassService.selectFirstListBySecondId(clz.getId()).get(0);

        List<Class> classList = collegeClassService.selectSecondListByFirstId(collegetmp.getId());

        return new ModelAndView("fuDaoYuanNextLevel/add", "classList", classList);
    }

}
