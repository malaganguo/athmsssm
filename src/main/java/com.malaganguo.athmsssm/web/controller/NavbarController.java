package com.malaganguo.athmsssm.web.controller;

import com.malaganguo.athmsssm.service.impl.MainPageServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class NavbarController {

    @Autowired
    private MainPageServiceImpl mainPageService;
    //跳转主页
    @RequestMapping("toMain.action")
    public String toMain(Model model){
        List<Integer> list = mainPageService.selectMainPageStatus();
        model.addAttribute("countSite",list.get(0));
        model.addAttribute("countUser",list.get(1));
        return "main";
    }
    //跳转数据查询
    @RequestMapping("toDataQuery.action")
    public String toDataQuery(){
        return "data_query";
    }
    //跳转数据分析：站点分析、数据类型分析、时间段分析
    @RequestMapping("toAnalysisSite.action")
    public String toAnalysisSite(){
        return "analysis-site";
    }
    @RequestMapping("toAnalysisDataType.action")
    public String toAnalysisDataType(){
        return "analysis-dataType";
    }
    @RequestMapping("toAnalysisDataTime.action")
    public String toAnalysisDataTime(){
        return "analysis-dataTime";
    }

    @RequestMapping("toAnalysisTemp.action")
    public String toAnalysisTemp(){
        return  "analysis-temp";
    }
    @RequestMapping("toAnalysisHum.action")
    public String toAnalysisHum(){
        return "analysis-hum";
    }
    //跳转权限管理：创建用户、权限分配、管理员名单
    @RequestMapping("toAuthorization.action")
    public String toAuthorization(){
        return "authorization-manage";
    }
    /*@RequestMapping("toCreateUser.action")
    public String toCreateUser(){
        return "create-user";
    }
    @RequestMapping("toVisitAuthority.action")
    public String toVisitAuthority(){
        return "authority-visit";
    }
    @RequestMapping("toAdminList.action")
    public String toAdminList(){
        return "admin-list";
    }*/
    //跳转系统配置：监测点管理、区域划分、操作日志
    @RequestMapping("toSiteManage.action")
    public String toSiteManage(){
        return "manage-site";
    }
    /*@RequestMapping("toAreaDivide.action")
    public String toAreaDivide(){
        return "area-divide";
    }*/
    @RequestMapping("toOperateLog.action")
    public String toOperateLog(){
        return "log-operate";
    }
}
