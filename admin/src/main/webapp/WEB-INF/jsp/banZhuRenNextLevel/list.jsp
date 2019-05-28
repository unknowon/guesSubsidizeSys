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
  <%@include file="../teacherAside.jsp"%>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        学生账号管理
        <small>对所导入学生的管理</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> 主页</a></li>
        <li class="active">学生账号管理</li>
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
                <button type="button" class="btn btn-block btn-primary" href="javascript:;" onclick="admin_add('添加学生','<%=ctxPath%>/BanZhuRenNextLevel/banZhuRenNextLevelAdd.do','800','500')">添加学生</button>
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="example2" class="table table-bordered table-hover">
                <thead>
                <tr>
                  <th>姓名</th>
                  <th>性别</th>
                  <th>身份证</th>
                  <th>学号</th>
                  <th>电话</th>
                  <th>操作</th>
                </tr>
                </thead>
                <tbody>

                <c:forEach items="${studentlList}" var="student">
                <tr>
                  <td>${student.name}</td>
                  <td>${student.gender}</td>
                  <td>${student.idCardNum}</td>
                  <td>${student.studentNum}</td>
                  <td>${student.phone}</td>
                  <%--<td><c:choose><c:when test="${student.roleName eq '班主任'}">${nextLevel.firstClassName}</c:when><c:otherwise>${nextLevel.collegeName}</c:otherwise></c:choose></td>--%>
                  <td>
                    <a title="编辑" href="javascript:;" onclick="admin_edit('修改','<%=ctxPath%>/BanZhuRenNextLevel/banZhuRenNextLevelEdit.do?id=${student.adminUserId}','600','400')" class="ml-5" style="text-decoration:none"><i class="fa fa-fw fa-edit"></i></a>

                    <a title="删除" href="javascript:;" onclick="ajaxDelete('<%=ctxPath%>/BanZhuRenNextLevel/banZhuRenNextLevelDelete.do','id=${student.adminUserId}')" class="ml-5" style="text-decoration:none"><i class="fa fa-fw fa-trash"></i></a>
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
