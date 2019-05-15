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
                        <li class="header">申请状态:</li>
                        <li>
                            <!-- inner menu: contains the actual data -->
                            <ul class="menu">
                                <li><!-- Task item -->
                                    <a href="#">

                                        <div class="progress xs">
                                            <div class="progress-bar progress-bar-aqua" style="width:<c:choose><c:when test="${checkStatus == 1}">25</c:when><c:when test="${checkStatus == 2}">50</c:when><c:when test="${checkStatus == 3}">75</c:when><c:when test="${checkStatus >= 4}">100</c:when></c:choose>%" role="progressbar"
                                                 aria-valuenow="
                                                <c:choose>
                                                    <c:when test="${checkStatus <= 4}"> ${checkStatus} </c:when>
                                                    <c:when test="${checkStatus > 4}"> 4 </c:when>
                                                </c:choose>
                                                " aria-valuemin="0" aria-valuemax="4">
                                                <span class="sr-only"><c:choose><c:when test="${checkStatus == 1}">25</c:when><c:when test="${checkStatus == 2}">50</c:when><c:when test="${checkStatus == 3}">75</c:when><c:when test="${checkStatus >= 4}">100</c:when></c:choose>% Complete</span>
                                            </div>
                                        </div>
                                        &nbsp;
                                        <h3>
                                            <c:choose>
                                                <c:when test="${checkStatus == 1}">班主任审核中</c:when>
                                                <c:when test="${checkStatus == 2}">辅导员审核中</c:when>
                                                <c:when test="${checkStatus == 3}">学院书记审核中</c:when>
                                                <c:when test="${checkStatus == 4}">学校审核中</c:when>
                                                <c:when test="${checkStatus == 5}">审核不通过</c:when>
                                                <c:when test="${checkStatus == 6}">不困难</c:when>
                                                <c:when test="${checkStatus == 7}">一般困难</c:when>
                                                <c:when test="${checkStatus == 8}">困难</c:when>
                                                <c:when test="${checkStatus == 9}">特殊困难</c:when>
                                            </c:choose>
                                        </h3>
                                    </a>
                                </li>
                                <!-- end task item -->
                            </ul>
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