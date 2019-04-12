package com.malaganguo.athmsssm.service.impl;

import com.malaganguo.athmsssm.dao.ISiteDao;
import com.malaganguo.athmsssm.dao.IUserDao;
import com.malaganguo.athmsssm.service.IMainPageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class MainPageServiceImpl implements IMainPageService {

    @Autowired
    private ISiteDao siteDao;
    @Autowired
    private IUserDao userDao;

    @Override
    public List<Integer> selectMainPageStatus() {
        ArrayList<Integer> list = new ArrayList<>();
        int countSite = siteDao.selectCountSite();
        int countUser = userDao.selectCountUser();
        list.add(countSite);
        list.add(countUser);
        return list;
    }
}
