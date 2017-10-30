package com.summer.controller.html;

import com.jfinal.core.Controller;

/**
 * Created by yangyang on 2017/10/30.
 */
public class IndexController extends Controller {

    public void index()  {
        renderJsp("index.jsp");
    }

}
