package cn.edu.gues.web.controller;

import cn.edu.gues.pojo.AdminUserRole;
import cn.edu.gues.service.AdminUserRoleService;
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

    /**
     * 权限管理-用户权限管理
     * @return
     */
    @RequestMapping("/adminUserRoleList.do")
    public ModelAndView adminUserRoleList(){

        //因为要查学院，是和学院有关的，所以用CollegeService
        //把所有的学院查出来
        List<AdminUserRole> adminUserRoleList = adminUserRoleService.selectList();
        ModelAndView modelAndView = new ModelAndView("adminUserRole/list");
        //把查出来的
        modelAndView.addObject("adminUserRoleList", adminUserRoleList);

        return modelAndView;
    }

    @RequestMapping(value = "/adminUserRoleAdd.do", method = RequestMethod.GET)
    public ModelAndView adminUserRoleAdd(){
        return new ModelAndView("adminUserRole/add");
    }

    @RequestMapping(value = "/adminUserRoleAdd.do", method = RequestMethod.POST)
    public @ResponseBody AjaxResult adminUserRoleAddSubmit(Long adminUserId, HttpServletRequest request){

        if(adminUserId != null && adminUserId !=0l){
            return AjaxResult.errorInstance("用户名不能为空");
        }

        AdminUserRole adminUserRole = new AdminUserRole();
        adminUserRole.setAdminUserId(adminUserId);
        adminUserRoleService.insert(adminUserRole);

        return AjaxResult.successInstance("添加成功");
    }

    @RequestMapping(value = "/adminUserRoleEdit.do", method = RequestMethod.GET)
    public ModelAndView adminUserRoleEdit(Long id){
        AdminUserRole adminUserRole = adminUserRoleService.selectOne(id);

        return new ModelAndView("adminUserRole/edit", "adminUserRole", adminUserRole);
    }

    @RequestMapping(value = "/adminUserRoleEdit.do", method = RequestMethod.POST)
    public @ResponseBody AjaxResult adminUserRoleEditSubmit(Long id, Long adminUserId, HttpServletRequest request){

        if(adminUserId != null && adminUserId !=0l){
            return AjaxResult.errorInstance("用户名不能为空");
        }

        AdminUserRole adminUserRole = new  AdminUserRole();
        adminUserRole.setAdminUserId(adminUserId);
        adminUserRole = adminUserRoleService.selectOne(adminUserRole);
        if(adminUserRole != null && adminUserRole.getId().equals(id)){
            return AjaxResult.errorInstance("该用户已经存在");
        }
        adminUserRole = adminUserRoleService.selectOne(id);
        adminUserRole.setAdminUserId(adminUserId);
        adminUserRoleService.update(adminUserRole);

        return AjaxResult.successInstance("添加成功");
    }


    @RequestMapping("/adminUserRoleDelete.do")
    public @ResponseBody AjaxResult adminUserRoleDelete(Long id){
        adminUserRoleService.delete(id);
        return AjaxResult.successInstance("删除成功");
    }

}
