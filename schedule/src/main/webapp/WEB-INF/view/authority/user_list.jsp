<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <%@ include file="../common/common.jsp"%>
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
        <table class="layui-table" lay-data="{height:400,url:'/schedule/user/json/list',page:true,id:'user-list'}" lay-filter="user-list">
            <thead>
            <tr>
                <th lay-data="{checkbox: true, fixed: true,align: 'center'}"></th>
                <th lay-data="{field:'id',sort: true,width:60,align: 'center'}">Id</th>
                <th lay-data="{field:'username',width:100}">用户名</th>
                <th lay-data="{field:'email', sort: true,width:180}">用户邮箱</th>
                <th lay-data="{field:'phone', sort: true,width:130}">用户手机</th>
                <th lay-data="{field:'status',width:100}">状态</th>
                <th lay-data="{field:'create_time',sort: true,width:180}">创建时间</th>
                <th lay-data="{width:260,toolbar: '#operation-bar',align: 'center'}">操作</th>
            </tr>
            </thead>
            <script type="text/html" id="operation-bar">
                <%--<div class="layui-btn-group">--%>
                    <a class="layui-btn layui-btn-warm layui-btn-small">
                        <i class="layui-icon">&#xe615;</i>查看
                    </a>
                    <a class="layui-btn layui-btn-normal layui-btn-small">
                        <i class="layui-icon">&#xe642;</i>编辑
                    </a>
                    <a class="layui-btn layui-btn-danger layui-btn-small">
                        <i class="layui-icon">&#xe640;</i>删除
                    </a>
                <%--</div>--%>
                <%--<a class="layui-btn layui-btn-primary layui-btn-mini" lay-event="detail">查看</a>
                <a class="layui-btn layui-btn-mini" lay-event="edit">编辑</a>
                <a class="layui-btn layui-btn-danger layui-btn-mini" lay-event="del">删除</a>--%>
            </script>
        </table>
    </div>
</body>
</html>
