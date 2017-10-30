package com.summer.controller.html;

import com.jfinal.core.Controller;
import com.summer.model.User;
import com.summer.service.ILoginService;
import com.summer.service.impl.LoginServiceImpl;


/**
 * Created by Intellij IDEA
 *
 * @Author summer
 * @Date 2017/10/29 下午4:09
 * @Description
 */
public class LoginController extends Controller {

    private static final String USER_NAME = "user";

    private ILoginService loginService = new LoginServiceImpl();

    public void index() {
        renderJsp("login.jsp");
    }

    public void validate() {
        String account = getPara("account");
        String password = getPara("password");
        System.out.println(account);
        try {
            User user = loginService.login(account,password);
            if (null != user) {
                this.setSessionAttr(USER_NAME,user);
//                getSession().setAttribute(USER_NAME,user);
                redirect("/index");
            } else {
//                renderJsp("login.jsp");
                redirect("/login");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void logout() {
        User user = this.getSessionAttr(USER_NAME);
        if (null != user) {
            this.removeSessionAttr(USER_NAME);
        }
        redirect("/login");
    }

}
