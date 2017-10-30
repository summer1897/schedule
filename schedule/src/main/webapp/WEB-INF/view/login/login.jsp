<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>后台登录</title>
    <meta name="author" content="summer"/>
    <jsp:include page="../common/common.jsp"/>
    <link rel="stylesheet" type="text/css" href="${basePath}/assets/login/css/login.css"/>
    <style>
        body {
            height: 100%;
            background: #438eb9;
            overflow: hidden;
        }

        canvas {
            z-index: -1;
            position: absolute;
        }
    </style>
    <script src="${basePath}/assets/login/js/verificationNumbers.js"></script>
    <script src="${basePath}/assets/login/js/Particleground.js"></script>
    <script>
        $(document).ready(function () {
            $("#login-panel").find('.item')
                .mouseover(function() {
                    $(this).addClass('item-text-highlight');
                }).mouseout(function() {
                $(this).removeClass('item-text-highlight');
            });
            //粒子背景特效
            $('body').particleground({
                dotColor: '#ffffff',
                lineColor: '#ffffff'
            });
            //验证码
            createCode();
        });
        window.checkForm=function(){
            var errorInfo=$("#errorInfo");
            var username=$("#username_").val();
            if(username==""){
                errorInfo.html("用户名不能为空！");
                $("#username_").focus();
                return false;
            }
            var password=$("#password_").val();
            if(password==""){
                errorInfo.html("密码不能为空！");
                $("#password_").focus();
                return false;
            }

        };
    </script>
</head>
<body>
<body class="Site">
<div class="container Site-content" style="margin-top:150px;">
    <div class="row">
        <div class="col-md-4 logo-panel">
            <!--<img src="./image/logo.png" width="400" height="100" class="img-responsive"/>-->
        </div>
        <div class="col-md-6">
            <div id="login-panel">
                <div class="title">
                    <strong>Boom后台管理系统</strong>
                    <em>Management System</em>
                </div>
                <form class="login-form" onsubmit="return checkForm()" action="${basePath}/login/validate" method="post">
                    <div class="item input-group">
                        <span class="glyphicon glyphicon-user input-group-addon"></span>
                        <input type="text" placeholder="账号" class="form-control" name="account" id="username_"/>
                    </div>
                    <div class="item input-group">
                        <span class="glyphicon glyphicon-lock input-group-addon"></span>
                        <input type="password" placeholder="密码" name="password" id="password_" class="form-control"/>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="checkbox">
                                <label id="error-tip" style="color:red;">

                                </label>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="checkbox text-right">
                                <label style="color:white;">
                                    <input type="checkbox" name="remember_me_" class="i-checks" /> 自动登录
                                </label>
                            </div>
                        </div>
                    </div>
                    <div>
                        <button type="submit" class="btn btn-info submit_btn">
                            <span class="glyphicon glyphicon-hand-right"></span>
                            登录
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<div class="Copyright">
    <p>© Copyright 2017贵州电力设计研究有限责任公司</p>
</div>
</body>
</html>