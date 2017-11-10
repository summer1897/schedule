package com.summer.controller.html;

import com.jfinal.core.Controller;

/**
 * Created by yangyang on 2017/11/10.
 */
public class ResourceHtmlController extends Controller{
    public void list() {
        renderJsp("authority/resource_list.jsp");
    }
}
