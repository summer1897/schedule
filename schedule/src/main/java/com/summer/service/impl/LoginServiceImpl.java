package com.summer.service.impl;

import com.summer.model.User;
import com.summer.service.ILoginService;

/**
 * Created by Intellij IDEA
 *
 * @Author summer
 * @Date 2017/10/29 下午4:46
 * @Description
 */
public class LoginServiceImpl implements ILoginService {

    public User login(String account, String password) {
        String sql = "select id,username,email,phone,photo,status,create_time"
                + " from sys_user where (username = ? or email = ? or phone = ?)"
                + " and password = ?";

        return User.dao.findFirst(sql,account,account,account,password);
    }
}
