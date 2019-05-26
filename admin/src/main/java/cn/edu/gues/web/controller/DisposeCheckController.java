package cn.edu.gues.web.controller;

import cn.edu.gues.pojo.SubsidizeInfo;
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

    /**
     * 资格审核-申请陈述查看
     * @return
     */
    @RequestMapping("/state.do")
    public ModelAndView state(){

        SubsidizeInfo subsidizeInfo = new SubsidizeInfo();
        subsidizeInfo.setKey("inputStatement");
        subsidizeInfo.setUserId(1L); // ？？
        subsidizeInfo = subsidizeInfoService.selectOne(subsidizeInfo);

        return new ModelAndView("disposeCheck/state", "subsidizeInfo", subsidizeInfo);
    }



}
