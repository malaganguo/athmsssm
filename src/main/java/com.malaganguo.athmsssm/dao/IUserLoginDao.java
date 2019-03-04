package com.malaganguo.athmsssm.dao;

import com.malaganguo.athmsssm.model.User;
import org.apache.ibatis.annotations.Param;

public interface IUserLoginDao {
    //登录接口
    User userLoginCheck(@Param("username") String username, @Param("password") String password);

    //注册接口
    int userRegister(@Param("username") String username,@Param("password") String password,@Param("email") String email);
}
