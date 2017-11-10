package com.summer.controller.json;

import com.jfinal.core.Controller;
import com.summer.controller.DataVo;
import com.summer.model.Resource;
import com.summer.service.IResourceService;
import com.summer.service.impl.ResourceServiceImpl;

import java.util.List;

/**
 * Created by yangyang on 2017/10/30.
 */
public class ResourceJsonController extends Controller {

    private IResourceService resourceService = new ResourceServiceImpl();

    public void list()  {
        List<Resource> resources = resourceService.queryAll();
        DataVo dataVo = new DataVo(0,"",100,resources);
        renderJson(dataVo);
    }

    public void update() {
        Integer id = getParaToInt("id");
        String field = getPara("field").trim();
        String value = getPara("value").trim();
        boolean result = resourceService.updateFieldById(id,field,value);
        int code = -1;
        String msg = "更新数据失败";
        if (result) {
            code = 1;
            msg = "";
        }
        DataVo dataVo = new DataVo(code,msg,0,null);
        renderJson(dataVo);
    }
}
