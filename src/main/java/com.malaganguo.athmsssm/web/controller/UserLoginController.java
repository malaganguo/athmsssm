package com.malaganguo.athmsssm.web.controller;


import com.malaganguo.athmsssm.model.User;
import com.malaganguo.athmsssm.service.impl.UserLoginServiceImpl;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;

@Controller
public class UserLoginController {
    @Resource
    private UserLoginServiceImpl userLoginService;

    @RequestMapping("/userLogin.action")
    public ModelAndView userLogin(@Param("username")String username, @Param("password")String password){

        User user = userLoginService.findUser(username, password);
        ModelAndView mav = new ModelAndView();
        if(user == null || user.equals(null)){
            mav.setViewName("login");

        }else{
            mav.setViewName("helloworld");
        }

        return mav;
    }

    @RequestMapping("/toUserRegister.action")
    public ModelAndView toUserRegister(String username,String password){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("register_login");
        return mav;
    }

    @RequestMapping("/userRegister.action")
    public ModelAndView userRegister(String username, String password, String email){
        ModelAndView mav = new ModelAndView();
        int temp = 0 ;
        temp = userLoginService.registerUser(username,password,email);
        if(temp>0){
            mav.setViewName("login");
        }else{
            mav.setViewName("register_login");
        }
        return mav;
    }
}
