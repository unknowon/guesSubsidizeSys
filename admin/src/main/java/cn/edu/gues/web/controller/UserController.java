package cn.edu.gues.web.controller;

import cn.edu.gues.pojo.Member;
import cn.edu.gues.pojo.StuInformation;
import cn.edu.gues.pojo.User;
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
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.InvocationTargetException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    @RequestMapping(value = "/stuCommunication.do", method = RequestMethod.GET)
    public ModelAndView stuCommunication(HttpServletRequest request){

        User userSession = userService.selectOne(2L);
        request.getSession().setAttribute("user", userSession);

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

    @RequestMapping(value = "/stuMember.do", method = RequestMethod.GET)
    public ModelAndView stuMember(HttpServletRequest request){
        User user = (User) request.getSession().getAttribute("user");

        Member member = new Member();
        member.setUserId(user.getId());

        List<Member> memberList = memberService.selectList(member);

        return new ModelAndView("user/stuMember", "memberList", memberList);
    }

}
