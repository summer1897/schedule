<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String basePath = request.getScheme() + "://" +
            request.getServerName() + ":" +
            request.getServerPort() +
            request.getContextPath();
    request.setAttribute("basePath", basePath);
%>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1">
<link rel="stylesheet" type="text/css" href="<%=basePath%>/assets/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>/plugins/layui/css/layui.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>/assets/css/base.css" />
<script type="text/javascript" src="<%=basePath%>/assets/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/plugins/layui/layui.js"></script>
