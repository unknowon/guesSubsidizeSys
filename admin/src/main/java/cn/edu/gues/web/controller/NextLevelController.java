package cn.edu.gues.web.controller;

import cn.edu.gues.mapper.AdminUserRoleMapper;
import cn.edu.gues.pojo.*;
import cn.edu.gues.pojo.Class;
import cn.edu.gues.service.*;
import cn.edu.gues.util.AjaxResult;
import cn.edu.gues.util.CommonUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.UUID;

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
        List<NextLevelTeacher> adminUserAndRoleList = adminUserService.selectAllNextLevel(role, nextRole, classList);
        modelAndView.addObject("nextLevelList", adminUserAndRoleList);

        return modelAndView;
    }

    @RequestMapping(value = "/nextLevelAdd.do", method = RequestMethod.GET)
    public ModelAndView add(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView("nextLevel/add");

        AdminUser adminUser = (AdminUser) request.getSession().getAttribute("adminUser");
        Role role = adminUserRoleService.selectSecondListByFirstId(adminUser.getId()).get(0);

        modelAndView.addObject("role", role);

        return modelAndView;
    }

    @RequestMapping(value = "/nextLevelAdd.do", method = RequestMethod.POST)
    public @ResponseBody AjaxResult addSubmit(String name, String workId, String phone, Long roleId, HttpServletRequest request){

        if(CommonUtils.isEmpty(name)){
            return AjaxResult.errorInstance("名字不能为空");
        } else if(CommonUtils.isEmpty(workId)){
            return AjaxResult.errorInstance("工号不能为空");
        } else if(CommonUtils.isEmpty(phone)){
            return AjaxResult.errorInstance("电话不能为空");
        }
        AdminUser adminUser = adminUserService.newAdminUser(name, workId, phone);
        AdminUserRole adminUserRole = new AdminUserRole();
        adminUserRole.setRoleId(roleId);
        adminUserRole.setAdminUserId(adminUser.getId());
        adminUserRoleService.insert(adminUserRole);

        AdminUser sessionAdminUser = (AdminUser) request.getSession().getAttribute("adminUser");
        List<Class> classList = classAdminUserService.selectFirstListBySecondId(sessionAdminUser.getId());
        Long[] classIds = new Long[classList.size()];
        for(int i = 0; i < classList.size(); i++){
            classIds[i] = classList.get(i).getId();
        }
        classAdminUserService.updateSecond(adminUser.getId(),classIds);

        return AjaxResult.successInstance("添加成功");
    }
}
