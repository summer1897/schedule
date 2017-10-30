package com.summer.controller.json;

import com.jfinal.core.Controller;
import com.summer.service.IResourceService;
import com.summer.service.impl.ResourceServiceImpl;

/**
 * Created by yangyang on 2017/10/30.
 */
public class ResourceController extends Controller {

    private IResourceService resourceService = new ResourceServiceImpl();

    public void list()  {
        renderJson(resourceService.queryAll());
    }
}
