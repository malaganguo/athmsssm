package com.malaganguo.athmsssm.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class NavbarController {
    //跳转主页
    @RequestMapping("toMain.action")
    public String toMain(){
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
    //跳转权限管理：创建用户、权限分配、管理员名单
    @RequestMapping("toCreateUser.action")
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
    }
    //跳转系统配置：监测点管理、区域划分、操作日志
    @RequestMapping("toSiteManage.action")
    public String toSiteManage(){
        return "manage-site";
    }
    @RequestMapping("toAreaDivide.action")
    public String toAreaDivide(){
        return "area-divide";
    }
    @RequestMapping("toOperateLog.action")
    public String toOperateLog(){
        return "log-operate";
    }
}
