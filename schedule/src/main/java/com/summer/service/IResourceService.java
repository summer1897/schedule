package com.summer.service;

import com.summer.model.Resource;

import java.util.List;

/**
 * Created by yangyang on 2017/10/30.
 */
public interface IResourceService {
    List<Resource> queryAll();

    Resource queryById(Integer id);
}
