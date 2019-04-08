package com.malaganguo.athmsssm.service;

import com.malaganguo.athmsssm.model.User;

import java.util.List;

public interface IUserService {

    List<User> selectUser();

    void insertAuthorUser(User user);

    void insertAuthorUsers(User user);
}
