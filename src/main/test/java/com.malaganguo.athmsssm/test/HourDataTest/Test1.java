package com.malaganguo.athmsssm.test.HourDataTest;

import com.malaganguo.athmsssm.model.User;
import com.malaganguo.athmsssm.service.impl.UserLoginServiceImpl;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

public class Test1 {
    @Before
    public void before(){
        String xmlPath = "D:\\athmsssm\\src\\main\\resources\\spring-mybatis.xml";
        ApplicationContext context = new FileSystemXmlApplicationContext(xmlPath);
    }
    @Test
    public void test1() throws Exception {
        UserLoginServiceImpl userLoginService = new UserLoginServiceImpl();
        User xxxxx = userLoginService.findUser("aloha", "aloha");
        System.out.println(xxxxx.toString());
    }
}
