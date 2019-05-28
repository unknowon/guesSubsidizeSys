package cn.edu.gues.web.controller;

import cn.edu.gues.pojo.AdminUser;
import cn.edu.gues.pojo.Class;
import cn.edu.gues.pojo.StudentBaseInfo;
import cn.edu.gues.pojo.TeaCheckUserPojo;
import cn.edu.gues.service.SubsidizeInfoService;
import cn.edu.gues.service.UserService;
import cn.edu.gues.util.CommonUtils;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.*;


/**
 * AdminController
 *
 * @author lulu
 * @date 2019-05-16
 **/
@Controller
@RequestMapping("/Admin")
public class AdminController {

    @Autowired
    private SubsidizeInfoService subsidizeInfoService;

    @Autowired
    private UserService userService;

    @InitBinder
    public void initBinder(WebDataBinder binder){
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }

    @RequestMapping("/indexTeacher.do")
    public ModelAndView indexTeacher(){
        return new ModelAndView("indexTeacher");
    }

    @RequestMapping("/teaCheck.do")
    public ModelAndView teaCheck(Integer curr, Integer checkStatus, String name, Integer year, HttpServletRequest request){
        if(curr == null){
            curr = 1;
        }
        if(year == null){
            Calendar cal = Calendar.getInstance();
            year = cal.get(Calendar.YEAR);
        }
        if(CommonUtils.isEmpty(name)){
            name = null;
        }

        if(checkStatus != null && checkStatus.equals(9)){
            checkStatus = null;
        }

        AdminUser adminUser = (AdminUser) request.getSession().getAttribute("adminUser");
        //List<Class> classList = (List<Class>) request.getSession().getAttribute("classList");

        Map<String , Object> params = new HashMap<String, Object>();
        params.put("checkStatus", checkStatus);
        params.put("year", year);
        params.put("name", name);
        params.put("adminUserId", adminUser.getId());

        PageInfo<TeaCheckUserPojo> pageInfo = userService.search(curr, 10, params);

        return new ModelAndView("teacher/teaCheck", "pageInfo", pageInfo);
    }



    /**
     * 学生信息
     * @return
     */
    @RequestMapping(value = "/studentInformation.do", method = RequestMethod.GET)
    public ModelAndView studentInformation(Integer curr, String param){

        if(curr == null){
            curr = 1;
        }

        if(!CommonUtils.isEmpty(param)){
            param = "%"+param+"%";
        } else{
            param = null;
        }

        Map<String , Object> params = new HashMap<String, Object>();
        params.put("param", param);

        PageInfo<StudentBaseInfo> pageInfo = userService.selectAllBaseInfo(curr, 10, params);

        return new ModelAndView("teacher/studentInformation", "pageInfo", pageInfo);
    }

}
