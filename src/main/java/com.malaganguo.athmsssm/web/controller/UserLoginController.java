package com.malaganguo.athmsssm.web.controller;


import com.malaganguo.athmsssm.model.User;
import com.malaganguo.athmsssm.service.impl.MainPageServiceImpl;
import com.malaganguo.athmsssm.service.impl.UserLoginServiceImpl;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Controller
public class UserLoginController {

    @Resource
    private UserLoginServiceImpl userLoginService;

    @Autowired
    private MainPageServiceImpl mainPageService;

    @RequestMapping("/userLogin.action")
    public String userLogin(HttpServletRequest request, @Param("username")String username, @Param("password")String password,Model model){

        User user = userLoginService.findUser(username, password);
        if(user == null || user.equals(null)){
            return "login";
        }
        ServletContext servletContext = request.getServletContext();
        servletContext.setAttribute("user",user);
        List<Integer> list = mainPageService.selectMainPageStatus();
        model.addAttribute("countSite",list.get(0));
        model.addAttribute("countUser",list.get(1));
        return "main";

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

    @RequestMapping("/UserLogout.action")
    public ModelAndView  UserLogout(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("login");
        return mav;
    }
}
