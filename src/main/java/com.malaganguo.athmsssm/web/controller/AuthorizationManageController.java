package com.malaganguo.athmsssm.web.controller;

import com.malaganguo.athmsssm.model.User;
import com.malaganguo.athmsssm.service.impl.UserServiceImpl;
import com.malaganguo.athmsssm.utils.GetIPUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
public class AuthorizationManageController {

    private static final Logger LOGGER = Logger.getLogger(AuthorizationManageController.class);

    @Autowired
    private UserServiceImpl userService;

    @RequestMapping("/userShow.action")
    @ResponseBody
    public List<User> selectUser(){
        List<User> u = userService.selectUser();
        for (User uu: u
             ) {
            System.out.println(u.toString());
        }
        return u;
    }

    @RequestMapping("/authorOneUser.action")
    @ResponseBody
    public User authorOneUser(HttpServletRequest request, User user){
        try {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String email = request.getParameter("email");
            String role = request.getParameter("role");
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String date = sdf.format(new Date());

            user.setUsername(username);
            user.setPassword(password);
            user.setEmail(email);
            user.setRole(role);
            user.setRegTime(date);

            userService.insertAuthorUser(user);
        } catch (Exception e) {
            LOGGER.debug("创建单个用户失败，失败原因：{}"+e.getMessage());
        }
        return user;
    }

    @RequestMapping("/authorUsers.action")
    @ResponseBody
    public User authorUsers(HttpServletRequest request, User user){
        try {
            int userNumber = Integer.parseInt(request.getParameter("userNumber"));
            String usernamePrefix = request.getParameter("usernamePrefix");
            String password = request.getParameter("password");
            String role = request.getParameter("role");

            for (int i=0;i<userNumber;i++){
                user.setUsername(usernamePrefix+i+"");
                user.setPassword(password);
                user.setRole(role);
                userService.insertAuthorUsers(user);
            }
        } catch (NumberFormatException e) {
            LOGGER.debug("注册多用户失败，原因：{}"+e.getMessage());
        }
        return user;
    }
}
