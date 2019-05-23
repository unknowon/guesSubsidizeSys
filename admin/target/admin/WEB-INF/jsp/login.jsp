<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: lulu
  Date: 2019-05-06
  Time: 11:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>资助管理系统 | 登录</title>
    <%@include file="header.jsp"%>
</head>
<body class="hold-transition login-page">
<div class="login-box">
    <div class="login-logo">
        <a href="<%=ctxPath%>/"><b>资助</b>管理</a>
    </div>
    <!-- /.login-logo -->
    <div class="login-box-body">
        <p class="login-box-msg">登录你的账号</p>

        <form action="<%=ctxPath%>/login.do" method="post">
            <div class="form-group has-feedback">
                <input type="text" class="form-control" placeholder="账号" name="account">
                <span class="glyphicon glyphicon-user form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="password" class="form-control" placeholder="密码" name="password">
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>
            <div class="row form-group has-feedback">
                <div class="col-xs-7">
                    <input name="imageCode" class="form-control" type="text" placeholder="验证码"/>
                </div>
                <div class="col-xs-2">
                    <img src="<%=ctxPath %>/imageCode.do?t=<%=new Date().getTime() %>" onclick="this.src='<%=ctxPath %>/imageCode.do?t='+new Date().getTime()" />
                </div>
            </div>
            <div class="row form-group has-feedback">
                <div class="col-xs-12">
                    <span style="color: red;">${message }</span>
                </div>
            </div>
            <div class="row">
                <%--<div class="col-xs-8">
                    <div class="checkbox icheck">
                        <label>
                            <input type="checkbox"> Remember Me
                        </label>
                    </div>
                </div>--%>
                <!-- /.col -->
                <div class="col-xs-12">
                    <button type="submit" class="btn btn-primary btn-block btn-flat">登&nbsp;&nbsp;录</button>
                </div>
                <!-- /.col -->
            </div>
        </form>

        <%--<div class="social-auth-links text-center">
            <p>- OR -</p>
            <a href="#" class="btn btn-block btn-social btn-facebook btn-flat"><i class="fa fa-facebook"></i> Sign in using
                Facebook</a>
            <a href="#" class="btn btn-block btn-social btn-google btn-flat"><i class="fa fa-google-plus"></i> Sign in using
                Google+</a>
        </div>--%>
        <!-- /.social-auth-links -->

        <a href="#">忘记密码?</a><br>
        <%--<a href="register.html" class="text-center">Register a new membership</a>--%>

    </div>
    <!-- /.login-box-body -->
</div>
<!-- /.login-box -->

<!-- iCheck -->
<script src="<%=ctxPath%>/plugins/iCheck/icheck.min.js"></script>
<script>
    $(function () {
        $('input').iCheck({
            checkboxClass: 'icheckbox_square-blue',
            radioClass: 'iradio_square-blue',
            increaseArea: '20%' /* optional */
        });
    });
</script>
</body>
</html>
