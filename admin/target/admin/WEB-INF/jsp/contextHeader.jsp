<%--fuck Encoding--%>
<%--有中文记得加上--%>
<%@page pageEncoding="UTF-8"%>

<header class="main-header">
    <!-- Logo -->
    <a href="<%=ctxPath%>/" class="logo">
        <!-- mini logo for sidebar mini 50x50 pixels -->
        <span class="logo-mini"><b></b>资助</span>
        <!-- logo for regular state and mobile devices -->
        <span class="logo-lg"><b>资&nbsp;助&nbsp;</b>系&nbsp;统</span>
    </a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
        <!-- Sidebar toggle button-->
        <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
            <span class="sr-only">Toggle navigation</span>
        </a>

        <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
                <!-- 生成调查表-->
                <li class="dropdown messages-menu">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <i class="fa fa-envelope-o">生成调查表</i>
                    </a>
                </li>


                <!-- 生成认定表 -->
                <li class="dropdown notifications-menu">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <i class="fa fa-bell-o">生成认定表</i>
                    </a>
                </li>


                <!--
                 申请状态查询
                 TODO：进度条 结果
                 -->
                <li class="dropdown tasks-menu">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <i class="fa fa-flag-o">申请状态查询</i>
                    </a>
                    <ul class="dropdown-menu">
                        <li class="header">You have 9 tasks</li>
                        <li>
                            <!-- inner menu: contains the actual data -->
                            <ul class="menu">
                                <li><!-- Task item -->
                                    <a href="#">
                                        <h3>
                                            Design some buttons
                                            <small class="pull-right">20%</small>
                                        </h3>
                                        <div class="progress xs">
                                            <div class="progress-bar progress-bar-aqua" style="width: 20%" role="progressbar"
                                                 aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                                                <span class="sr-only">20% Complete</span>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <!-- end task item -->
                            </ul>
                        </li>
                        <li class="footer">
                            <a href="#">View all tasks</a>
                        </li>
                    </ul>
                </li>


                <!-- 个人信息 -->
                <li class="dropdown user user-menu">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <span class="hidden-xs">${requestScope.get("user").name}</span>
                    </a>
                    <ul class="dropdown-menu">
                        <!-- User image -->
                        <li class="user-header" style="height: 75px;">
                            <p>
                                ${requestScope.get("user").name}
                            </p>
                        </li>
                        <!-- Menu Footer-->
                        <li class="user-footer">
                            <%--<div class="pull-left">
                                <a href="#" class="btn btn-default btn-flat">个人信息</a>
                            </div>--%>
                            <div class="pull-left">
                                <a href="javascript:;" onclick="updatePassword('修改密码','<%=ctxPath%>/updatePassword.do')" class="btn btn-default btn-flat">修改密码</a>
                            </div>
                            <div class="pull-right">
                                <a href="<%=ctxPath%>/logout.do" class="btn btn-default btn-flat">退出登录</a>
                            </div>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>
</header>
<script>
    function updatePassword(title,url,w,h){
        layer_show(title,url,w,h);
    }
</script>