<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>nextLevelcontrol</title>

  <%@include file="/WEB-INF/jsp/header.jsp"%>

</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <%@include file="/WEB-INF/jsp/contextHeaderTeacher.jsp"%>
  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->

      <!-- search form -->
      <!-- /.search form -->
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu" data-widget="tree">
        <li class="header">贵州工程技术学院资助管理系统</li>

        <li class="">
          <a href="<%=ctxPath%>/Admin/indexTeacher.do">
            <i class="fa fa-dashboard"></i> <span>数据统计</span>
          </a>
        </li>
        <li class="">
          <a href="<%=ctxPath%>/Admin/teaCheck.do">
            <i class="fa fa-dashboard"></i> <span>资格审核</span>
          </a>
        </li>
        <li class="active">
          <a href="<%=ctxPath%>/NextLevel/nextLevelList.do">
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
            <li><a href="<%=ctxPath%>/College/collegeList.do"><i class="fa fa-circle-o"></i> 学院管理</a></li>
            <li class="active"><a href="<%=ctxPath%>/Class/classList.do"><i class="fa fa-circle-o"></i> 班级管理</a></li>
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
            <li><a href="<%=ctxPath%>/AdminUserRole/adminUserRoleList.do"><i class="fa fa-circle-o"></i> 用户权限管理</a></li>
            <li><a href="<%=ctxPath%>/Role/roleList.do"><i class="fa fa-circle-o"></i> 角色管理</a></li>
          </ul>
        </li>
        <li class="">
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
        下级账号管理
        <small>对当前用户权限内下级账号的管理</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> 主页</a></li>
        <li class="active">下级账号管理</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header">
              <!--<h3 class="box-title">用户权限管理</h3>-->
              <div class="col-xs-2">
                <button type="button" class="btn btn-block btn-primary" href="javascript:;" onclick="admin_add('添加用户','<%=ctxPath%>/NextLevel/nextLeveladd.do','800','500')">添加用户</button>
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="example2" class="table table-bordered table-hover">
                <thead>
                <tr>
                  <th>ID</th>
                  <th>用户名</th>
                  <th>工号</th>
                  <th>电话</th>
                  <th>角色</th>
                  <th>指派的班级(或学院)</th>
                  <th>操作</th>
                </tr>
                </thead>
                <tbody>

                <c:forEach items="${nextLevelList}" var="nextLevel">
                <tr>
                  <td>${nextLevel.adminUserId}</td>
                  <td>${nextLevel.adminUserName}</td>
                  <td>${nextLevel.workId}</td>
                  <td>${nextLevel.phone}</td>
                  <td>${nextLevel.roleName}</td>
                  <td>${nextLevel.phone ? nextLevel.phone : "未指派"}</td>
                  <td>
                    <a title="编辑" href="javascript:;" onclick="admin_edit('修改','<%=ctxPath%>/NextLevel/nextLevelEdit.do?id=${nextLevel.adminUserId}','600','400')" class="ml-5" style="text-decoration:none"><i class="fa fa-fw fa-edit"></i></a>
                        <a title="指派" href="javascript:;" onclick="admin_edit('指派班级或学院','<%=ctxPath%>/NextLevel/nextLevelAssign.do?id=${nextLevel.adminUserId}','600','400')" class="ml-5" style="text-decoration:none"><i class="fa fa-fw fa-hand-o-right"></i></a>
                    <a title="删除" href="javascript:;" onclick="ajaxDelete('<%=ctxPath%>/NextLevel/nextLevelDelete.do','id=${nextLevel.adminUserId}')" class="ml-5" style="text-decoration:none"><i class="fa fa-fw fa-trash"></i></a>
                  </td>
                </tr>
                </c:forEach>

                </tbody>

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
</div>
<!-- ./wrapper -->


<!-- page script -->
<script>
  $(function () {
    $('#example2').DataTable({
      'paging'      : true,
      'lengthChange': false,
      'searching'   : false,
      'ordering'    : true,
      'info'        : true,
      'autoWidth'   : false,
      language: {
        "sProcessing": "处理中...",
        "sLengthMenu": "显示 _MENU_ 项结果",
        "sZeroRecords": "没有匹配结果",
        "sInfo": "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
        "sInfoEmpty": "显示第 0 至 0 项结果，共 0 项",
        "sInfoFiltered": "(由 _MAX_ 项结果过滤)",
        "sInfoPostFix": "",
        "sSearch": "搜索: ",
        "sUrl": "",
        "sEmptyTable": "表中数据为空",
        "sLoadingRecords": "载入中...",
        "sInfoThousands": ",",
        "oPaginate": {
          "sFirst": "首页",
          "sPrevious": "上一页",
          "sNext": "下一页",
          "sLast": "末页"
        },
        "oAria": {
          "sSortAscending": ": 以升序排列此列",
          "sSortDescending": ": 以降序排列此列"
        }
      }
    })

    layer.config({
      skin:"box box-primary"
    })
  })

  /*删除*/
  function admin_del(obj,id){
    layer.confirm('确认要删除吗？',function(index){
      $.ajax({
        url:"<%=ctxPath%>/teacher/stuMemberDel.do",type:"post",
        data:{id:id},
        success:function(obj) {
          if(obj.status=="ok") {
            $(link).parents("tr").remove();
            layer.msg('已删除!',{icon:1,time:1000});
            location.reload();
          }
          else {
            alert("删除失败");
          }
        },
        error:function(){alert("删除处理失败");}
      })
    });
  }

  /*修改*/
  function admin_edit(title,url,w,h){
    layer_show(title,url,w,h);
  }

  /*新增*/
  function admin_add(title,url,w,h){
    layer_show(title,url,w,h);
  }
</script>
</body>
</html>
