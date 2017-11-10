<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Schedule System Home Page</title>
    <%@ include file="common/common.jsp"%>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <!--header-->
    <jsp:include page="common/header.jsp"/>
    <!--slide menu-->
    <jsp:include page="common/slider_menu.jsp"/>
    <!--content body-->
    <div class="layui-body margin-bottom-clear">
        <!-- 内容主体区域 -->
        <div id="main-content" style="padding:15px 15px 0px 15px;height:100%;">
            <iframe scrolling="no" style="margin:0px;padding:0px;width:100%;height:100%;" src="/schedule/user/html/list" frameborder="0"></iframe>
        </div>
       <%-- <div class="layui-tab layui-tab-brief margin-clear" lay-allowClose="true" lay-filter="lay-tab-container">
            <ul class="layui-tab-title">
                <li class="layui-this">基本内容</li>
            </ul>
            <div class="layui-tab-content">
                <div class="layui-tab-item layui-show">

                </div>
            </div>
        </div>--%>
    </div>
</div>
<script>
</script>
</body>
</html>
