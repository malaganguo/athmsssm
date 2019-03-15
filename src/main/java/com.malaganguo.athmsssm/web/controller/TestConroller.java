package com.malaganguo.athmsssm.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TestConroller {

    @GetMapping("hello.action")
    public String index(){
        return "jsp/helloworld";
    }
}
