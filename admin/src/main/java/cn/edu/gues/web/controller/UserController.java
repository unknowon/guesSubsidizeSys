package cn.edu.gues.web.controller;

import cn.edu.gues.pojo.Attachment;
import cn.edu.gues.pojo.Member;
import cn.edu.gues.pojo.StuInformation;
import cn.edu.gues.pojo.User;
import cn.edu.gues.service.AttachmentService;
import cn.edu.gues.service.MemberService;
import cn.edu.gues.service.SubsidizeInfoService;
import cn.edu.gues.service.UserService;
import cn.edu.gues.util.AjaxResult;
import cn.edu.gues.util.CommonUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.InvocationTargetException;
import java.util.*;

/**
 * UserController
 *
 * @author lulu
 * @date 2019-05-06
 **/
@Controller
@RequestMapping("/User")
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private SubsidizeInfoService subsidizeInfoService;

    @Autowired
    private MemberService memberService;

    @Autowired
    private AttachmentService attachmentService;

    /**
     * 基本信息
     * @param request
     * @return
     */
    @RequestMapping(value = "/stuInformation.do", method = RequestMethod.GET)
    public ModelAndView stuInformation(HttpServletRequest request){

        //测试
        /*User userSession = userService.selectOne(2L);
        request.getSession().setAttribute("user", userSession);*/

        ModelAndView modelAndView = new ModelAndView("user/stuInformation");
        User user = (User) request.getSession().getAttribute("user");
        modelAndView.addObject("user", user);
        if(user != null) {
            Long userId = user.getId();
            modelAndView.addObject("nationality", subsidizeInfoService.selectValueByKeyAndUserId("nationality", userId));
            modelAndView.addObject("politicalStatus", subsidizeInfoService.selectValueByKeyAndUserId("politicalStatus", userId));
            modelAndView.addObject("beforeResidency", subsidizeInfoService.selectValueByKeyAndUserId("beforeResidency", userId));
            modelAndView.addObject("graduatedSchool", subsidizeInfoService.selectValueByKeyAndUserId("graduatedSchool", userId));
            modelAndView.addObject("totalNumOfFamily", subsidizeInfoService.selectValueByKeyAndUserId("totalNumOfFamily", userId));
            modelAndView.addObject("houseStatus", subsidizeInfoService.selectValueByKeyAndUserId("houseStatus", userId));
            modelAndView.addObject("specialty", subsidizeInfoService.selectValueByKeyAndUserId("specialty", userId));
        }

        return modelAndView;
    }

    @RequestMapping(value = "/stuInformation.do", method = RequestMethod.POST)
    public ModelAndView stuInformationSubmit(StuInformation stuInfo, HttpServletRequest request){

        User user = (User) request.getSession().getAttribute("user");

        if(CommonUtils.isEmpty(stuInfo.getName())){
            return new ModelAndView("user/stuInformation", "message", "姓名不能为空");
        } else if(CommonUtils.isEmpty(stuInfo.getGender().toString())){
            return new ModelAndView("user/stuInformation", "message", "性别不能为空");
        } else if(CommonUtils.isEmpty(stuInfo.getNationality())){
            return new ModelAndView("user/stuInformation", "message", "民族不能为空");
        } else if(CommonUtils.isEmpty(stuInfo.getPoliticalStatus())){
            return new ModelAndView("user/stuInformation", "message", "政治面貌不能为空");
        } else if(CommonUtils.isEmpty(stuInfo.getBeforeResidency())){
            return new ModelAndView("user/stuInformation", "message", "入学前户口不能为空");
        } else if(CommonUtils.isEmpty(stuInfo.getIdCardNum())){
            return new ModelAndView("user/stuInformation", "message", "身份证号码不能为空");
        } /*else if(CommonUtils.isEmpty(stuInfo.getBirthday().toString())){
            return new ModelAndView("user/stuInformation", "message", "出生日期不能为空");
        }*/ else if(CommonUtils.isEmpty(stuInfo.getGraduatedSchool())){
            return new ModelAndView("user/stuInformation", "message", "毕业院校不能为空");
        } else if(CommonUtils.isEmpty(stuInfo.getTotalNumOfFamily())){
            return new ModelAndView("user/stuInformation", "message", "家庭人数不能为空");
        } else if(CommonUtils.isEmpty(stuInfo.getPhone())){
            return new ModelAndView("user/stuInformation", "message", "个人电话不能为空");
        } else if(CommonUtils.isEmpty(stuInfo.getHouseStatus())){
            return new ModelAndView("user/stuInformation", "message", "住房情况不能为空");
        } else if(CommonUtils.isEmpty(stuInfo.getSpecialty())){
            return new ModelAndView("user/stuInformation", "message", "个人特长不能为空");
        }

        Map<String, String> params = new HashMap<>();
        params.put("nationality", stuInfo.getNationality());
        params.put("politicalStatus",stuInfo.getPoliticalStatus());
        params.put("beforeResidency", stuInfo.getBeforeResidency());
        params.put("graduatedSchool", stuInfo.getGraduatedSchool());
        params.put("totalNumOfFamily", stuInfo.getTotalNumOfFamily());
        params.put("houseStatus", stuInfo.getHouseStatus());
        params.put("specialty", stuInfo.getSpecialty());
        subsidizeInfoService.insertN(user.getId(), params);

        Map usersValue = new HashMap<>();
        usersValue.put("name", stuInfo.getName());
        usersValue.put("gender", stuInfo.getGender());
        //usersValue.put("birthday", stuInfo.getBirthday());
        usersValue.put("idCardNum", stuInfo.getIdCardNum());
        usersValue.put("phone", stuInfo.getPhone());


        try {
            userService.updateSomeValue(user.getId(), usersValue);
        } catch (NoSuchMethodException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }

        return new ModelAndView("redirect:/User/stuCommunication.do");
    }

    /**
     * 家庭通讯
     * @param request
     * @return
     */
    @RequestMapping(value = "/stuCommunication.do", method = RequestMethod.GET)
    public ModelAndView stuCommunication(HttpServletRequest request){

        /*User userSession = userService.selectOne(2L);
        request.getSession().setAttribute("user", userSession);*/

        ModelAndView modelAndView = new ModelAndView("user/stuCommunication");
        User user = (User) request.getSession().getAttribute("user");
        modelAndView.addObject("user", user);
        if(user != null) {
            Long userId = user.getId();
            modelAndView.addObject("inputPost", subsidizeInfoService.selectValueByKeyAndUserId("inputPost", userId));
            modelAndView.addObject("inputTel2", subsidizeInfoService.selectValueByKeyAndUserId("inputTel2", userId));
            modelAndView.addObject("inputAdd", subsidizeInfoService.selectValueByKeyAndUserId("inputAdd", userId));
        }

        return modelAndView;
    }

    @RequestMapping(value = "/stuCommunication.do", method = RequestMethod.POST)
    public ModelAndView stuCommunicationSubmit(HttpServletRequest request, String inputPost, String inputTel2, String inputAdd){
        User user = (User) request.getSession().getAttribute("user");
        if(CommonUtils.isEmpty(inputPost)){
            return new ModelAndView("user/stuCommunication", "message", "邮政编码不能为空");
        } else if(CommonUtils.isEmpty(inputTel2)){
            return new ModelAndView("user/stuCommunication", "message", "家长电话不能为空");
        } else if(CommonUtils.isEmpty(inputAdd)){
            return new ModelAndView("user/stuCommunication", "message", "家庭详细通讯地址不能为空");
        }

        Map<String, String> params = new HashMap<>();
        params.put("inputPost", inputPost);
        params.put("inputTel2",inputTel2);
        params.put("inputAdd", inputAdd);

        subsidizeInfoService.insertN(user.getId(), params);
        return new ModelAndView("redirect:/User/stuMember.do");
    }

    /**
     * 家庭成员信息
     * @param request
     * @return
     */
    @RequestMapping(value = "/stuMember.do", method = RequestMethod.GET)
    public ModelAndView stuMember(HttpServletRequest request){
        User user = (User) request.getSession().getAttribute("user");

        Member member = new Member();
        member.setUserId(user.getId());

        List<Member> memberList = memberService.selectList(member);

        return new ModelAndView("user/stuMember", "memberList", memberList);
    }

    @RequestMapping(value = "/stuMemberAdd.do", method = RequestMethod.GET)
    public ModelAndView stuMemberAdd(){
        return new ModelAndView("user/stuMemberAdd");
    }

    @RequestMapping(value = "/stuMemberAdd.do", method = RequestMethod.POST)
    public @ResponseBody AjaxResult stuMemberAddSubmit(Member member, HttpServletRequest request){
        if(CommonUtils.isEmpty(member.getName())){
            return AjaxResult.errorInstance("姓名必填");
        } else if(member.getAge() == null){
            return AjaxResult.errorInstance("年龄必填");
        } else if(CommonUtils.isEmpty(member.getProduct())){
            return AjaxResult.errorInstance("职业必填");
        } else if(CommonUtils.isEmpty(member.getYearIncome())){
            return AjaxResult.errorInstance("年收入必填");
        } else if(CommonUtils.isEmpty(member.getHealthStatus())){
            return AjaxResult.errorInstance("健康情况必填");
        } else if(CommonUtils.isEmpty(member.getEmployer())){
            member.setEmployer("无");
        } else if(CommonUtils.isEmpty(member.getMemberStatus())){
            return AjaxResult.errorInstance("成员情况必填");
        }

        User user = (User) request.getSession().getAttribute("user");
        member.setUserId(user.getId());
        memberService.insert(member);

        return AjaxResult.successInstance("添加成功");
    }

    @RequestMapping(value = "/stuMemberDel.do", method = RequestMethod.POST)
    public @ResponseBody AjaxResult stuMemberDel(Long id, HttpServletRequest request){
        if(id == null){
            return AjaxResult.errorInstance("删除失败");
        }
        memberService.delete(id);
        return AjaxResult.successInstance("删除成功");
    }




    /**
     * 家庭经济情况
     * @param request
     * @return
     */
    @RequestMapping(value = "/stuEconomic.do", method = RequestMethod.GET)
    public ModelAndView stuEconomic(HttpServletRequest request){

        // 要注释
       /* User userSession = userService.selectOne(2L);
        request.getSession().setAttribute("user", userSession);*/

        ModelAndView modelAndView = new ModelAndView("user/stuEconomic");
        User user = (User) request.getSession().getAttribute("user");
        modelAndView.addObject("user", user);
        if(user != null) {
            Long userId = user.getId();
            modelAndView.addObject("inputIncome", subsidizeInfoService.selectValueByKeyAndUserId("inputIncome", userId));
            modelAndView.addObject("inputHazard", subsidizeInfoService.selectValueByKeyAndUserId("inputHazard", userId));
            modelAndView.addObject("inputAccident", subsidizeInfoService.selectValueByKeyAndUserId("inputAccident", userId));
            modelAndView.addObject("inputLabor", subsidizeInfoService.selectValueByKeyAndUserId("inputLabor", userId));
            modelAndView.addObject("inputUnemployment", subsidizeInfoService.selectValueByKeyAndUserId("inputUnemployment", userId));
            modelAndView.addObject("inputDebt", subsidizeInfoService.selectValueByKeyAndUserId("inputDebt", userId));
            modelAndView.addObject("inputElse", subsidizeInfoService.selectValueByKeyAndUserId("inputElse", userId));
            modelAndView.addObject("subSidize", subsidizeInfoService.selectValueByKeyAndUserId("subSidize", userId));
        }

        return modelAndView;
    }

    @RequestMapping(value = "/stuEconomic.do", method = RequestMethod.POST)
    public ModelAndView stuEconomicSubmit(HttpServletRequest request, String inputIncome, String inputHazard, String inputAccident, String inputLabor, String inputUnemployment, String inputDebt, String inputElse, String subSidize){
        User user = (User) request.getSession().getAttribute("user");
        if(CommonUtils.isEmpty(inputIncome)){
            return new ModelAndView("user/stuEconomic", "message", "人均收入不能为空");
        }
        if(CommonUtils.isEmpty(inputHazard)){
            inputHazard = "无";
        }
        if(CommonUtils.isEmpty(inputAccident)){
            inputAccident = "无";
        }
        if(CommonUtils.isEmpty(inputLabor)){
            inputLabor = "无";
        }
        if(CommonUtils.isEmpty(inputUnemployment)){
            inputUnemployment = "无";
        }
        if(CommonUtils.isEmpty(inputDebt)){
            inputDebt = "无";
        }
        if(CommonUtils.isEmpty(inputElse)){
            inputElse = "无";
        }
        if(CommonUtils.isEmpty(subSidize)){
            subSidize = "无";
        }

        Map<String, String> params = new HashMap<>();
        params.put("inputIncome", inputIncome);
        params.put("inputHazard", inputHazard);
        params.put("inputAccident", inputAccident);
        params.put("inputLabor", inputLabor);
        params.put("inputUnemployment", inputUnemployment);
        params.put("inputDebt", inputDebt);
        params.put("inputElse", inputElse);
        params.put("subSidize", subSidize );

        subsidizeInfoService.insertN(user.getId(), params);
        return new ModelAndView("redirect:/User/stuDepartment.do");
    }

    /**
     * 民政部门信息
     * @param request
     * @return
     */
    @RequestMapping(value = "/stuDepartment.do", method = RequestMethod.GET)
    public ModelAndView stuDepartment(HttpServletRequest request){

        // 要注释
        /*User userSession = userService.selectOne(2L);
        request.getSession().setAttribute("user", userSession);*/

        ModelAndView modelAndView = new ModelAndView("user/stuDepartment");
        User user = (User) request.getSession().getAttribute("user");
        modelAndView.addObject("user", user);
        if(user != null) {
            Long userId = user.getId();
            modelAndView.addObject("inputPost2", subsidizeInfoService.selectValueByKeyAndUserId("inputPost2", userId));
            modelAndView.addObject("inputTel3", subsidizeInfoService.selectValueByKeyAndUserId("inputTel3", userId));
            modelAndView.addObject("inputAdd2", subsidizeInfoService.selectValueByKeyAndUserId("inputAdd2", userId));
        }

        return modelAndView;
    }

    @RequestMapping(value = "/stuDepartment.do", method = RequestMethod.POST)
    public ModelAndView stuDepartmentSubmit(HttpServletRequest request, String inputPost2, String inputTel3, String inputAdd2){
        User user = (User) request.getSession().getAttribute("user");
        if(CommonUtils.isEmpty(inputPost2)){
            return new ModelAndView("user/stuDepartment", "message", "邮政编码不能为空");
        } else if(CommonUtils.isEmpty(inputTel3)){
            return new ModelAndView("user/stuDepartment", "message", "电话号码不能为空");
        } else if(CommonUtils.isEmpty(inputAdd2)){
            return new ModelAndView("user/stuDepartment", "message", "地址不能为空");
        }

        Map<String, String> params = new HashMap<>();
        params.put("inputPost2", inputPost2);
        params.put("inputTel3", inputTel3);
        params.put("inputAdd2", inputAdd2);

        subsidizeInfoService.insertN(user.getId(), params);
        return new ModelAndView("redirect:/User/stuAttachment.do");
    }

    /**
     * 申请陈述
     * @param request
     * @return
     */
    @RequestMapping(value = "/stuStatement.do", method = RequestMethod.GET)
    public ModelAndView stuStatement(HttpServletRequest request){

        // 要注释
        /*User userSession = userService.selectOne(2L);
        request.getSession().setAttribute("user", userSession);*/

        ModelAndView modelAndView = new ModelAndView("user/stuStatement");
        User user = (User) request.getSession().getAttribute("user");
        modelAndView.addObject("user", user);
        if(user != null) {
            Long userId = user.getId();
            modelAndView.addObject("inputStatement", subsidizeInfoService.selectValueByKeyAndUserId("inputStatement", userId));
        }

        return modelAndView;
    }

    @RequestMapping(value = "/stuStatement.do", method = RequestMethod.POST)
    public ModelAndView stuStatementSubmit(HttpServletRequest request, String inputStatement){
        User user = (User) request.getSession().getAttribute("user");
        if(CommonUtils.isEmpty(inputStatement)){
            return new ModelAndView("user/stuStatement", "message", "申请陈述不能为空");
        }

        Map<String, String> params = new HashMap<>();
        params.put("inputStatement", inputStatement);

        subsidizeInfoService.insertN(user.getId(), params);
        return new ModelAndView("redirect:/User/stuFamily.do");
    }

    /**
     * 家庭简介
     * @param request
     * @return
     */
    @RequestMapping(value = "/stuFamily.do", method = RequestMethod.GET)
    public ModelAndView stuFamily(HttpServletRequest request){

        // 要注释
        /*User userSession = userService.selectOne(2L);
        request.getSession().setAttribute("user", userSession);*/

        ModelAndView modelAndView = new ModelAndView("user/stuFamily");
        User user = (User) request.getSession().getAttribute("user");
        modelAndView.addObject("user", user);
        if(user != null) {
            Long userId = user.getId();
            modelAndView.addObject("inputFamily", subsidizeInfoService.selectValueByKeyAndUserId("inputFamily", userId));
        }

        return modelAndView;
    }

    @RequestMapping(value = "/stuFamily.do", method = RequestMethod.POST)
    public ModelAndView stuFamilySubmit(HttpServletRequest request, String inputFamily){
        User user = (User) request.getSession().getAttribute("user");
        if(CommonUtils.isEmpty(inputFamily)){
            return new ModelAndView("user/stuFamily", "message", "家庭简介不能为空");
        }

        Map<String, String> params = new HashMap<>();
        params.put("inputFamily", inputFamily);

        subsidizeInfoService.insertN(user.getId(), params);
        return new ModelAndView("redirect:/");
    }

    /**
     * 附件信息
     * @param request
     * @return
     */
    @RequestMapping(value = "/stuAttachment.do", method = RequestMethod.GET)
    public ModelAndView stuAttachment(HttpServletRequest request){

        User user = (User) request.getSession().getAttribute("user");

        Attachment attachment = new Attachment();
        attachment.setUserId(user.getId());

        List<Attachment> attachmentList = attachmentService.selectList(attachment);

        ModelAndView modelAndView = new ModelAndView("user/stuAttachment");
        modelAndView.addObject("attachmentList", attachmentList);

        return modelAndView;
    }

    @RequestMapping(value = "/stuAttachmentAdd.do", method = RequestMethod.GET)
    public ModelAndView stuAttachmentAdd(HttpServletRequest request){

        return new ModelAndView("user/stuAttachmentAdd");
    }



}
