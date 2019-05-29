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
 * ShuJiNextLevelController
 *
 * @author lulu
 * @date 2019-05-28
 **/
@Controller
@RequestMapping("/ShuJiNextLevel")
public class ShuJiNextLevelController {
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

    @RequestMapping("/shuJiNextLevelList.do")
    public ModelAndView shujilist(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView("shuJiNextLevel/list");

        Long fuDaoYuanRoleId = 5L;

        AdminUser adminUser = (AdminUser) request.getSession().getAttribute("adminUser");
        Class clz = classAdminUserService.selectFirstListBySecondId(adminUser.getId()).get(0);
        College college = collegeClassService.selectFirstListBySecondId(clz.getId()).get(0);

        List<NextLevelTeacher> adminUserAndRoleList = adminUserService.selectAllNextLevelByRoleAndCollegeId(fuDaoYuanRoleId, college.getId());
        modelAndView.addObject("nextLevelList", adminUserAndRoleList);

        return modelAndView;
    }

    @RequestMapping(value = "/shuJiNextLevelAdd.do", method = RequestMethod.GET)
    public ModelAndView add(){
//        AdminUser adminUser = (AdminUser) request.getSession().getAttribute("adminUser");
//        Class clz = classAdminUserService.selectFirstListBySecondId(adminUser.getId()).get(0);
//        College collegetmp = collegeClassService.selectFirstListBySecondId(clz.getId()).get(0);
//
//        List<Class> classList = collegeClassService.selectSecondListByFirstId(collegetmp.getId());

        return new ModelAndView("shuJiNextLevel/add");
    }

    @RequestMapping(value = "/shuJiNextLevelAdd.do", method = RequestMethod.POST)
    public @ResponseBody AjaxResult addSubmit(String name, String workId, String phone, HttpServletRequest request){
        AdminUser adminUserSession = (AdminUser) request.getSession().getAttribute("adminUser"); // 查出权限，获取相关信息
        List<Class> classList = classAdminUserService.selectFirstListBySecondId(adminUserSession.getId());

        AdminUser adminUser = adminUserService.newAdminUser(name, workId, phone);

        AdminUserRole adminUserRole = new AdminUserRole();
        adminUserRole.setAdminUserId(adminUser.getId());
        adminUserRole.setRoleId(5L);
        adminUserRoleService.insert(adminUserRole);

        ClassAdminUser classAdminUser = new ClassAdminUser();
        classAdminUser.setAdminUserId(adminUser.getId());
        for(int i=0 ; i < classList.size(); i++){
            classAdminUser.setClassId(classList.get(i).getId());
            classAdminUserService.insert(classAdminUser);
        }
        return AjaxResult.successInstance("添加成功");
    }

    /**
     * 编辑界面获取
     * @param id
     * @param
     * @return
     */
    @RequestMapping(value = "/shuJiNextLevelEdit.do", method = RequestMethod.GET)
    public ModelAndView edit(Long id){

        AdminUser resultAdminUser = adminUserService.selectOne(id);


        ModelAndView modelAndView = new ModelAndView("shuJiNextLevel/edit");

        modelAndView.addObject("nextLevel", resultAdminUser);


        return modelAndView;
    }

    @RequestMapping(value = "/shuJiNextLevelEdit.do", method = RequestMethod.POST)
    public @ResponseBody AjaxResult editSubmit(Long id, String name, String workId, String phone, Long adminUserId, HttpServletRequest request){
        AdminUser adminUser = adminUserService.selectOne(id);
        adminUser.setPhone(phone);
        adminUser.setName(name);
        adminUserService.update(adminUser);


        return AjaxResult.successInstance("修改成功");
    }

    @RequestMapping("/shuJiNextLevelDelete.do")
    public @ResponseBody AjaxResult delete(Long id){
        adminUserRoleService.deleteByFirstId(id);
        classAdminUserService.deleteBySecondId(id);
        adminUserService.delete(id);
        return AjaxResult.successInstance("删除成功");
    }
}
