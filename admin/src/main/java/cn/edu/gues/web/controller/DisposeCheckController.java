package cn.edu.gues.web.controller;

import cn.edu.gues.pojo.AdminUser;
import cn.edu.gues.pojo.Role;
import cn.edu.gues.pojo.SubsidizeInfo;
import cn.edu.gues.service.AdminUserRoleService;
import cn.edu.gues.service.SubsidizeInfoService;
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
 * DisposeCheckController
 *
 * @author Wonder
 * @date 2019-05-27
 **/
@Controller
@RequestMapping("/DisposeCheck")
public class DisposeCheckController {

    @Autowired
    private SubsidizeInfoService subsidizeInfoService;

    @Autowired
    private AdminUserRoleService adminUserRoleService;

    /**
     * 资格审核-申请陈述查看
     * @return
     */
    @RequestMapping("/state.do")
    public ModelAndView state(Long id){

        SubsidizeInfo subsidizeInfo = new SubsidizeInfo();
        subsidizeInfo.setKey("inputStatement");
        subsidizeInfo.setUserId(id);
        subsidizeInfo = subsidizeInfoService.selectOne(subsidizeInfo);
        ModelAndView modelAndView = new ModelAndView("disposeCheck/state");
        modelAndView.addObject( "subsidizeInfo", subsidizeInfo);
        modelAndView.addObject("userId", id);
        System.out.println(id);

        return modelAndView;
    }


    @RequestMapping(value = "/check.do", method = RequestMethod.GET)
    public ModelAndView check(Long userId, HttpServletRequest request){

        AdminUser adminUser = (AdminUser) request.getSession().getAttribute("adminUser");
        Role role = adminUserRoleService.selectSecondListByFirstId(adminUser.getId()).get(0);

        SubsidizeInfo subsidizeInfo = new SubsidizeInfo();
        subsidizeInfo.setKey("inputStatement");
        subsidizeInfo.setUserId(userId);
        subsidizeInfo = subsidizeInfoService.selectOne(subsidizeInfo);

        ModelAndView modelAndView = new ModelAndView("disposeCheck/check");
        modelAndView.addObject("adminUser", adminUser);
        modelAndView.addObject("subsidizeInfo", subsidizeInfo);
        modelAndView.addObject("userId", userId);

        return modelAndView;
    }

    @RequestMapping(value = "/check.do", method = RequestMethod.POST)
    public @ResponseBody AjaxResult checkSubmit(Long userId, int checkStatus, int economyStatus, Long id, String description, HttpServletRequest request){
        AdminUser adminUser = (AdminUser) request.getSession().getAttribute("adminUser");
        Role role = adminUserRoleService.selectSecondListByFirstId(adminUser.getId()).get(0);

        SubsidizeInfo subsidizeInfo = new SubsidizeInfo();
        subsidizeInfo.setUserId(userId);
        subsidizeInfo.setKey("inputStatement");

        subsidizeInfo = subsidizeInfoService.selectOne(subsidizeInfo);

        Long roleId = role.getId();

        if(checkStatus == 1){
            if(roleId == 2L){
                subsidizeInfo.setCheckStatus(9);
            } else if(roleId == 5L){
                subsidizeInfo.setCheckStatus(12);
            } else if(roleId == 6L){
                subsidizeInfo.setCheckStatus(15);
            } else if(roleId == 7L){
                if(economyStatus == 1){
                    subsidizeInfo.setCheckStatus(6);
                } else if(economyStatus == 2){
                    subsidizeInfo.setCheckStatus(5);
                } else if(economyStatus == 3){
                    subsidizeInfo.setCheckStatus(7);
                } else if(economyStatus == 4){
                    subsidizeInfo.setCheckStatus(8);
                }
            }
        } else if(checkStatus == 2){
            if(roleId == 2L){
                subsidizeInfo.setCheckStatus(10);
            } else if(roleId == 5L){
                subsidizeInfo.setCheckStatus(13);
            } else if(roleId == 6L){
                subsidizeInfo.setCheckStatus(16);
            } else if(roleId == 7L){
                subsidizeInfo.setCheckStatus(19);
            }
        } else if(checkStatus == 3){
            if(roleId == 2L){
                subsidizeInfo.setCheckStatus(11);
            } else if(roleId == 5L){
                subsidizeInfo.setCheckStatus(14);
            } else if(roleId == 6L){
                subsidizeInfo.setCheckStatus(17);
            } else if(roleId == 7L){
                subsidizeInfo.setCheckStatus(20);
            }
            if(description != null){
                SubsidizeInfo subsidizeInfoDesc = new SubsidizeInfo();
                subsidizeInfoDesc.setKey("checkDescription");
                subsidizeInfoDesc.setUserId(userId);
                subsidizeInfoDesc.setValue(description);
                subsidizeInfoService.insert(subsidizeInfoDesc);
            }
        }
        subsidizeInfoService.update(subsidizeInfo);

        return AjaxResult.successInstance("审核完成");
    }



}
