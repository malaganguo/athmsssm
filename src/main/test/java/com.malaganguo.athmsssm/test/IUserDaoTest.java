package com.malaganguo.athmsssm.test;

import com.malaganguo.athmsssm.dao.IUserDao;
import com.malaganguo.athmsssm.dao.IUserLoginDao;
import com.malaganguo.athmsssm.model.User;
import com.malaganguo.athmsssm.service.impl.UserServiceImpl;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring-mybatis.xml"})
public class IUserDaoTest {
    @Autowired
    private IUserDao dao;

    @Autowired
    private IUserLoginDao userLoginDao;

    @Autowired
    private UserServiceImpl userService;

    @Test
    public void testSelectUser() throws Exception {
        long id = 1;
        List<User> user = userService.selectUser();
        for (User u: user
             ) {
            System.out.println(u.toString());
        }
    }
}
