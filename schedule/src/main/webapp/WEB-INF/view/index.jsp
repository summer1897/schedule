<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">内容主体区域</div>
    </div>
</div>
<script>
    layui.use('element',function() {
        var element = layui.element;
    });
</script>
</body>
</html>
