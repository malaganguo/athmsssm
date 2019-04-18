package com.malaganguo.athmsssm.service.impl;

import com.malaganguo.athmsssm.dao.IUserLoginDao;
import com.malaganguo.athmsssm.model.User;
import com.malaganguo.athmsssm.service.IUserLoginService;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class UserLoginServiceImpl implements IUserLoginService {

    private static final Logger LOGGER = Logger.getLogger(UserLoginServiceImpl.class);
    @Resource
    private IUserLoginDao userLoginDao;


    @Override
    public User findUser(String username,String password) {
        User user = null;
        try {
           user = userLoginDao.userLoginCheck(username, password);

        }catch (Exception e){
            LOGGER.debug("##login fail，cause by:"+e.getMessage());
            e.printStackTrace();
            return null;
        }

        return user;

    }

    @Override
    public int registerUser(String username, String password, String email,String regIp) {
        int temp = 0;
        try{
            temp = userLoginDao.userRegister(username,password,email,regIp);
        }catch(Exception e){
            System.out.println("##register fail,caused by:"+e.getMessage());
            e.printStackTrace();

        }
        return temp;
    }
}
