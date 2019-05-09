package cn.edu.gues.web.controller;

import cn.edu.gues.pojo.User;
import cn.edu.gues.service.SubsidizeInfoService;
import cn.edu.gues.service.UserService;
import cn.edu.gues.util.AjaxResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

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

    @RequestMapping(value = "stuInformation.do", method = RequestMethod.GET)
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

    @RequestMapping(value = "stuInformation.do", method = RequestMethod.POST)
    public AjaxResult stuInformationSubmit(User pageUser, String nationality, String politicalStatus, String beforeResidency, String graduatedSchool, String totalNumOfFamily, String houseStatus, String specialty){



        return AjaxResult.successInstance("");
    }
}
