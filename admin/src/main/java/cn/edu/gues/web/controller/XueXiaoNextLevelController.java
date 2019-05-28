package cn.edu.gues.web.controller;

import cn.edu.gues.pojo.*;
import cn.edu.gues.pojo.Class;
import cn.edu.gues.service.*;
import cn.edu.gues.util.AjaxResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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

    @Autowired
    private CollegeClassService collegeClassService;

    @Autowired
    private CollegeService collegeService;

    @RequestMapping("/schoolNextLevelList.do")
    public ModelAndView shujilist(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView("schoolNextLevel/list");

        Long shujiRoleId = 6L;

        List<NextLevelTeacher> adminUserAndRoleList = adminUserService.selectAllNextLevelByRole(shujiRoleId);
        modelAndView.addObject("nextLevelList", adminUserAndRoleList);

        return modelAndView;
    }


    /**
     * 学校-增加页面获取
     * @param
     * @return
     * @author Wonder
     */
    @RequestMapping(value = "/schoolNextLevelAdd.do", method = RequestMethod.GET)
    public ModelAndView add(){
        List<College> collegeList = collegeService.selectList();
        return new ModelAndView("schoolNextLevel/add", "collegeList", collegeList);
    }

    @RequestMapping(value = "/schoolNextLevelAdd.do", method = RequestMethod.POST)
    public @ResponseBody
    AjaxResult addSubmit(String name, String workId, String phone, Long classId){

        AdminUser adminUser = adminUserService.newAdminUser(name, workId, phone);

        AdminUserRole adminUserRole = new AdminUserRole();
        adminUserRole.setAdminUserId(adminUser.getId());
        adminUserRole.setRoleId(6L);
        adminUserRoleService.insert(adminUserRole);

        Class class1 = collegeClassService.selectSecondListByFirstId(classId).get(0);
        ClassAdminUser classAdminUser = new ClassAdminUser();
        classAdminUser.setClassId(class1.getId());
        classAdminUser.setAdminUserId(adminUser.getId());
        classAdminUserService.insert(classAdminUser);

        return AjaxResult.successInstance("添加成功");
    }

    @RequestMapping(value = "/schoolNextLevelEdit.do", method = RequestMethod.GET)
    public ModelAndView edit(Long id){
        AdminUser resultAdminUser = adminUserService.selectOne(id);
        Class clsTmp = classAdminUserService.selectFirstListBySecondId(id).get(0);
        College college = collegeClassService.selectFirstOneBySecondId(clsTmp.getId());

        List<College> collegeList = collegeService.selectList();

        ModelAndView modelAndView = new ModelAndView("schoolNextLevel/edit");

        modelAndView.addObject("nextLevel", resultAdminUser);
        modelAndView.addObject("college", college);
        modelAndView.addObject("collegeList", collegeList);

        return modelAndView;
    }

    @RequestMapping(value = "/schoolNextLevelEdit.do", method = RequestMethod.POST)
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

    @RequestMapping("/schoolNextLevelDelete.do")
    public @ResponseBody AjaxResult delete(Long id){
        adminUserRoleService.deleteByFirstId(id);
        classAdminUserService.deleteBySecondId(id);
        adminUserService.delete(id);

        return AjaxResult.successInstance("删除成功");
    }
}
