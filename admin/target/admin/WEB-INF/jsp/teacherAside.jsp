<%--
  Created by IntelliJ IDEA.
  User: lulu
  Date: 2019-05-28
  Time: 16:35
  To change this template use File | Settings | File Templates.
--%>
<%@page pageEncoding="UTF-8"%>
<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
        <!-- Sidebar user panel -->

        <!-- search form -->
        <!-- /.search form -->
        <!-- sidebar menu: : style can be found in sidebar.less -->

        <%
            String path = request.getServletPath();
            request.getSession().setAttribute("path", path);
            /*System.out.println(path);*/
        %>
        <c:choose>
            <c:when test="${sessionScope.role.name == '超级管理员'}">
                <ul class="sidebar-menu" data-widget="tree">
                    <li class="header">贵州工程技术学院资助管理系统</li>

                    <li class="<c:if test="${sessionScope.path eq '/WEB-INF/jsp/indexTeacher.jsp'}">active</c:if>">
                        <a href="<%=ctxPath%>/Admin/indexTeacher.do">
                            <i class="fa fa-dashboard"></i> <span>数据统计</span>
                        </a>
                    </li>

                    <li class="<c:if test="${sessionScope.path eq '/WEB-INF/jsp/teacher/teaCheck.jsp'}">active</c:if>">
                        <a href="<%=ctxPath%>/Admin/teaCheck.do">
                            <i class="fa fa-dashboard"></i> <span>资格审核</span>
                        </a>
                    </li>

                    <li class="<c:if test="${sessionScope.path eq '/WEB-INF/jsp/nextLevel/list.jsp'}">active</c:if>
                        <c:if test="${sessionScope.path eq '/WEB-INF/jsp/superNextLevel/list.jsp'}">active</c:if>
                        <c:if test="${sessionScope.path eq '/WEB-INF/jsp/schoolNextLevel/list.jsp'}">active</c:if>
                        <c:if test="${sessionScope.path eq '/WEB-INF/jsp/shuJiNextLevel/list.jsp'}">active</c:if>
                        <c:if test="${sessionScope.path eq '/WEB-INF/jsp/fuDaoYuanNextLevel/list.jsp'}">active</c:if>
                        <c:if test="${sessionScope.path eq '/WEB-INF/jsp/banZhuRenNextLevel/list.jsp'}">active</c:if>">
                        <a href="<%=ctxPath%>/NextLevel/nextLevelList.do">
                            <i class="fa fa-dashboard"></i> <span>下级账号管理</span>
                        </a>
                    </li>


                    <li class="treeview <c:if test="${sessionScope.path eq '/WEB-INF/jsp/college/list.jsp'}">active</c:if> <c:if test="${sessionScope.path eq '/WEB-INF/jsp/class/list.jsp'}">active</c:if>">
                        <a href="#">
                            <i class="fa fa-dashboard"></i> <span>学院班级管理</span>
                            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
                        </a>
                        <ul class="treeview-menu">
                            <li class="<c:if test="${sessionScope.path eq '/WEB-INF/jsp/college/list.jsp'}">active</c:if>"><a href="<%=ctxPath%>/College/collegeList.do"><i class="fa fa-circle-o"></i> 学院管理</a></li>
                            <li class="<c:if test="${sessionScope.path eq '/WEB-INF/jsp/class/list.jsp'}">active</c:if>"><a href="<%=ctxPath%>/Class/classList.do"><i class="fa fa-circle-o"></i> 班级管理</a></li>
                        </ul>
                    </li>


                    <li class="treeview <c:if test="${sessionScope.path eq '/WEB-INF/jsp/adminUserRole/list.jsp'}">active</c:if> <c:if test="${sessionScope.path eq '/WEB-INF/jsp/role/list.jsp'}">active</c:if>">
                        <a href="#">
                            <i class="fa fa-dashboard"></i> <span>权限管理</span>
                            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
                        </a>
                        <ul class="treeview-menu">
                            <li class="<c:if test="${sessionScope.path eq '/WEB-INF/jsp/adminUserRole/list.jsp'}">active</c:if>"><a href="<%=ctxPath%>/AdminUserRole/adminUserRoleList.do"><i class="fa fa-circle-o"></i> 用户权限管理</a></li>
                            <li class="<c:if test="${sessionScope.path eq '/WEB-INF/jsp/role/list.jsp'}">active</c:if>"><a href="<%=ctxPath%>/Role/roleList.do"><i class="fa fa-circle-o"></i> 角色管理</a></li>
                        </ul>
                    </li>

                    <li class="<c:if test="${sessionScope.path eq '/WEB-INF/jsp/teacher/studentInformation.jsp'}">active</c:if>">
                        <a href="<%=ctxPath%>/Admin/studentInformation.do">
                            <i class="fa fa-dashboard"></i> <span>学生信息</span>
                        </a>
                    </li>



                </ul>
            </c:when>
            <c:when test="${sessionScope.role.name == '学校管理员'}">
                <ul class="sidebar-menu" data-widget="tree">
                    <li class="header">贵州工程技术学院资助管理系统</li>

                    <li class="<c:if test="${sessionScope.path eq '/WEB-INF/jsp/indexTeacher.jsp'}">active</c:if>">
                        <a href="<%=ctxPath%>/Admin/indexTeacher.do">
                            <i class="fa fa-dashboard"></i> <span>数据统计</span>
                        </a>
                    </li>

                    <li class="<c:if test="${sessionScope.path eq '/WEB-INF/jsp/teacher/teaCheck.jsp'}">active</c:if>">
                        <a href="<%=ctxPath%>/Admin/teaCheck.do">
                            <i class="fa fa-dashboard"></i> <span>资格审核</span>
                        </a>
                    </li>

                    <li class="
                        <c:if test="${sessionScope.path eq '/WEB-INF/jsp/nextLevel/list.jsp'}">active</c:if>
                        <c:if test="${sessionScope.path eq '/WEB-INF/jsp/superNextLevel/list.jsp'}">active</c:if>
                        <c:if test="${sessionScope.path eq '/WEB-INF/jsp/schoolNextLevel/list.jsp'}">active</c:if>
                        <c:if test="${sessionScope.path eq '/WEB-INF/jsp/shuJiNextLevel/list.jsp'}">active</c:if>
                        <c:if test="${sessionScope.path eq '/WEB-INF/jsp/fuDaoYuanNextLevel/list.jsp'}">active</c:if>
                        <c:if test="${sessionScope.path eq '/WEB-INF/jsp/banZhuRenNextLevel/list.jsp'}">active</c:if>
                        ">
                        <a href="<%=ctxPath%>/SchoolNextLevel/schoolNextLevelList.do">
                            <i class="fa fa-dashboard"></i> <span>学院书记账号管理</span>
                        </a>
                    </li>


                    <%--<li class="treeview <c:if test="${sessionScope.path eq '/WEB-INF/jsp/college/list.jsp'}">active</c:if> <c:if test="${sessionScope.path eq '/WEB-INF/jsp/class/list.jsp'}">active</c:if>">
                        <a href="#">
                            <i class="fa fa-dashboard"></i> <span>学院班级管理</span>
                            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
                        </a>
                        <ul class="treeview-menu">
                            <li class="<c:if test="${sessionScope.path eq '/WEB-INF/jsp/college/list.jsp'}">active</c:if>"><a href="<%=ctxPath%>/College/collegeList.do"><i class="fa fa-circle-o"></i> 学院管理</a></li>
                            <li class="<c:if test="${sessionScope.path eq '/WEB-INF/jsp/class/list.jsp'}">active</c:if>"><a href="<%=ctxPath%>/Class/classList.do"><i class="fa fa-circle-o"></i> 班级管理</a></li>
                        </ul>
                    </li>


                    <li class="treeview <c:if test="${sessionScope.path eq '/WEB-INF/jsp/adminUserRole/list.jsp'}">active</c:if> <c:if test="${sessionScope.path eq '/WEB-INF/jsp/role/list.jsp'}">active</c:if>">
                        <a href="#">
                            <i class="fa fa-dashboard"></i> <span>权限管理</span>
                            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
                        </a>
                        <ul class="treeview-menu">
                            <li class="<c:if test="${sessionScope.path eq '/WEB-INF/jsp/adminUserRole/list.jsp'}">active</c:if>"><a href="<%=ctxPath%>/AdminUserRole/adminUserRoleList.do"><i class="fa fa-circle-o"></i> 用户权限管理</a></li>
                            <li class="<c:if test="${sessionScope.path eq '/WEB-INF/jsp/role/list.jsp'}">active</c:if>"><a href="<%=ctxPath%>/Role/roleList.do"><i class="fa fa-circle-o"></i> 角色管理</a></li>
                        </ul>
                    </li>--%>

                    <li class="<c:if test="${sessionScope.path eq '/WEB-INF/jsp/teacher/studentInformation.jsp'}">active</c:if>">
                        <a href="<%=ctxPath%>/Admin/studentInformation.do">
                            <i class="fa fa-dashboard"></i> <span>学生信息</span>
                        </a>
                    </li>



                </ul>
            </c:when>
            <c:when test="${sessionScope.role.name == '学院书记'}">
                <ul class="sidebar-menu" data-widget="tree">
                    <li class="header">贵州工程技术学院资助管理系统</li>

                    <li class="<c:if test="${sessionScope.path eq '/WEB-INF/jsp/indexTeacher.jsp'}">active</c:if>">
                        <a href="<%=ctxPath%>/Admin/indexTeacher.do">
                            <i class="fa fa-dashboard"></i> <span>数据统计</span>
                        </a>
                    </li>

                    <li class="<c:if test="${sessionScope.path eq '/WEB-INF/jsp/teacher/teaCheck.jsp'}">active</c:if>">
                        <a href="<%=ctxPath%>/Admin/teaCheck.do">
                            <i class="fa fa-dashboard"></i> <span>资格审核</span>
                        </a>
                    </li>

                    <li class="<c:if test="${sessionScope.path eq '/WEB-INF/jsp/nextLevel/list.jsp'}">active</c:if>
                        <c:if test="${sessionScope.path eq '/WEB-INF/jsp/superNextLevel/list.jsp'}">active</c:if>
                        <c:if test="${sessionScope.path eq '/WEB-INF/jsp/schoolNextLevel/list.jsp'}">active</c:if>
                        <c:if test="${sessionScope.path eq '/WEB-INF/jsp/shuJiNextLevel/list.jsp'}">active</c:if>
                        <c:if test="${sessionScope.path eq '/WEB-INF/jsp/fuDaoYuanNextLevel/list.jsp'}">active</c:if>
                        <c:if test="${sessionScope.path eq '/WEB-INF/jsp/banZhuRenNextLevel/list.jsp'}">active</c:if>">
                        <a href="<%=ctxPath%>/ShuJiNextLevel/shuJiNextLevelList.do">
                            <i class="fa fa-dashboard"></i> <span>辅导员账号管理</span>
                        </a>
                    </li>


                    <%--<li class="treeview <c:if test="${sessionScope.path eq '/WEB-INF/jsp/college/list.jsp'}">active</c:if> <c:if test="${sessionScope.path eq '/WEB-INF/jsp/class/list.jsp'}">active</c:if>">
                        <a href="#">
                            <i class="fa fa-dashboard"></i> <span>学院班级管理</span>
                            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
                        </a>
                        <ul class="treeview-menu">
                            <li class="<c:if test="${sessionScope.path eq '/WEB-INF/jsp/college/list.jsp'}">active</c:if>"><a href="<%=ctxPath%>/College/collegeList.do"><i class="fa fa-circle-o"></i> 学院管理</a></li>
                            <li class="<c:if test="${sessionScope.path eq '/WEB-INF/jsp/class/list.jsp'}">active</c:if>"><a href="<%=ctxPath%>/Class/classList.do"><i class="fa fa-circle-o"></i> 班级管理</a></li>
                        </ul>
                    </li>


                    <li class="treeview <c:if test="${sessionScope.path eq '/WEB-INF/jsp/adminUserRole/list.jsp'}">active</c:if> <c:if test="${sessionScope.path eq '/WEB-INF/jsp/role/list.jsp'}">active</c:if>">
                        <a href="#">
                            <i class="fa fa-dashboard"></i> <span>权限管理</span>
                            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
                        </a>
                        <ul class="treeview-menu">
                            <li class="<c:if test="${sessionScope.path eq '/WEB-INF/jsp/adminUserRole/list.jsp'}">active</c:if>"><a href="<%=ctxPath%>/AdminUserRole/adminUserRoleList.do"><i class="fa fa-circle-o"></i> 用户权限管理</a></li>
                            <li class="<c:if test="${sessionScope.path eq '/WEB-INF/jsp/role/list.jsp'}">active</c:if>"><a href="<%=ctxPath%>/Role/roleList.do"><i class="fa fa-circle-o"></i> 角色管理</a></li>
                        </ul>
                    </li>

                    <li class="<c:if test="${sessionScope.path eq '/WEB-INF/jsp/teacher/studentInformation.jsp'}">active</c:if>">
                        <a href="<%=ctxPath%>/Admin/studentInformation.do">
                            <i class="fa fa-dashboard"></i> <span>学生信息</span>
                        </a>
                    </li>--%>



                </ul>
            </c:when>
            <c:when test="${sessionScope.role.name == '辅导员'}">
                <ul class="sidebar-menu" data-widget="tree">
                    <li class="header">贵州工程技术学院资助管理系统</li>

                    <li class="<c:if test="${sessionScope.path eq '/WEB-INF/jsp/indexTeacher.jsp'}">active</c:if>">
                        <a href="<%=ctxPath%>/Admin/indexTeacher.do">
                            <i class="fa fa-dashboard"></i> <span>数据统计</span>
                        </a>
                    </li>

                    <li class="<c:if test="${sessionScope.path eq '/WEB-INF/jsp/teacher/teaCheck.jsp'}">active</c:if>">
                        <a href="<%=ctxPath%>/Admin/teaCheck.do">
                            <i class="fa fa-dashboard"></i> <span>资格审核</span>
                        </a>
                    </li>

                    <li class="<c:if test="${sessionScope.path eq '/WEB-INF/jsp/nextLevel/list.jsp'}">active</c:if>
                        <c:if test="${sessionScope.path eq '/WEB-INF/jsp/superNextLevel/list.jsp'}">active</c:if>
                        <c:if test="${sessionScope.path eq '/WEB-INF/jsp/schoolNextLevel/list.jsp'}">active</c:if>
                        <c:if test="${sessionScope.path eq '/WEB-INF/jsp/shuJiNextLevel/list.jsp'}">active</c:if>
                        <c:if test="${sessionScope.path eq '/WEB-INF/jsp/fuDaoYuanNextLevel/list.jsp'}">active</c:if>
                        <c:if test="${sessionScope.path eq '/WEB-INF/jsp/banZhuRenNextLevel/list.jsp'}">active</c:if>">
                        <a href="<%=ctxPath%>/FuDaoYuanNextLevel/fuDaoYuanNextLevelList.do">
                            <i class="fa fa-dashboard"></i> <span>班主任账号管理</span>
                        </a>
                    </li>


                    <%--<li class="treeview <c:if test="${sessionScope.path eq '/WEB-INF/jsp/college/list.jsp'}">active</c:if> <c:if test="${sessionScope.path eq '/WEB-INF/jsp/class/list.jsp'}">active</c:if>">
                        <a href="#">
                            <i class="fa fa-dashboard"></i> <span>学院班级管理</span>
                            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
                        </a>
                        <ul class="treeview-menu">
                            <li class="<c:if test="${sessionScope.path eq '/WEB-INF/jsp/college/list.jsp'}">active</c:if>"><a href="<%=ctxPath%>/College/collegeList.do"><i class="fa fa-circle-o"></i> 学院管理</a></li>
                            <li class="<c:if test="${sessionScope.path eq '/WEB-INF/jsp/class/list.jsp'}">active</c:if>"><a href="<%=ctxPath%>/Class/classList.do"><i class="fa fa-circle-o"></i> 班级管理</a></li>
                        </ul>
                    </li>


                    <li class="treeview <c:if test="${sessionScope.path eq '/WEB-INF/jsp/adminUserRole/list.jsp'}">active</c:if> <c:if test="${sessionScope.path eq '/WEB-INF/jsp/role/list.jsp'}">active</c:if>">
                        <a href="#">
                            <i class="fa fa-dashboard"></i> <span>权限管理</span>
                            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
                        </a>
                        <ul class="treeview-menu">
                            <li class="<c:if test="${sessionScope.path eq '/WEB-INF/jsp/adminUserRole/list.jsp'}">active</c:if>"><a href="<%=ctxPath%>/AdminUserRole/adminUserRoleList.do"><i class="fa fa-circle-o"></i> 用户权限管理</a></li>
                            <li class="<c:if test="${sessionScope.path eq '/WEB-INF/jsp/role/list.jsp'}">active</c:if>"><a href="<%=ctxPath%>/Role/roleList.do"><i class="fa fa-circle-o"></i> 角色管理</a></li>
                        </ul>
                    </li>

                    <li class="<c:if test="${sessionScope.path eq '/WEB-INF/jsp/teacher/studentInformation.jsp'}">active</c:if>">
                        <a href="<%=ctxPath%>/Admin/studentInformation.do">
                            <i class="fa fa-dashboard"></i> <span>学生信息</span>
                        </a>
                    </li>
--%>


                </ul>
            </c:when>
            <c:when test="${sessionScope.role.name == '班主任'}">
                <ul class="sidebar-menu" data-widget="tree">
                    <li class="header">贵州工程技术学院资助管理系统</li>

                    <li class="<c:if test="${sessionScope.path eq '/WEB-INF/jsp/indexTeacher.jsp'}">active</c:if>">
                        <a href="<%=ctxPath%>/Admin/indexTeacher.do">
                            <i class="fa fa-dashboard"></i> <span>数据统计</span>
                        </a>
                    </li>

                    <li class="<c:if test="${sessionScope.path eq '/WEB-INF/jsp/teacher/teaCheck.jsp'}">active</c:if>">
                        <a href="<%=ctxPath%>/Admin/teaCheck.do">
                            <i class="fa fa-dashboard"></i> <span>资格审核</span>
                        </a>
                    </li>

                    <li class="<c:if test="${sessionScope.path eq '/WEB-INF/jsp/nextLevel/list.jsp'}">active</c:if>
                        <c:if test="${sessionScope.path eq '/WEB-INF/jsp/superNextLevel/list.jsp'}">active</c:if>
                        <c:if test="${sessionScope.path eq '/WEB-INF/jsp/schoolNextLevel/list.jsp'}">active</c:if>
                        <c:if test="${sessionScope.path eq '/WEB-INF/jsp/shuJiNextLevel/list.jsp'}">active</c:if>
                        <c:if test="${sessionScope.path eq '/WEB-INF/jsp/fuDaoYuanNextLevel/list.jsp'}">active</c:if>
                        <c:if test="${sessionScope.path eq '/WEB-INF/jsp/banZhuRenNextLevel/list.jsp'}">active</c:if>">
                        <a href="<%=ctxPath%>/BanZhuRenNextLevel/banZhuRenNextLevelList.do">
                            <i class="fa fa-dashboard"></i> <span>学生账号管理</span>
                        </a>
                    </li>


                   <%-- <li class="treeview <c:if test="${sessionScope.path eq '/WEB-INF/jsp/college/list.jsp'}">active</c:if> <c:if test="${sessionScope.path eq '/WEB-INF/jsp/class/list.jsp'}">active</c:if>">
                        <a href="#">
                            <i class="fa fa-dashboard"></i> <span>学院班级管理</span>
                            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
                        </a>
                        <ul class="treeview-menu">
                            <li class="<c:if test="${sessionScope.path eq '/WEB-INF/jsp/college/list.jsp'}">active</c:if>"><a href="<%=ctxPath%>/College/collegeList.do"><i class="fa fa-circle-o"></i> 学院管理</a></li>
                            <li class="<c:if test="${sessionScope.path eq '/WEB-INF/jsp/class/list.jsp'}">active</c:if>"><a href="<%=ctxPath%>/Class/classList.do"><i class="fa fa-circle-o"></i> 班级管理</a></li>
                        </ul>
                    </li>


                    <li class="treeview <c:if test="${sessionScope.path eq '/WEB-INF/jsp/adminUserRole/list.jsp'}">active</c:if> <c:if test="${sessionScope.path eq '/WEB-INF/jsp/role/list.jsp'}">active</c:if>">
                        <a href="#">
                            <i class="fa fa-dashboard"></i> <span>权限管理</span>
                            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
                        </a>
                        <ul class="treeview-menu">
                            <li class="<c:if test="${sessionScope.path eq '/WEB-INF/jsp/adminUserRole/list.jsp'}">active</c:if>"><a href="<%=ctxPath%>/AdminUserRole/adminUserRoleList.do"><i class="fa fa-circle-o"></i> 用户权限管理</a></li>
                            <li class="<c:if test="${sessionScope.path eq '/WEB-INF/jsp/role/list.jsp'}">active</c:if>"><a href="<%=ctxPath%>/Role/roleList.do"><i class="fa fa-circle-o"></i> 角色管理</a></li>
                        </ul>
                    </li>

                    <li class="<c:if test="${sessionScope.path eq '/WEB-INF/jsp/teacher/studentInformation.jsp'}">active</c:if>">
                        <a href="<%=ctxPath%>/Admin/studentInformation.do">
                            <i class="fa fa-dashboard"></i> <span>学生信息</span>
                        </a>
                    </li>--%>



                </ul>
            </c:when>
        </c:choose>
    </section>
    <!-- /.sidebar -->
</aside>
