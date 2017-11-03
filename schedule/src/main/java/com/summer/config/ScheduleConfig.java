package com.summer.config;

import com.jfinal.config.*;
import com.jfinal.ext.interceptor.SessionInViewInterceptor;
import com.jfinal.kit.PropKit;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.druid.DruidPlugin;
import com.jfinal.render.ViewType;
import com.jfinal.template.Engine;
import com.summer.controller.html.IndexController;
import com.summer.controller.html.LoginController;
import com.summer.controller.json.ResourceController;
import com.summer.interceptor.AuthInterceptor;
import com.summer.util.MappingKit;

/**
 * Created by yangyang on 2017/10/30.
 */
public class ScheduleConfig extends JFinalConfig {
    public void configConstant(Constants constants) {
        PropKit.use("db/db_config.txt");
        constants.setDevMode(PropKit.getBoolean("devMode",false));
        constants.setViewType(ViewType.JSP);
    }

    public void configRoute(Routes routes) {
        routes.setBaseViewPath("WEB-INF/view");

        //IndexController
        routes.add("/",IndexController.class);

        //LoginController
        routes.add("/login", LoginController.class);

        //ResourceController
        routes.add("/resource",ResourceController.class);
    }

    public void configEngine(Engine engine) {

    }

    public void configPlugin(Plugins plugins) {
        DruidPlugin dp = new DruidPlugin(PropKit.get("jdbcUrl"),PropKit.get("user"),PropKit.get("password").trim());
        plugins.add(dp);

        ActiveRecordPlugin arp = new ActiveRecordPlugin(dp);
        MappingKit.mapping(arp);
        plugins.add(arp);
    }

    public void configInterceptor(Interceptors interceptors) {
        //需添加SessionInViewInterceptor，这样经过其他Interceptor处理后,
        //Session中的全局变量才可以取出值
        interceptors.add(new SessionInViewInterceptor());
        interceptors.add(new AuthInterceptor());
    }

    public void configHandler(Handlers handlers) {

    }
}
