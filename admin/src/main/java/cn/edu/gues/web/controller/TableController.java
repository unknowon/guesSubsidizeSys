package cn.edu.gues.web.controller;

import cn.edu.gues.pojo.Member;
import cn.edu.gues.pojo.SubsidizeInfo;
import cn.edu.gues.pojo.User;
import cn.edu.gues.service.MemberService;
import cn.edu.gues.service.SubsidizeInfoService;
import cn.edu.gues.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * TableController
 *
 * @author lulu
 * @date 2019-05-15
 **/
@Controller
@RequestMapping("/Table")
public class TableController {

    @Autowired
    private UserService userService;

    @Autowired
    private SubsidizeInfoService subsidizeInfoService;

    @Autowired
    private MemberService memberService;

    @RequestMapping("/surveyForm.do")
    public ModelAndView surveyForm(HttpServletRequest request){

        User user = (User) request.getSession().getAttribute("user");
        ModelAndView modelAndView = new ModelAndView("tables/surveyForm");

        if(user != null){
            modelAndView.addObject("user", user);
            Long userId = user.getId();


            Member member = new Member();
            member.setUserId(userId);
            List<Member> memberList = memberService.selectList(member);
            modelAndView.addObject("memberList", memberList);

            Map<String, String> map = subsidizeInfoService.selectMapByUserId(userId);
            modelAndView.addObject("subInfo", map);
        }
        return modelAndView;
    }

    @RequestMapping("/affirmsForm.do")
    public ModelAndView affirmsForm(HttpServletRequest request){
        User user = (User) request.getSession().getAttribute("user");
        ModelAndView modelAndView = new ModelAndView("tables/affirmsForm");

        if(user != null){
            modelAndView.addObject("user", user);
            Long userId = user.getId();

            Map<String, String> map = subsidizeInfoService.selectMapByUserId(userId);
            modelAndView.addObject("subInfo", map);

            Member member = new Member();
            member.setUserId(userId);
            List<Member> memberList = memberService.selectList(member);
            modelAndView.addObject("memberList", memberList);

            SubsidizeInfo subsidizeInfo = new SubsidizeInfo();
            subsidizeInfo.setUserId(userId);
            subsidizeInfo.setKey("nationality");
            subsidizeInfo = subsidizeInfoService.selectOne(subsidizeInfo);
            modelAndView.addObject("otherInfo", subsidizeInfo);
        }
        return modelAndView;
    }
}
