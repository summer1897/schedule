package com.summer.util;

import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.summer.model.*;

/**
 * Created by yangyang on 2017/10/30.
 */
public class MappingKit {
    public static void mapping(ActiveRecordPlugin arp) {
        arp.addMapping("sys_user",User.class);
        arp.addMapping("sys_role",Role.class);
        arp.addMapping("sys_resource",Resource.class);
        arp.addMapping("sys_user_role",UserRole.class);
        arp.addMapping("sys_role_resource",RoleResource.class);
    }
}
