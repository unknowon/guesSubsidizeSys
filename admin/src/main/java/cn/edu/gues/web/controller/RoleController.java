package cn.edu.gues.web.controller;

import cn.edu.gues.pojo.Permission;
import cn.edu.gues.pojo.Role;
import cn.edu.gues.pojo.RolePermission;
import cn.edu.gues.pojo.SubsidizeInfo;
import cn.edu.gues.service.PermissionService;
import cn.edu.gues.service.RolePermissionService;
import cn.edu.gues.service.RoleService;
import cn.edu.gues.service.SubsidizeInfoService;
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
 * RoleController
 *
 * @author Wonder
 * @date 2019-05-24
 **/
@Controller
@RequestMapping("/Role")
public class RoleController {

    @Autowired
    private RoleService roleService;

    @Autowired
    private PermissionService permissionService;

    @Autowired
    private RolePermissionService rolePermissionService;

    /**
     * 权限管理-角色管理
     * @return
     */
    @RequestMapping("/roleList.do")
    public ModelAndView roleList(){

        //因为要查学院，是和学院有关的，所以用CollegeService
        //把所有的学院查出来
        List<Role> roleList = roleService.selectList();
        ModelAndView modelAndView = new ModelAndView("role/list");
        //把查出来的
        modelAndView.addObject("roleList", roleList);

        return modelAndView;
    }

    @RequestMapping(value = "/roleAdd.do", method = RequestMethod.GET)
    public ModelAndView roleAdd(){
        List<Permission> permissionList = permissionService.selectList();
        return new ModelAndView("role/add", "permissionList", permissionList);
    }

    @RequestMapping(value = "/roleAdd.do", method = RequestMethod.POST)
    public @ResponseBody AjaxResult roleAddSubmit(String name, String description, Long[] permissionIds){

        Role role = new Role();
        role.setName(name);
        if(roleService.isExisted(role)){
            return AjaxResult.errorInstance("此角色名称已存在");
        }

        role.setDescription(description);
        roleService.insert(role, permissionIds);
        return AjaxResult.successInstance("添加成功");
    }

    @RequestMapping(value = "/roleEdit.do", method = RequestMethod.GET)
    public ModelAndView roleEdit(Long id){
        Role role = roleService.selectOne(id);

        RolePermission rolePermission = new RolePermission();
        rolePermission.setRoleId(id);

        List<RolePermission> rolePermissionList = rolePermissionService.selectList(rolePermission);

        List<Permission> permissionList = permissionService.selectList();


        ModelAndView modelAndView = new ModelAndView("role/edit");
        modelAndView.addObject("roleId", id);
        modelAndView.addObject("permissionList", permissionList);
        modelAndView.addObject("rolePermissionList", rolePermissionList);
        modelAndView.addObject("role", role);

        return modelAndView;
    }

    @RequestMapping(value = "/roleEdit.do", method = RequestMethod.POST)
    public @ResponseBody AjaxResult collegeEditSubmit(Long id, String name, String description, Long[] permissionIds){

        if(CommonUtils.isEmpty(name)){
            return AjaxResult.errorInstance("名称不能为空");
        } else if(CommonUtils.isEmpty(description)){
            return AjaxResult.errorInstance("描述不能为空");
        }

        Role role = new Role();
        role.setName(name);
        role = roleService.selectOne(role);

        if(role != null && role.getId() != id){
            return AjaxResult.errorInstance("此角色已存在");
        }

        role = roleService.selectOne(id);
        role.setDescription(description);
        role.setName(name);

        roleService.update(role);
        rolePermissionService.updateFirst(id, permissionIds);
        return AjaxResult.successInstance("修改成功");
    }


    @RequestMapping("/roleDelete.do")
    public @ResponseBody AjaxResult roleDelete(Long id){
        roleService.delete(id);
        return AjaxResult.successInstance("删除成功");
    }

}
