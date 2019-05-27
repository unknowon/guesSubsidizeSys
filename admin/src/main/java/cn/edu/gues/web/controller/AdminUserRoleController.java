package cn.edu.gues.web.controller;

import cn.edu.gues.pojo.AdminUser;
import cn.edu.gues.pojo.AdminUserAndRole;
import cn.edu.gues.pojo.AdminUserRole;
import cn.edu.gues.pojo.Role;
import cn.edu.gues.service.AdminUserRoleService;
import cn.edu.gues.service.AdminUserService;
import cn.edu.gues.service.RoleService;
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

/**
 * AdminUserRoleController
 *
 * @author Wonder
 * @date 2019-05-24
 **/
@Controller
@RequestMapping("/AdminUserRole")
public class AdminUserRoleController {

    @Autowired
    private AdminUserRoleService adminUserRoleService;

    @Autowired
    private AdminUserService adminUserService;

    @Autowired
    private RoleService roleService;

    /**
     * 权限管理-用户权限管理
     * @return
     */
    @RequestMapping("/adminUserRoleList.do")
    public ModelAndView adminUserRoleList(){


        List<AdminUserAndRole> adminUserList = adminUserService.selectAllAndRole(new AdminUserAndRole());
        return new ModelAndView("adminUserRole/list", "adminUserList", adminUserList);
    }

    @RequestMapping(value = "/adminUserRoleAdd.do", method = RequestMethod.GET)
    public ModelAndView adminUserRoleAdd(){
        List<Role> roleList = roleService.selectList();

        return new ModelAndView("adminUserRole/add", "roleList", roleList);
    }

    @RequestMapping(value = "/adminUserRoleAdd.do", method = RequestMethod.POST)
    public @ResponseBody AjaxResult adminUserRoleAddSubmit(Long roleId, String name){

        if(roleId == null || roleId ==0L){
            return AjaxResult.errorInstance("需要选择角色");
        }
        if(CommonUtils.isEmpty(name)){
            return AjaxResult.errorInstance("用户名必填");
        }



        return AjaxResult.successInstance("添加成功");
    }

    @RequestMapping(value = "/adminUserRoleEdit.do", method = RequestMethod.GET)
    public ModelAndView adminUserRoleEdit(Long id){
        AdminUserAndRole adminUserAndRole = new AdminUserAndRole();
        adminUserAndRole.setId(id);
        AdminUserAndRole adminUser = adminUserService.selectAllAndRole(adminUserAndRole).get(0);

        List<Role> roleList = roleService.selectList();

        ModelAndView modelAndView = new ModelAndView("adminUserRole/edit");
        modelAndView.addObject("adminUser", adminUser);
        modelAndView.addObject("roleList", roleList);

        return modelAndView;
    }

    @RequestMapping(value = "/adminUserRoleEdit.do", method = RequestMethod.POST)
    public @ResponseBody AjaxResult adminUserRoleEditSubmit(Long id, String name, Long roleId){

        if(id == null || id == 0L){
            return AjaxResult.errorInstance("用户名不能为空");
        }
        else if(roleId == null || roleId == 0L){
            return AjaxResult.errorInstance("需要选择角色");
        }

        AdminUser adminUser = new AdminUser();
        adminUser.setName(name);
        adminUser = adminUserService.selectOne(adminUser);
        if(adminUser != null && !adminUser.getId().equals(id)){
            return AjaxResult.errorInstance("该用户已经存在");
        }
        adminUser = adminUserService.selectOne(id);
        adminUser.setName(name);
        adminUserService.update(adminUser);

        AdminUserRole adminUserRole = new AdminUserRole();
        adminUserRole.setAdminUserId(id);
        adminUserRole = adminUserRoleService.selectOne(adminUserRole);
        adminUserRole.setRoleId(roleId);
        adminUserRoleService.update(adminUserRole);

        return AjaxResult.successInstance("添加成功");
    }


    @RequestMapping("/adminUserRoleDelete.do")
    public @ResponseBody AjaxResult adminUserRoleDelete(Long id){
        adminUserRoleService.delete(id);
        AdminUserRole adminUserRole = new AdminUserRole();
        adminUserRole.setAdminUserId(id);
        adminUserRole = adminUserRoleService.selectOne(adminUserRole);
        if(adminUserRole != null) {
            adminUserRoleService.delete(adminUserRole.getId());
        }
        return AjaxResult.successInstance("删除成功");
    }

}
