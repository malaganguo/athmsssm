package com.malaganguo.athmsssm.service.impl;

import com.malaganguo.athmsssm.dao.IUserDao;
import com.malaganguo.athmsssm.model.User;
import com.malaganguo.athmsssm.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("userService")
public class UserServiceImpl implements IUserService {

    @Autowired
    private IUserDao iUserDao;

    @Override
    public List<User> selectUser() {
        return this.iUserDao.selectUser();
    }

    @Override
    public void insertAuthorUser(User user) {
        iUserDao.insertAuthorUser(user);
    }

    @Override
    public void insertAuthorUsers(User user) {
        iUserDao.insertAuthorUsers(user);
    }
}
