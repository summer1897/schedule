<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <%@ include file="../common/common.jsp"%>
    <script src="/assets/authority/js/app.js"></script>
</head>
<body>
<blockquote class="layui-elem-quote news_search">
    <div class="layui-inline">
        <div class="layui-input-inline">
            <input type="text" value="" placeholder="请输入关键字" class="layui-input search_input">
        </div>
        <a class="layui-btn search_btn">查询</a>
    </div>
    <div class="layui-inline">
        <a class="layui-btn linksAdd_btn" style="background-color:#5FB878">添加用户</a>
    </div>
    <div class="layui-inline">
        <a class="layui-btn layui-btn-danger batchDel">批量删除</a>
    </div>
    <div class="layui-inline">
        <div class="layui-form-mid layui-word-aux">本页面刷新后除新添加的链接外所有操作无效，关闭页面所有数据重置</div>
    </div>
</blockquote>
<div class="layui-form" >
    <table class="layui-table" lay-data="{height:450,url:'/schedule/resource/json/list',page:true,id:'resource-list'}" lay-filter="resource-list">
        <thead>
            <tr>
                <th lay-data="{checkbox: true, fixed: true,align: 'center'}"></th>
                <th lay-data="{field:'id',sort: true,width:60,align: 'center'}">Id</th>
                <th lay-data="{field:'parent_id',width:80}">父级Id</th>
                <th lay-data="{field:'name', sort: true,width:100}">资源名称</th>
                <th lay-data="{field:'description', sort: true,width:100}">资源描述</th>
                <th lay-data="{field:'url',width:80,align:'center',edit:true}">URL</th>
                <th lay-data="{field:'permission',sort: true,width:100}">资源权限</th>
                <th lay-data="{field:'type',sort: true,width:130}">资源类型</th>
                <th lay-data="{field:'priority',sort: true,width:130}">资源优先级</th>
                <th lay-data="{field:'available',sort: true,width:130}">资源可用性</th>
                <th lay-data="{width:180,toolbar: '#operation-bar',align: 'center'}">操作</th>
            </tr>
        </thead>
        <script type="text/html" id="operation-bar">
            <%--<div class="layui-btn-group">--%>
            <a class="layui-btn layui-btn-warm layui-btn-small">
                <i class="layui-icon">&#xe615;</i>
            </a>
            <a class="layui-btn layui-btn-normal layui-btn-small">
                <i class="layui-icon">&#xe642;</i>
            </a>
            <a class="layui-btn layui-btn-danger layui-btn-small">
                <i class="layui-icon">&#xe640;</i>
            </a>
        </script>
    </table>
</div>
</body>
</html>
