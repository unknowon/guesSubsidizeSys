<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>stuStatement</title>

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
        <li class="active">
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
        申请陈述
        <small>陈述申请资助的原因</small>
      </h1>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-md-12">
          <!-- /.box -->

          <div class="box box-info">
            <div class="box-header">
              <h3 class="box-title">陈述认定理由
              </h3>
              <!-- tools box -->
              <!-- /. tools -->
            </div>
            <!-- /.box-header -->
            <form id="formSubmit" action="<%=ctxPath%>/User/stuStatement.do" method="post">
            <div class="box-body pad">

                <textarea class="textarea"  name="inputStatement" id="inputStatement" placeholder="请于此处表述（150字内）..." datatype="*10-150" nullmsg="请填写陈述!" errormsg="字数在10-150以内！"
                          style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;">${inputStatement}</textarea>
                <div class="Validform_checktip"></div>

            </div>
            <div class="box-footer">
              <div class="col-sm-12">
                <a href="<%=ctxPath%>/User/stuAttachment.do">
                  <input type="button" class="btn btn-default col-xs-offset-4" value="上一步">
                </a>
                <button type="submit" class="btn btn-info col-sm-offset-2">下一步</button>
              </div>
            </div>

            </form>
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
  $("#formSubmit").Validform({
    tiptype:function(msg,o,cssctl){
      //msg：提示信息;
      //o:{obj:*,type:*,curform:*}, obj指向的是当前验证的表单元素（或表单对象），type指示提示的状态，值为1、2、3、4， 1：正在检测/提交数据，2：通过验证，3：验证失败，4：提示ignore状态, curform为当前form对象;
      //cssctl:内置的提示信息样式控制函数，该函数需传入两个参数：显示提示信息的对象 和 当前提示的状态（既形参o中的type）;
      if(!o.obj.is("form")){//验证表单元素时o.obj为该表单元素，全部验证通过提交表单时o.obj为该表单对象;
        var objtip=o.obj.siblings(".Validform_checktip");
        cssctl(objtip,o.type);
        objtip.text(msg);
      }else{
        var objtip=o.obj.find("#msgdemo");
        cssctl(objtip,o.type);
        objtip.text(msg);
      }
    },
  });
</script>
</body>
</html>
