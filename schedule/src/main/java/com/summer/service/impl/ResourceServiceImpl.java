package com.summer.service.impl;

import com.alibaba.fastjson.JSON;
import com.summer.model.Resource;
import com.summer.service.IResourceService;

import java.util.*;

/**
 * Created by yangyang on 2017/10/30.
 */
public class ResourceServiceImpl implements IResourceService{

    public List<Resource> queryAll() {
        String sql = "select *from sys_resource";
        List<Resource> resources = Resource.dao.find(sql);

        return createTreeResource(resources);
    }

    private List<Resource> createTreeResource(List<Resource> resources) {
        List<Resource> treeResource = null;
        if (null != resources && !resources.isEmpty()) {
            //创建根目录
            Resource root = new Resource();

            Map<Integer,Resource> maps = new HashMap<Integer, Resource>();
            for (Resource r : resources) {
                maps.put(r.getInt("id"),r);
            }
//            System.out.println(JSON.toJSONString(maps,true));

            for (Integer id : maps.keySet()) {
                Resource resource = maps.get(id);
                Integer parentId = resource.getInt("parent_id");
                if (null == parentId || Resource.ROOT_RESOURCE_ID == parentId) {
                    root.getSubResource().add(resource);
                } else {
                    maps.get(resource.getInt("parent_id")).getSubResource().add(resource);
                }
            }
            root.sort(1);
            treeResource = root.getSubResource();
        }
//        System.out.println(JSON.toJSONString(treeResource,true));
        for (Resource rt : treeResource) {
            List<Resource> subResource = rt.getSubResource();
            if (null != subResource && !subResource.isEmpty()) {
                for (Resource r: subResource) {
                    System.out.println(r.get("name") + "--" + r.get("url"));
                }
            }
        }
        return treeResource;
    }

    public Resource queryById(Integer id) {
        if (null == id || id < 0)
            return null;
        String sql = "selcet *from sys_resource where id = ?";
        return Resource.dao.findFirst(sql,id);
    }
}
