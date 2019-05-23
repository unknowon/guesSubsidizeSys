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
    <title>贵州工程技术学院资助管理系统</title>

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
                <li class="active">
                    <a href="<%=ctxPath%>/Admin/teaCheck.do">
                        <i class="fa fa-check-square"></i> <span>资格审核</span>
                    </a>
                </li>
                <li class="treeview">
                    <a href="#">
                        <i class="fa fa-dashboard"></i> <span>权限管理</span>
                        <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
                    </a>
                    <ul class="treeview-menu">
                        <li><a href="adminList.html"><i class="fa fa-circle-o"></i> 用户权限管理</a></li>
                        <li><a href="roleList.html"><i class="fa fa-circle-o"></i> 角色管理</a></li>
                    </ul>
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
                资格审核
                <small>权限内学生资格审核</small>
            </h1>
        </section>

        <!-- Main content -->
        <section class="content">

            <div class="row">
                <div class="col-xs-12">
                    <div class="box">
                        <div class="col-sm-12">
                            <a href="<%=ctxPath%>/Admin/teaCheck.do"><input type="button" class="btn btn-info pull-left" value="全部信息"/></a>
                            <a href="<%=ctxPath%>/Admin/teaCheck.do?checkStatus=1"><input type="button" class="btn btn-info pull-left" value="班主任审核中"/></a>
                            <a href="<%=ctxPath%>/Admin/teaCheck.do?checkStatus=2"><input type="button" class="btn btn-info pull-left" value="辅导员审核中"/></a>
                            <a href="<%=ctxPath%>/Admin/teaCheck.do?checkStatus=3"><input type="button" class="btn btn-info pull-left" value="学院审核中"/></a>
                            <a href="<%=ctxPath%>/Admin/teaCheck.do?checkStatus=4"><input type="button" class="btn btn-info pull-left" value="学校审核中"/></a>
                        </div>
                        <form action="<%=ctxPath%>/Admin/teaCheck.do">
                            <div class="form-group">
                                <div class="col-sm-2 control-label">
                                    <label for="select1">按状态查询</label>
                                    <select id="select1" name="checkStatus" class="form-control select2" style="width: 100%;">
                                        <option value="9" <c:if test="${param.checkStatus eq 9}">selected</c:if> >全部</option>
                                        <option value="5" <c:if test="${param.checkStatus eq 5}">selected</c:if> >家庭经济不困难</option>
                                        <option value="6" <c:if test="${param.checkStatus eq 6}">selected</c:if> >家庭经济一般困难</option>
                                        <option value="7" <c:if test="${param.checkStatus eq 7}">selected</c:if> >家庭经济困难</option>
                                        <option value="8" <c:if test="${param.checkStatus eq 8}">selected</c:if> >家庭经济特殊困难</option>
                                    </select>
                                </div>
                                <div class="col-sm-2 control-label">
                                    <label>按姓名查询</label>
                                    <input type="text" class="form-control" id="inputNation" name="name" value="${param.name}">
                                </div>
                                <div class="col-sm-2 control-label">
                                    <label>按年度查询</label>
                                    <select class="form-control select2" style="width: 100%;" name="year">
                                        <option <c:if test="${param.year eq 2019}">selected</c:if> >2019</option>
                                        <option <c:if test="${param.year eq 2018}">selected</c:if> >2018</option>
                                        <option <c:if test="${param.year eq 2017}">selected</c:if> >2017</option>
                                        <option <c:if test="${param.year eq 2016}">selected</c:if> >2016</option>
                                    </select>
                                </div>

                                <div class="col-sm-2 control-label">
                                    <label>&nbsp;</label>
                                    <input type="submit" class="btn btn-info pull-left form-control" value="查询"/>
                                </div>
                            </div>
                        </form>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <table id="example2" class="table table-bordered table-striped">
                                <thead>
                                <tr>
                                    <%--<th>选择框</th>--%>
                                    <th>学号</th>
                                    <th>姓名</th>
                                    <th>院系</th>
                                    <th>班级</th>
                                    <th>审核状态</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${pageInfo.list }" var="user">
                                <tr>
                                    <%--<td >
                                        <input type="checkbox">
                                    </td>--%>
                                    <td>${user.studentNum}</td>
                                    <td>${user.name}</td>
                                    <td>${user.collegeName}</td>
                                    <td>${user.className}</td>
                                    <td>
                                        <c:choose>
                                        <c:when test="${user.checkStatus == 1}">班主任审核中</c:when>
                                        <c:when test="${user.checkStatus == 2}">辅导员审核中</c:when>
                                        <c:when test="${user.checkStatus == 3}">学院书记审核中</c:when>
                                        <c:when test="${user.checkStatus == 4}">学校审核中</c:when>
                                        <c:when test="${user.checkStatus == 5}">审核不通过</c:when>
                                        <c:when test="${user.checkStatus == 6}">不困难</c:when>
                                        <c:when test="${user.checkStatus == 7}">一般困难</c:when>
                                        <c:when test="${user.checkStatus == 8}">困难</c:when>
                                        <c:when test="${user.checkStatus == 9}">特殊困难</c:when>
                                    </c:choose>
                                    </td>
                                    <td>申请陈述 | 调查表 | 附件表 |审核处理</td>
                                </tr>
                                </c:forEach>
                            </table>

                        </div>
                        <!-- /.box-body -->
                        <c:if test="${pageInfo.pages>1 }">
                            <div id="pagination" style="margin: 20px;"></div>
                            <script type="text/javascript" src="<%=ctxPath %>/lib/laypage/1.2/laypage.js"></script>
                            <script type="text/javascript">
                                laypage({
                                    cont:'pagination',
                                    pages:${pageInfo.pages},
                                    curr: ${pageInfo.pageNum},
                                    jump:function(obj,first){
                                        if(!first){
                                            $("#curr").val(obj.curr);
                                            $("form").submit();
                                        }
                                    }
                                });
                            </script>
                        </c:if>
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



</div>
<!-- ./wrapper -->


<!-- page script -->
<script>
    /*$(function () {
        $('#example2').DataTable({
            'paging'      : true,
            'lengthChange': false,
            'searching'   : false,
            'ordering'    : false,
            'info'        : false,
            'autoWidth'   : true,
        })
    })*/
</script>
</body>
</html>

