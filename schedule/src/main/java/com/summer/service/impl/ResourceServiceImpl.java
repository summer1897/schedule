package com.summer.service.impl;

import com.summer.base.utils.StringUtils;
import com.summer.model.Resource;
import com.summer.service.IResourceService;

import java.util.*;

/**
 * Created by yangyang on 2017/10/30.
 */
public class ResourceServiceImpl implements IResourceService{

    public List<Resource> queryAll() {
        String sql = "select *from sys_resource";
        return Resource.dao.find(sql);
    }

    public List<Resource> queryTreeResource() {
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
        return treeResource;
    }

    public Resource queryById(Integer id) {
        if (null == id || id < 0)
            return null;
        String sql = "selcet *from sys_resource where id = ?";
        return Resource.dao.findFirst(sql,id);
    }

    public boolean updateFieldById(Integer id,String field, Object value) {
        boolean result = false;
        if (!StringUtils.isEmpty(field) && null != id && id.intValue() >= 0) {
            Resource resource = Resource.dao.findById(id);
            if (null != resource) {
                result = resource.set(field,value).update();
            }
        }
        return result;
    }

    public boolean updateFieldsById(Integer id,Map<String, Object> datas) {
        boolean result = false;
        if (null != id && id.intValue() >= 0 && null != datas && !datas.isEmpty()) {
            Resource resource = Resource.dao.findById(id);
            for (String field : datas.keySet()) {
                if (StringUtils.isNotEmpty(field)) {
                    resource.set(field,datas.get(field));
                }
            }
            result = resource.update();
        }
        return result;
    }
}
