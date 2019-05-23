package cn.edu.gues.web.controller;

import cn.edu.gues.pojo.College;
import cn.edu.gues.service.CollegeService;
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
 * CollegeController
 *
 * @author lulu
 * @date 2019-05-23
 **/
@Controller
@RequestMapping("/College")
public class CollegeController {

    @Autowired
    private CollegeService collegeService;

    /**
     * 学院班级管理-学院管理
     * @return
     */
    @RequestMapping("/collegeList.do")
    public ModelAndView academyList(){

        //因为要查学院，是和学院有关的，所以用CollegeService
        //把所有的学院查出来
        List<College> collegeList = collegeService.selectList();
        ModelAndView modelAndView = new ModelAndView("college/list");
        //把查出来的
        modelAndView.addObject("collegeList", collegeList);

        return modelAndView;
    }

    @RequestMapping(value = "/collegeAdd.do", method = RequestMethod.GET)
    public ModelAndView collegeAdd(){
        return new ModelAndView("college/add");
    }

    @RequestMapping(value = "/collegeAdd.do", method = RequestMethod.POST)
    public @ResponseBody AjaxResult collegeAddSubmit(String name, HttpServletRequest request){

        if(CommonUtils.isEmpty(name)){
            return AjaxResult.errorInstance("学院名不能为空");
        }

        College college = new College();
        college.setName(name);
        collegeService.insert(college);

        return AjaxResult.successInstance("添加成功");
    }

    @RequestMapping(value = "/collegeEdit.do", method = RequestMethod.GET)
    public ModelAndView collegeEdit(Long id){
        College college = collegeService.selectOne(id);

        return new ModelAndView("college/edit", "college", college);
    }

    @RequestMapping(value = "/collegeEdit.do", method = RequestMethod.POST)
    public @ResponseBody AjaxResult collegeEditSubmit(Long id, String name, HttpServletRequest request){

        if(CommonUtils.isEmpty(name)){
            return AjaxResult.errorInstance("学院名不能为空");
        }

        College college = new College();
        college.setName(name);
        college = collegeService.selectOne(college);
        if(college != null && college.getId().equals(id)){
            return AjaxResult.errorInstance("该学院已经存在");
        }
        college = collegeService.selectOne(id);
        college.setName(name);
        collegeService.update(college);

        return AjaxResult.successInstance("添加成功");
    }


    @RequestMapping("/collegeDelete.do")
    public @ResponseBody AjaxResult collegeDelete(Long id){
        collegeService.delete(id);
        return AjaxResult.successInstance("删除成功");
    }

}
