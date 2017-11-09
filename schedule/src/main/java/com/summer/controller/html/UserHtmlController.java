package com.summer.controller.html;

import com.jfinal.core.Controller;

/**
 * Created by yangyang on 2017/11/8.
 */
public class UserHtmlController extends Controller {

    public void list() {
        renderJsp("authority/user_list.jsp");
    }

}
