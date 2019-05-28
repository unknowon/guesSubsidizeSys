package cn.edu.gues.web.controller;

import cn.edu.gues.pojo.NextLevelTeacher;
import cn.edu.gues.service.AdminUserRoleService;
import cn.edu.gues.service.AdminUserService;
import cn.edu.gues.service.ClassAdminUserService;
import cn.edu.gues.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * XueXiaoNextLevelController
 *
 * @author lulu
 * @date 2019-05-28
 **/
@Controller
@RequestMapping("/SchoolNextLevel")
public class XueXiaoNextLevelController {

    @Autowired
    private AdminUserService adminUserService;

    @Autowired
    private RoleService roleService;

    @Autowired
    private AdminUserRoleService adminUserRoleService;

    @Autowired
    private ClassAdminUserService classAdminUserService;

    @RequestMapping("/schoolNextLevelList.do")
    public ModelAndView shujilist(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView("schoolNextLevel/list");

        Long shujiRoleId = 6L;

        List<NextLevelTeacher> adminUserAndRoleList = adminUserService.selectAllNextLevelByRole(shujiRoleId);
        modelAndView.addObject("nextLevelList", adminUserAndRoleList);

        return modelAndView;
    }
}
