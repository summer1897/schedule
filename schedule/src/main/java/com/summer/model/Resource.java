package com.summer.model;

import com.jfinal.plugin.activerecord.Model;

import java.util.*;

/**
 * Created by yangyang on 2017/10/30.
 */
public class Resource extends Model<Resource> {
    public static final Resource dao = new Resource();
    public static final int ROOT_RESOURCE_ID = 0;

    private List<Resource> subResource = new ArrayList<Resource>();

    public void setSubResource(List<Resource> subResource) {
        this.subResource = subResource;
    }

    public List<Resource> getSubResource()  {
        return this.subResource;
    }

    public void sort(final int flag) {
        Collections.sort(subResource, new Comparator<Resource>() {
            public int compare(Resource resource1, Resource resource2) {
                int result = 0;
                Integer priority1 = resource1.getInt("priority");
                Integer priority2 = resource2.getInt("priority");
                Integer id1 = resource1.getInt("id");
                Integer id2 = resource2.getInt("id");
                //如果没有设置priority则根据id大小来排序
                if (null != priority1 && null != priority2) {
                    result = flag >= 0 ? (priority1 - priority2) : (priority2 - priority1);
                } else {
                    result = flag >= 0 ? (id1 - id2) : (id2 - id1);
                }
                return result;
            }
        });
        //对子菜单进行排序
        for (Iterator<Resource> it = subResource.iterator(); it.hasNext();) {
            it.next().sort(flag);
        }
    }
}
