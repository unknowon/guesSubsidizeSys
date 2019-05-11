<!DOCTYPE html>
<html>
<head>
  <title>stuAttachment</title>

  <%@include file="../header.jsp"%>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <%@include file="../contextHeader.jsp"%>

  <!-- Left side column. contains the logo and sidebar -->
  <!-- 侧边栏 -->
  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu" data-widget="tree">
        <li class="header">贵州工程应用技术学院资助管理系统</li>


        <%--
        TODO：比如这里，这是基本情况的页面，就把这个li的class设置成active
        --%>

        <li class="">
          <a href="<%=ctxPath%>/User/stuInformation.do">
            <i class="fa fa-dashboard"></i> <span>基本情况</span>
          </a>
        </li>
        <li class="">
          <a href="<%=ctxPath%>/User/stuCommunication.do">
            <i class="fa fa-tty"></i> <span>家庭通讯</span>
          </a>
        </li>
        <li class="">
          <a href="<%=ctxPath%>/User/stuMember.do">
            <i class="fa fa-group"></i> <span>家庭成员</span>
          </a>
        </li>
        <li class="">
          <a href="<%=ctxPath%>/User/stuEconomic.do">
            <i class="fa fa-money"></i> <span>家庭经济情况</span>
          </a>
        </li>
        <li class="">
          <a href="<%=ctxPath%>/User/stuDepartment.do">
            <i class="fa fa-institution"></i> <span>民政部门信息</span>
          </a>
        </li>
        <li class="active">
          <a href="<%=ctxPath%>/User/stuAttachment.do">
            <i class="fa fa-image"></i> <span>附件信息</span>
          </a>
        </li>
        <li class="">
          <a href="<%=ctxPath%>/User/stuStatement.do">
            <i class="fa fa-commenting"></i> <span>申请陈述</span>
          </a>
        </li>
        <li class="">
          <a href="<%=ctxPath%>/User/stuFamily.do">
            <i class="fa fa-home"></i> <span>家庭简介</span>
          </a>
        </li>
      </ul>
    </section>
  </aside>
  <%-- End 侧边栏--%>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        附件信息
        <small>添加附件</small>
      </h1>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="form-group">
            </div>
            <div class="col-sm-12">
                  <button type="submit" class="btn btn-info pull-left" for="exampleInputFile">+增加附件</button>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="example2" class="table table-bordered table-hover">
                <thead>
                <tr>
                  <th>序号</th>
                  <th>文件名</th>
                  <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                  <td>1</td>
                  <td>
                    <div>
                      <input type="file" id="exampleInputFile">
                    </div>
                  </td>
                  <td>删除</td>
                </tr>
                </tbody>
              </table>
            </div>
            <div class="box-footer">
              <div class="col-sm-12">
                <button type="submit" class="btn btn-default col-xs-offset-4">上一步</button>
                <button type="submit" class="btn btn-info col-sm-offset-2">下一步</button>
              </div>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <footer class="main-footer">
    <div class="pull-right hidden-xs">
      <b>Version</b> 2.4.0
    </div>
    <strong>Copyright &copy; 2014-2016 <a href="https://adminlte.io">Almsaeed Studio</a>.</strong> All rights
    reserved.
  </footer>

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
      'paging'      : false,
      'lengthChange': false,
      'searching'   : false,
      'ordering'    : false,
      'info'        : false,
      'autoWidth'   : false
    })
  })
</script>
</body>
</html>
