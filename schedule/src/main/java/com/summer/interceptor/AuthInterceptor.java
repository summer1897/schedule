package com.summer.interceptor;

import com.alibaba.fastjson.JSON;
import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;
import com.jfinal.core.Controller;
import com.summer.model.User;

/**
 * Created by Intellij IDEA
 *
 * @Author summer
 * @Date 2017/10/26 下午11:10
 * @Description
 */
public class AuthInterceptor implements Interceptor {

    public void intercept(Invocation invocation) {

        Controller controller = invocation.getController();
        User user = controller.getSessionAttr(User.LOGIN_SESSION_NAME);
        if (null == user) {
            controller.redirect("/login");
        } else {
            System.out.println("user:" + user.get("username"));
            invocation.invoke();
        }
    }
}
