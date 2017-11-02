package com.summer.model;

import com.jfinal.plugin.activerecord.Model;

/**
 * Created by yangyang on 2017/10/30.
 */
public class User extends Model<User> {
    public static final String LOGIN_SESSION_NAME = "login_user";
    public static final User dao = new User();
}
