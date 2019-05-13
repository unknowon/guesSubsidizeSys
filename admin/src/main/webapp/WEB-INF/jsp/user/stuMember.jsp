<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>stuMember</title>

  <%@include file="../header.jsp"%>

  <script type="text/javascript" src="<%=ctxPath%>/lib/layer/2.4/layer.js"></script>
  <script type="text/javascript" src="<%=ctxPath%>/static/h-ui/js/H-ui.min.js"></script>
  <script type="text/javascript" src="<%=ctxPath%>/static/h-ui.admin/js/H-ui.admin.js"></script>

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
        <li class="active">
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
        家庭成员
        <small>添加家庭成员基本信息</small>
      </h1>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="col-sm-12">
              <button type="button" class="btn btn-info pull-left" href="javascript:;" onclick="member_add('增加成员','<%=ctxPath%>/User/stuMemberAdd.do','500','700')">+增加成员</button>

            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="example2" class="table table-bordered table-hover">
                <thead>
                <tr>
                  <th>姓名</th>
                  <th>年龄</th>
                  <th>职业</th>
                  <th>年收入（元）</th>
                  <th>健康状况</th>
                  <th>工作（学习）单位</th>
                  <th>成员状况</th>
                  <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${memberList}" var="member">
                  <tr>
                    <td>${member.name}</td>
                    <td>${member.age}</td>
                    <td>${member.product}</td>
                    <td>${member.yearIncome}</td>
                    <td>${member.healthStatus}</td>
                    <td>${member.employer}</td>
                    <td>${member.memberStatus}</td>
                    <td>
                      <a title="删除" href="javascript:;" onclick="member_del(this,'${member.id}')" class="ml-5" style="text-decoration:none"><i class="fa fa-fw fa-trash"></i></a>
                    </td>
                  </tr>
                </c:forEach>


                <%--<tr>
                  <td>王大牙</td>
                  <td>50</td>
                  <td>工人</td>
                  <td>8000</td>
                  <td>健康</td>
                  <td>贵州省清镇纺织厂</td>
                  <td>正常</td>
                  <td>删除</td>
                </tr>--%>
                </tbody>
              </table>
            </div>
            <div class="box-footer">
              <div class="col-sm-12">
                <a href="<%=ctxPath%>/User/stuCommunication.do"><input type="button" class="btn btn-default col-xs-offset-4" value="上一步"/></a>
                <a href="<%=ctxPath%>/User/stuEconomic.do"><input type="button" class="btn btn-info col-sm-offset-2" value="下一步"/></a>
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
  /*删除*/
  function member_del(obj,id){
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



  /*新增*/
  function member_add(title,url,w,h){
    layer_show(title,url,w,h);
  }
</script>
</body>
</html>
