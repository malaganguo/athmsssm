package com.malaganguo.athmsssm.service.impl;

import com.malaganguo.athmsssm.dao.IUserDao;
import com.malaganguo.athmsssm.model.User;
import com.malaganguo.athmsssm.service.IUserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service("userService")
public class UserServiceImpl implements IUserService {

    @Resource
    private IUserDao iUserDao;

    @Override
    public User selectUser(long userId) {
        return this.iUserDao.selectUser(userId);
    }
}
