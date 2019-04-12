package com.malaganguo.athmsssm.web.controller;

import com.malaganguo.athmsssm.service.impl.MainPageServiceImpl;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import sun.applet.Main;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public class MainDataController {

    private static final Logger LOGGER = Logger.getLogger(MainDataController.class);

    @Autowired
    private MainPageServiceImpl mainPageService;

    @RequestMapping("/pageStatus.action")
    @ResponseBody
    public List<Integer> pageStatus(){
        List<Integer> list = mainPageService.selectMainPageStatus();
        return list;
    }
}
