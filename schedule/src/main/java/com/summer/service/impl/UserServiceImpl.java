package com.summer.service.impl;

import com.summer.model.User;
import com.summer.service.IUserService;

import java.util.List;

/**
 * Created by yangyang on 2017/11/8.
 */
public class UserServiceImpl implements IUserService {

    private StringBuilder sql = new StringBuilder();

    {
        sql.append("select id,username,email,phone,status,photo,create_time ");
    }

    public List<User> queryAll() {
        return User.dao.find(sql.append("from sys_user").toString());
    }

    public User queryByName(String username) {
        User user = null;

        if (null != username && !"".equals(username.trim())) {
            sql.append("from sys_user where username = ?");
            user = User.dao.findFirst(sql.toString(),username);
        }

        return user;
    }

    public User queryById(Integer id) {
        User user = null;

        if (null != id && id >= 0) {
            sql.append("from sys_user where id = ?");
            user = User.dao.findFirst(sql.toString(),id);
        }
        return user;
    }
}
