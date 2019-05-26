package cn.edu.gues.web.controller;

import cn.edu.gues.pojo.Role;
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
        return new ModelAndView("role/add");
    }

    @RequestMapping(value = "/roleAdd.do", method = RequestMethod.POST)
    public @ResponseBody AjaxResult roleAddSubmit(String name, String description, HttpServletRequest request){

        if(CommonUtils.isEmpty(name)){
            return AjaxResult.errorInstance("角色名不能为空");
        }
        if(CommonUtils.isEmpty(description)){
            return AjaxResult.errorInstance("角色描述不能为空");
        }

        Role role = new Role();
        role.setName(description);
        role.setName(name);
        roleService.insert(role);

        return AjaxResult.successInstance("添加成功");
    }

    @RequestMapping(value = "/roleEdit.do", method = RequestMethod.GET)
    public ModelAndView roleEdit(Long id){
        Role role = roleService.selectOne(id);

        return new ModelAndView("role/edit", "role", role);
    }

    @RequestMapping(value = "/roleEdit.do", method = RequestMethod.POST)
    public @ResponseBody AjaxResult collegeEditSubmit(Long id, String name, String description, HttpServletRequest request){

        if(CommonUtils.isEmpty(name)){
            return AjaxResult.errorInstance("角色名不能为空");
        }
        if(CommonUtils.isEmpty(description)){
            return AjaxResult.errorInstance("角色描述不能为空");
        }

        Role role = new Role();
        role.setName(description);
        role.setName(name);
        role = roleService.selectOne(role);
        if(role != null && role.getId().equals(id)){
            return AjaxResult.errorInstance("该角色已经存在");
        }
        role = roleService.selectOne(id);
        role.setName(name);
        roleService.update(role);

        return AjaxResult.successInstance("添加成功");
    }


    @RequestMapping("/roleDelete.do")
    public @ResponseBody AjaxResult roleDelete(Long id){
        roleService.delete(id);
        return AjaxResult.successInstance("删除成功");
    }

}
