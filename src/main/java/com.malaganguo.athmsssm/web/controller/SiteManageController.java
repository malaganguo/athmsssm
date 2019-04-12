package com.malaganguo.athmsssm.web.controller;

import com.google.gson.Gson;
import com.malaganguo.athmsssm.model.SiteModel;
import com.malaganguo.athmsssm.service.impl.SiteServiceImpl;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Controller
public class SiteManageController {

    private static final Logger LOGGER = Logger.getLogger(SiteManageController.class);
    private static final Gson GSON = new Gson();
    @Autowired
    private SiteServiceImpl siteService;

    @RequestMapping("/addSite.action")
    @ResponseBody
    public String addSite(HttpServletRequest request,SiteModel site){
        site.setSiteName(request.getParameter("siteName"));
        site.setSiteArea(request.getParameter("siteArea"));
        site.setAddPerson(request.getParameter("addPerson"));
        site.setAddTime(request.getParameter("addTime"));
        siteService.addSite(site);
        LOGGER.debug("新建站点，站点信息："+site.toString());
        return GSON.toJson("selectResult");
    }


    @RequestMapping("/selectAllSite.action")
    @ResponseBody
    public List<SiteModel> selectAllSite(){
        return siteService.selectAllSite();
    }
}
