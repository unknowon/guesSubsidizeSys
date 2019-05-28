package cn.edu.gues.web.controller;

import cn.edu.gues.pojo.*;
import cn.edu.gues.pojo.Class;
import cn.edu.gues.service.*;
import cn.edu.gues.util.AjaxResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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

    @RequestMapping(value = "/fuDaoYuanNextLevelAdd.do", method = RequestMethod.GET)
    public ModelAndView add(HttpServletRequest request){
        AdminUser adminUser = (AdminUser) request.getSession().getAttribute("adminUser");
        Class clz = classAdminUserService.selectFirstListBySecondId(adminUser.getId()).get(0);
        College collegetmp = collegeClassService.selectFirstListBySecondId(clz.getId()).get(0);

        List<Class> classList = collegeClassService.selectSecondListByFirstId(collegetmp.getId());

        return new ModelAndView("fuDaoYuanNextLevel/add", "classList", classList);
    }

    @RequestMapping(value = "/fuDaoYuanNextLevelAdd.do", method = RequestMethod.POST)
    public @ResponseBody AjaxResult addSubmit(String name, String workId, String phone, Long classId){

        AdminUser adminUser = adminUserService.newAdminUser(name, workId, phone);

        AdminUserRole adminUserRole = new AdminUserRole();
        adminUserRole.setAdminUserId(adminUser.getId());
        adminUserRole.setRoleId(2L);
        adminUserRoleService.insert(adminUserRole);

        ClassAdminUser classAdminUser = new ClassAdminUser();
        classAdminUser.setAdminUserId(adminUser.getId());
        classAdminUser.setClassId(classId);
        classAdminUserService.insert(classAdminUser);

        return AjaxResult.successInstance("添加成功");
    }

    @RequestMapping(value = "/fuDaoYuanNextLevelEdit.do", method = RequestMethod.GET)
    public ModelAndView edit(Long id, HttpServletRequest request){
        AdminUser adminUser = (AdminUser) request.getSession().getAttribute("adminUser");
        Class clz = classAdminUserService.selectFirstListBySecondId(adminUser.getId()).get(0);
        College collegetmp = collegeClassService.selectFirstListBySecondId(clz.getId()).get(0);

        List<Class> classList = collegeClassService.selectSecondListByFirstId(collegetmp.getId());

        AdminUser resultAdminUser = adminUserService.selectOne(id);

        Class aClass = classAdminUserService.selectFirstListBySecondId(id).get(0);

        ModelAndView modelAndView = new ModelAndView("fuDaoYuanNextLevel/edit");
        modelAndView.addObject("classList", classList);
        modelAndView.addObject("nextLevel", resultAdminUser);
        modelAndView.addObject("clz", aClass);

        return modelAndView;
    }

    @RequestMapping(value = "/fuDaoYuanNextLevelEdit.do", method = RequestMethod.POST)
    public @ResponseBody AjaxResult editSubmit(Long id, String name, String workId, String phone, Long classId){
        AdminUser adminUser = adminUserService.selectOne(id);
        adminUser.setPhone(phone);
        adminUser.setName(name);
        adminUserService.update(adminUser);

        ClassAdminUser classAdminUser = new ClassAdminUser();
        classAdminUser.setAdminUserId(id);
        classAdminUser = classAdminUserService.selectOne(classAdminUser);
        classAdminUser.setClassId(classId);
        classAdminUserService.update(classAdminUser);

        return AjaxResult.successInstance("修改成功");
    }

    @RequestMapping("/fuDaoYuanNextLevelDelete.do")
    public @ResponseBody AjaxResult delete(Long id){
        classAdminUserService.deleteBySecondId(id);
        adminUserService.delete(id);
        return AjaxResult.successInstance("删除成功");
    }

}
