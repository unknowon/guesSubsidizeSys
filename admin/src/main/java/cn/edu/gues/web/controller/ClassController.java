package cn.edu.gues.web.controller;

import cn.edu.gues.pojo.Class;
import cn.edu.gues.service.ClassService;
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
 * ClassController
 *
 * @author Wonder
 * @date 2019-05-23
 **/
@Controller
@RequestMapping("/Class")
public class ClassController {

    @Autowired
    private ClassService classService;

    /**
     * 学院班级管理-班级管理
     * @return
     */
    @RequestMapping("/classList.do")
    public ModelAndView classList(){

        //因为要查学院，是和学院有关的，所以用CollegeService
        //把所有的学院查出来
        List<Class> classList = classService.selectList();
        ModelAndView modelAndView = new ModelAndView("class/list");
        //把查出来的
        modelAndView.addObject("classList", classList);
        for(int i=0; i<classList.size(); i++){
            System.out.println(classList.get(i).getId());

        }

        return modelAndView;
    }

    @RequestMapping(value = "/classAdd.do", method = RequestMethod.GET)
    public ModelAndView collegeAdd(){
        return new ModelAndView("class/add");
    }

    @RequestMapping(value = "/classAdd.do", method = RequestMethod.POST)
    public @ResponseBody AjaxResult classAddSubmit(String name, HttpServletRequest request){

        if(CommonUtils.isEmpty(name)){
            return AjaxResult.errorInstance("班级名不能为空");
        }

        Class cls = new Class();
        cls.setName(name);
        classService.insert(cls);

        return AjaxResult.successInstance("添加成功");
    }

    @RequestMapping(value = "/classEdit.do", method = RequestMethod.GET)
    public ModelAndView classEdit(Long id){
        Class cls = classService.selectOne(id);

        return new ModelAndView("class/edit", "class", cls);
    }

    @RequestMapping(value = "/classEdit.do", method = RequestMethod.POST)
    public @ResponseBody AjaxResult classEditSubmit(Long id, String name, HttpServletRequest request){

        if(CommonUtils.isEmpty(name)){
            return AjaxResult.errorInstance("班级名不能为空");
        }

        Class cls = new Class();
        cls.setName(name);
        cls = classService.selectOne(cls);
        if(cls != null && cls.getId().equals(id)){
            return AjaxResult.errorInstance("该班级已经存在");
        }
        cls = classService.selectOne(id);
        cls.setName(name);
        classService.update(cls);

        return AjaxResult.successInstance("添加成功");
    }


    @RequestMapping("/classDelete.do")
    public @ResponseBody AjaxResult classDelete(Long id){
        classService.delete(id);
        return AjaxResult.successInstance("删除成功");
    }

}
