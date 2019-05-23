<%--
  Created by IntelliJ IDEA.
  User: lulu
  Date: 2019-05-20
  Time: 22:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>studentInformation</title>

    <%@include file="/WEB-INF/jsp/header.jsp"%>

</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

    <%@include file="/WEB-INF/jsp/contextHeaderTeacher.jsp"%>
    <!-- Left side column. contains the logo and sidebar -->

    <aside class="main-sidebar">
        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">
            <ul class="sidebar-menu" data-widget="tree">
                <li class="header">贵州工程技术学院资助管理系统</li>

                <li class="">
                    <a href="<%=ctxPath%>/Admin/teaCheck.do">
                        <i class="fa fa-dashboard"></i> <span>数据统计</span>
                    </a>
                </li>
                <li class="">
                    <a href="<%=ctxPath%>/Admin/teaCheck.do">
                        <i class="fa fa-dashboard"></i> <span>资格审核</span>
                    </a>
                </li>
                <li class="">
                    <a href="<%=ctxPath%>/Admin/nextLevelcontrol.do">
                        <i class="fa fa-dashboard"></i> <span>下级账号管理</span>
                    </a>
                </li>
                <li class="treeview">
                    <a href="#">
                        <i class="fa fa-dashboard"></i> <span>学院班级管理</span>
                        <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
                    </a>
                    <ul class="treeview-menu">
                        <li class=""><a href="<%=ctxPath%>/Admin/academyAdd.do"><i class="fa fa-circle-o"></i> 学院管理</a></li>
                        <li><a href="<%=ctxPath%>/Admin/classAdd.do"><i class="fa fa-circle-o"></i> 班级管理</a></li>
                    </ul>
                </li>
                <li class="treeview">
                    <a href="#">
                        <i class="fa fa-dashboard"></i> <span>权限管理</span>
                        <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
                    </a>
                    <ul class="treeview-menu">
                        <li><a href="<%=ctxPath%>/Admin/adminList.do"><i class="fa fa-circle-o"></i> 用户权限管理</a></li>
                        <li><a href="<%=ctxPath%>/Admin/roleList.do"><i class="fa fa-circle-o"></i> 角色管理</a></li>
                    </ul>
                </li>
                <li class="active">
                    <a href="<%=ctxPath%>/Admin/studentInformation.do">
                        <i class="fa fa-dashboard"></i> <span>学生信息</span>
                    </a>
                </li>
            </ul>
        </section>
        <!-- /.sidebar -->
    </aside>


    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                学生信息
                <small>所有学生基本信息</small>
            </h1>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-xs-12">
                    <div class="box">

                        <div class="form-group">
                            <div class="col-sm-5 control-label" style="margin: 20px 0px">
                                <label for="select1">信息查询</label>
                            <div class="input-group">
                                <select id="select1" class="form-control select2" style="width: 35%">
                                    <option selected="selected">姓名</option>
                                    <option>学号</option>
                                    <option>身份证</option>
                                    <option>学院</option>
                                    <option>班级</option>
                                </select>
                                <!-- /btn-group -->
                                <div class="input-group">
                                    <input type="text" class="form-control" id="search" name="search">
                                <span class="input-group-btn">
                                     <button type="button" class="btn btn-info btn-flat">查询</button>
                                </span>
                                </div>
                            </div>
                            </div>
                        </div>

                        <!-- /.box-header -->
                        <div class="box-body">
                            <table id="example2" class="table table-bordered table-striped">
                                <thead>
                                <tr>
                                    <th>选择框</th>
                                    <th>序号</th>
                                    <th>姓名</th>
                                    <th>身份证号</th>
                                    <th>学院</th>
                                    <th>专业</th>
                                    <th>班级</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td >
                                        <input type="checkbox">
                                    </td>
                                    <td>1</td>
                                    <td>王小二</td>
                                    <td>520198100103196718</td>
                                    <td>信息学院</td>
                                    <td>计算机工程</td>
                                    <td>14计算机01</td>
                                    <td><button>密码初始化</button></td>
                                </tr>
                            </table>
                        </div>
                        <!-- /.box-body -->
                    </div>
                    <!-- /.box -->
                </div>
                <!-- /.col -->
            </div>
            <!-- /.row -->
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
    <!-- Add the sidebar's background. This div must be placed
         immediately after the control sidebar -->
    <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->

<!-- page script -->
<script>
    $(function () {
        $('#example1').DataTable()
        $('#example2').DataTable({
            'paging'      : true,
            'lengthChange': false,
            'searching'   : false,
            'ordering'    : false,
            'info'        : false,
            'autoWidth'   : true,
        })
    })
</script>
</body>
</html>

