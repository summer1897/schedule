package com.summer.service;

import com.summer.model.User;

/**
 * Created by Intellij IDEA
 *
 * @Author summer
 * @Date 2017/10/29 下午4:45
 * @Description
 */
public interface ILoginService {

    User login(String account, String password);
}
