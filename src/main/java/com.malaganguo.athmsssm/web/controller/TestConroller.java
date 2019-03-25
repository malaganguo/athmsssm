package com.malaganguo.athmsssm.web.controller;

import com.malaganguo.athmsssm.model.ConditionModel;
import com.malaganguo.athmsssm.service.impl.UserLoginServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TestConroller {

    @Autowired
    private UserLoginServiceImpl userLoginService;
    @GetMapping("hello.action")
    public String index() throws Exception {

        return "helloworld";
    }
}
