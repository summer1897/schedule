package com.summer.controller.html;

import com.jfinal.core.Controller;
import com.summer.model.Resource;
import com.summer.service.IResourceService;
import com.summer.service.impl.ResourceServiceImpl;

import java.util.List;

/**
 * Created by yangyang on 2017/10/30.
 */
public class IndexController extends Controller {

    private IResourceService resourceService = new ResourceServiceImpl();

    public void index()  {
        List<Resource> resources = resourceService.queryAll();
        if (null != resources && !resources.isEmpty()) {
            setAttr("resources",resources);
        }
        renderJsp("index.jsp");
    }

}
