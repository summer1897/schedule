package com.summer.service;

import com.summer.model.User;

import java.util.List;

/**
 * Created by yangyang on 2017/11/8.
 */
public interface IUserService {

    List<User> queryAll();

    User queryByName(String username);

    User queryById(Integer id);
}
