package com.summer.tags;

import com.summer.model.Resource;

import java.util.List;

/**
 * Created by Intellij IDEA
 *
 * @Author summer
 * @Date 2017/11/1 下午11:01
 * @Description 迭代输入资源列表
 */
public class ResourceTag {

    public static String showResource(List<Resource> resources) {
        StringBuilder sb = new StringBuilder();
        sb.append("<ul class='layui-nav layui-nav-tree' id='left-menu'>\n");
        if (null != resources && !resources.isEmpty()) {
            for (int i = 0; i <resources.size(); ++i) {
                Resource resource = resources.get(i);
                //拼接根资源
                String url = resource.get("url");
                String name = resource.get("name");
                List<Resource> subResource = resource.getSubResource();

                //第一个菜单栏展开
                if (0 == i) {
                    sb.append("<li class='layui-nav-item layui-nav-itemed'>\n");
                } else {
                    sb.append("<li class='layui-nav-item'>\n");
                }
                if (null == url || "".equals(url.trim())) {
                    sb.append("<a href='javascript:;'>\n")
                        .append(name)
                        .append("</a>\n");
                } else {
                    sb.append("<a href='javascript:;' data-type='tabAdd' data-url='{url:")
                        .append(url)
                        .append(",title:").append(name)
                        .append("}'>\n").append(name)
                        .append("</a>\n");

                }
                if (null != subResource && !subResource.isEmpty()) {
                    sb.append(iterate(subResource));
                }
                //子资源构建完，添加</li>
                sb.append("</li>\n");

            }
        }
        sb.append("<ul>\n");
        return sb.toString();
    }

    /**
     * 迭代子资源
     * @param resources
     * @return
     */
    private static String iterate(List<Resource> resources) {
        StringBuilder sb = new StringBuilder("");

        if (null != resources && !resources.isEmpty()) {
            sb.append("<dl class='layui-nav-child'>\n");
            for (Resource resource : resources) {
                String url = resource.get("url");
                String name = resource.get("name");
                List<Resource> subResource = resource.getSubResource();
                if (null == url || "".equals(url.trim())) {
                    sb.append("<dd>\n<a href='javascript:;'>\n")
                        .append(name)
                        .append("</a>\n</dd>\n");
                } else {
                    sb.append("<dd>\n<a href='javascript:;' data-type='tabAdd' data-url='{\"url\":\"")
                        .append(url)
                        .append("\",\"title\":\"").append(name)
                        .append("\"}'>\n").append(name)
                        .append("</a>\n</dd>\n");
                }

                if (null != subResource && !subResource.isEmpty()) {
                    sb.append(iterate(subResource));
                }
            }
            sb.append("</dl>\n");
        }

        return sb.toString();
    }
 }
