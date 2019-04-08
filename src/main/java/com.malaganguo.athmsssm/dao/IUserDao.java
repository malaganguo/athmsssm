package com.malaganguo.athmsssm.dao;

import com.malaganguo.athmsssm.model.User;

import java.util.List;

public interface IUserDao {

    List<User> selectUser();

    void insertAuthorUser(User user);

    void insertAuthorUsers(User user);

}
