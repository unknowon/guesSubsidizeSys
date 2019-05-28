package cn.edu.gues.web.controller;

import cn.edu.gues.mapper.AdminUserRoleMapper;
import cn.edu.gues.pojo.AdminUser;
import cn.edu.gues.pojo.AdminUserAndRole;
import cn.edu.gues.pojo.Class;
import cn.edu.gues.pojo.Role;
import cn.edu.gues.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * NextLevelController
 *
 * @author lulu
 * @date 2019-05-27
 **/
@Controller
@RequestMapping("/NextLevel")
public class NextLevelController {

    @Autowired
    private AdminUserService adminUserService;

    @Autowired
    private RoleService roleService;

    @Autowired
    private AdminUserRoleService adminUserRoleService;

    @Autowired
    private ClassAdminUserService classAdminUserService;

    @RequestMapping("/nextLevelList.do")
    public ModelAndView list(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView("nextLevel/list");

        //TODO:查出当前用户的role
        AdminUser adminUser = (AdminUser) request.getSession().getAttribute("adminUser");
        Role role = adminUserRoleService.selectSecondListByFirstId(adminUser.getId()).get(0);
        List<Class> classList = classAdminUserService.selectFirstListBySecondId(adminUser.getId());

        Role nextRole = roleService.getNextLevelRole(role);
        //当前用户的role，下一级role，当前用户的classList(为空就不查class)
        List<AdminUserAndRole> adminUserAndRoleList = adminUserService.selectAllNextLevel(role, nextRole, classList);
        modelAndView.addObject("nextLevelList", adminUserAndRoleList);

        return modelAndView;
    }
}
