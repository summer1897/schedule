package com.summer.service;

import com.summer.model.Resource;

import java.util.List;
import java.util.Map;

/**
 * Created by yangyang on 2017/10/30.
 */
public interface IResourceService {

    /**
     * 查询所有资源菜单
     * @return
     */
    List<Resource> queryAll();

    /**
     * 获取树形资源菜单
     * @return
     */
    List<Resource> queryTreeResource();

    /**
     * 根据资源ID查询菜单
     * @param id
     * @return
     */
    Resource queryById(Integer id);

    /**
     * 更新单个字段值
     * @param id
     * @param field
     * @param value
     * @return 是否更新成功，false：更新失败，true：更新成功
     */
    boolean updateFieldById(Integer id,String field,Object value);

    /**
     * 将@{java.util.Map}中非空数据全部更新
     * @param id
     * @param datas
     * @return 是否更新成功，false：更新失败，true：更新成功
     */
    boolean updateFieldsById(Integer id,Map<String,Object> datas);
}
