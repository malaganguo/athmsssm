package com.malaganguo.athmsssm.service;

import com.malaganguo.athmsssm.model.User;

public interface IUserLoginService {

    User findUser(String username,String password);

    int registerUser(String username, String password, String email,String regIp);
}
