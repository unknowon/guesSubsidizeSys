<!DOCTYPE html>
<html>
<head>
  <title>stuFamily</title>

  <%@include file="../header.jsp"%>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <%@include file="../contextHeader.jsp"%>
  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu" data-widget="tree">
        <li class="header">贵州工程应用技术学院资助管理系统</li>

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
        <li class="">
          <a href="<%=ctxPath%>/User/stuAttachment.do">
            <i class="fa fa-image"></i> <span>附件信息</span>
          </a>
        </li>
        <li class="">
          <a href="<%=ctxPath%>/User/stuStatement.do">
            <i class="fa fa-commenting"></i> <span>申请陈述</span>
          </a>
        </li>
        <li class="active">
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
        家庭简介
        <small>简述家庭情况及经济状况</small>
      </h1>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-md-12">
          <!-- /.box -->

          <div class="box">
            <div class="box-header">
              <h3 class="box-title">家庭简介
              </h3>
              <!-- tools box -->
              <!-- /. tools -->
            </div>
            <!-- /.box-header -->
            <div class="box-body pad">
              <form onsubmit="ajaxSubmitForm(this,true)" action="<%=ctxPath%>/User/stuFamily.do">
                <textarea class="textarea" name="inputFamily" id="inputFamily" placeholder="请于此处表述（150字以内）..." datatype="*10-150" nullmsg="请填写陈述!" errormsg="字数在10-150以内！" value="${inputFamily}"
                          style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;"></textarea>
              </form>
            </div>
            <div class="box-footer">
              <div class="col-sm-12">
                <button type="submit" class="btn btn-default col-xs-offset-4">上一步</button>
                <button type="submit" class="btn btn-info col-sm-offset-2">完成</button>
              </div>
            </div>
          </div>
        </div>
        <!-- /.col-->
      </div>
      <!-- ./row -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->

<script>
    $(function () {
        // Replace the <textarea id="editor1"> with a CKEditor
        // instance, using default configuration.
        CKEDITOR.replace('editor1')
        //bootstrap WYSIHTML5 - text editor
        $('.textarea').wysihtml5()
    })
</script>
</body>
</html>
