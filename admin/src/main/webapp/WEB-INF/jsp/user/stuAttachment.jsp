<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
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
                  <%--<th>序号</th>--%>
                  <th>文件名</th>
                  <th>操作</th>
                </tr>
                </thead>
                <tbody>

                <c:forEach items="${attachmentList}" var="attachment">
                  <tr>
                    <td>
                      <%--<div>
                        <input type="file" id="exampleInputFile">
                      </div>--%>
                      <a href="<%=ctxPath%>/${attachment.path}">
                        ${attachment.name}
                      </a>
                    </td>
                    <td>
                      <a title="删除" href="javascript:;" onclick="attachment_del(this,'${attachment.id}')" class="ml-5" style="text-decoration:none"><i class="fa fa-fw fa-trash"></i></a>
                    </td>
                  </tr>
                </c:forEach>


                </tbody>
              </table>
            </div>
            <div class="box-footer">
              <div class="col-sm-12">
                <a href="<%=ctxPath%>/User/stuDepartment.do">
                  <input type="button" class="btn btn-default col-xs-offset-4" value="上一步">
                </a>
                <a href="<%=ctxPath%>/User/stuStatement.do">
                  <input type="button" class="btn btn-info col-sm-offset-2" value="下一步">
                </a>
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
  <%--<footer class="main-footer">
    <div class="pull-right hidden-xs">
      <b>Version</b> 2.4.0
    </div>
    <strong>Copyright &copy; 2014-2016 <a href="https://adminlte.io">Almsaeed Studio</a>.</strong> All rights
    reserved.
  </footer>--%>

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

  function attachment_del(obj,id){
    layer.confirm('确认要删除吗？',function(index){
      $.ajax({
        url:"<%=ctxPath%>/User/stuMemberDel.do",type:"post",
        data:{id:id},
        success:function(obj) {
          if(obj.status=="success") {
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
</script>
</body>
</html>
