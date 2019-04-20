package com.malaganguo.athmsssm.test;

import com.malaganguo.athmsssm.dao.IDataQueryDao;
import com.malaganguo.athmsssm.dao.ISiteDao;
import com.malaganguo.athmsssm.dao.IUserDao;
import com.malaganguo.athmsssm.dao.IUserLoginDao;
import com.malaganguo.athmsssm.model.HoursDataModel;
import com.malaganguo.athmsssm.model.SiteModel;
import com.malaganguo.athmsssm.model.User;
import com.malaganguo.athmsssm.service.impl.UserServiceImpl;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.ArrayList;
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

    @Autowired
    private ISiteDao siteDao;

    @Autowired
    private IDataQueryDao dataQueryDao;
    @Test
    public void testSelectUser() throws Exception {
        long id = 1;
        List<User> user = userService.selectUser();
        for (User u: user
             ) {
            System.out.println(u.toString());
        }
    }

    @Test
    public void testSelectAllData(){
        List<SiteModel> siteModels = siteDao.selectAllSite();
        List<String> sites = new ArrayList<>();
        for (SiteModel s: siteModels
             ) {
            sites.add(s.getSiteTable());
        }
        for (String l: sites
             ) {
            System.out.println("~~~"+l);
        }
        List<HoursDataModel> hoursDataModels = dataQueryDao.dataQueryByTimeAndAllSite(sites);
        for (HoursDataModel hd: hoursDataModels
             ) {
            System.out.println(hd.toString());
        }
    }
}
