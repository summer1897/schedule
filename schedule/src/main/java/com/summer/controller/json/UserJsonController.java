package com.summer.controller.json;

import com.jfinal.core.Controller;
import com.summer.controller.DataVo;
import com.summer.model.User;
import com.summer.service.IUserService;
import com.summer.service.impl.UserServiceImpl;

import java.util.List;

/**
 * Created by yangyang on 2017/11/8.
 */
public class UserJsonController extends Controller {

    private IUserService userService = new UserServiceImpl();

    public void list() {
        List<User> users = userService.queryAll();
        DataVo dataVo = new DataVo(0,"",1000,users);
        renderJson(dataVo);
    }
}
