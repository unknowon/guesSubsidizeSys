<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>stuCommunication</title>

    <%@include file="../header.jsp"%>
    <!-- iCheck for checkboxes and radio inputs -->
    <link rel="stylesheet" href="<%=ctxPath%>/plugins/iCheck/all.css">
    <!-- Bootstrap Color Picker -->
    <link rel="stylesheet" href="<%=ctxPath%>/bower_components/bootstrap-colorpicker/dist/css/bootstrap-colorpicker.min.css">
    <!-- Bootstrap time Picker -->
    <link rel="stylesheet" href="<%=ctxPath%>/plugins/timepicker/bootstrap-timepicker.min.css">
    <!-- Select2 -->
    <link rel="stylesheet" href="<%=ctxPath%>/bower_components/select2/dist/css/select2.min.css">
    <![endif]-->

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
                <li class="active">
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
                家庭通讯
                <small>家庭地址和联系方式说明</small>
            </h1>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="row">
                <!--/.col (left) -->
                <!-- right column -->
                <div class="col-md-12">
                    <!-- Horizontal Form -->
                    <div class="box box-info">
                        <div class="box-header with-border">
                            <h3 class="box-title">家庭通讯</h3>
                        </div>
                        <!-- /.box-header -->
                        <!-- form start -->
                        <form action="<%=ctxPath%>/User/stuCommunication.do" class="form-horizontal" method="post">
                            <div class="box-body">
                                <div class="form-group">
                                    <label for="inputPost" class="col-sm-2 control-label">邮政编码</label>
                                    <div class="col-sm-6">
                                        <input type="text" class="form-control" id="inputPost" placeholder="示例：551100" name="inputPost" datatype="n4-6" nullmsg="请填写邮政编号!" errormsg="请填写正确邮政编号！" value="${inputPost}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="inputTel2" class="col-sm-2 control-label">家长电话</label>
                                    <div class="col-sm-6">
                                        <input type="text" class="form-control" id="inputTel2" placeholder="请填写家长联系电话" name="inputTel2" datatype="m" nullmsg="请填写家长电话!" errormsg="请填写正确电话号码！" value="${inputTel2}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="inputAdd" class="col-sm-2 control-label">家庭详细通讯地址</label>
                                    <div class="col-sm-6">
                                        <input type="text" class="form-control" id="inputAdd" placeholder="请具体至楼门号" name="inputAdd" datatype="*" nullmsg="请填写家庭地址!" value="${inputAdd}">
                                    </div>
                                </div>

                            </div>
                            <!-- /.box-body -->
                            <div class="box-footer">
                                <div class="col-sm-12">
                                    <a href="<%=ctxPath%>/User/stuInformation.do">
                                        <input type="button" class="btn btn-default col-xs-offset-4" value="上一步"/>
                                    </a>
                                    <input type="submit" class="btn btn-info col-sm-offset-2" value="下一步"/>
                                </div>
                            </div>
                            <!-- /.box-footer -->
                        </form>
                    </div>
                </div>
                <!-- /.box -->
                <!-- general form elements disabled -->
            </div>
            <!-- /.row -->
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
    <!--    <footer class="main-footer">
            <div class="pull-right hidden-xs">
                <b>Version</b> 2.4.0
            </div>
            <strong>Copyright &copy; 2014-2016 <a href="https://adminlte.io">Almsaeed Studio</a>.</strong> All rights
            reserved.
        </footer>-->




</div>
<!-- ./wrapper -->

<!-- Page script -->
<script>
    $(function () {
        //Initialize Select2 Elements
        $('.select2').select2()

        //Colorpicker
        $('.my-colorpicker1').colorpicker()
        //color picker with addon
        $('.my-colorpicker2').colorpicker()

        //Timepicker
        $('.timepicker').timepicker({
            showInputs: false
        })
    })
</script>
</body>
</html>
