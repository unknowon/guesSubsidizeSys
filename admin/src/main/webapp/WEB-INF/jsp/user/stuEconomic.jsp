<!DOCTYPE html>
<html>
<head>
    <title>stuEconomic</title>

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
                <li class="active">
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
                家庭经济情况
                <small>描述家庭经济状况</small>
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
                            <h3 class="box-title">家庭经济情况</h3>
                        </div>
                        <!-- /.box-header -->
                        <!-- form start -->
                        <form  onsubmit="ajaxSubmitForm(this,true)" action="<%=ctxPath%>/User/stuEconomic.do" class="form-horizontal">
                            <div class="box-body">
                                <div class="form-group">
                                    <label for="inputIncome" class="col-sm-2 control-label">家庭人均月收入（元）</label>
                                    <div class="col-sm-6">
                                        <input type="text" class="form-control" id="inputIncome" placeholder="请计算家庭人均收入" value="${inputIncome}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="inputHazard" class="col-sm-2 control-label">家庭遭受自然灾害情况</label>
                                    <div class="col-sm-6">
                                        <input type="text" class="form-control" id="inputHazard" value="${inputHazard}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="inputAccident" class="col-sm-2 control-label">家庭遭受突发意外事件</label>
                                    <div class="col-sm-6">
                                        <input type="text" class="form-control" id="inputAccident" value="${inputAccident}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="inputLabor" class="col-sm-2 control-label">家庭成员因残疾、年迈而劳动能力弱情况</label>
                                    <div class="col-sm-6">
                                        <input type="text" class="form-control" id="inputLabor" value="${inputLabor}">
                                    </div>
                                </div>
                                <div class="form-group">
                                <label for="inputUnemployment" class="col-sm-2 control-label">家庭成员失业情况</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" id="inputUnemployment" placeholder="请描述家庭成员失业情况" value="${inputUnemployment}">
                                </div>
                            </div>
                                <div class="form-group">
                                    <label for="inputDebt" class="col-sm-2 control-label">家庭欠债情况</label>
                                    <div class="col-sm-6">
                                        <input type="text" class="form-control" id="inputDebt" placeholder="请描述家庭欠债情况和数量" value="${inputDebt}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="inputElse" class="col-sm-2 control-label">其他情况</label>
                                    <div class="col-sm-6">
                                        <input type="text" class="form-control" id="inputElse" placeholder="不在上述范围内的其他情况描述" value="${inputElse}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="subSidize" class="col-sm-2 control-label">学生本学年已获资助情况</label>
                                    <div class="col-sm-6">
                                        <input type="text" class="form-control" id="subSidize" placeholder="请描述本学年本人已获资助"  value="${subSidize}">
                                    </div>
                                </div>

                            </div>
                            <!-- /.box-body -->
                            <div class="box-footer">
                                <div class="col-sm-12">
                                <button type="submit" class="btn btn-default col-xs-offset-4">上一步</button>
                                <button type="submit" class="btn btn-info col-sm-offset-2">下一步</button>
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

    <!-- Control Sidebar -->
    <aside class="control-sidebar control-sidebar-dark">
        <!-- Create the tabs -->
        <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
            <li><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li>
            <li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li>
        </ul>
        <!-- Tab panes -->
        <div class="tab-content">
            <!-- Home tab content -->
            <div class="tab-pane" id="control-sidebar-home-tab">
                <h3 class="control-sidebar-heading">Recent Activity</h3>
                <ul class="control-sidebar-menu">
                    <li>
                        <a href="javascript:void(0)">
                            <i class="menu-icon fa fa-birthday-cake bg-red"></i>

                            <div class="menu-info">
                                <h4 class="control-sidebar-subheading">Langdon's Birthday</h4>

                                <p>Will be 23 on April 24th</p>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="javascript:void(0)">
                            <i class="menu-icon fa fa-user bg-yellow"></i>

                            <div class="menu-info">
                                <h4 class="control-sidebar-subheading">Frodo Updated His Profile</h4>

                                <p>New phone +1(800)555-1234</p>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="javascript:void(0)">
                            <i class="menu-icon fa fa-envelope-o bg-light-blue"></i>

                            <div class="menu-info">
                                <h4 class="control-sidebar-subheading">Nora Joined Mailing List</h4>

                                <p>nora@example.com</p>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="javascript:void(0)">
                            <i class="menu-icon fa fa-file-code-o bg-green"></i>

                            <div class="menu-info">
                                <h4 class="control-sidebar-subheading">Cron Job 254 Executed</h4>

                                <p>Execution time 5 seconds</p>
                            </div>
                        </a>
                    </li>
                </ul>
                <!-- /.control-sidebar-menu -->

                <h3 class="control-sidebar-heading">Tasks Progress</h3>
                <ul class="control-sidebar-menu">
                    <li>
                        <a href="javascript:void(0)">
                            <h4 class="control-sidebar-subheading">
                                Custom Template Design
                                <span class="label label-danger pull-right">70%</span>
                            </h4>

                            <div class="progress progress-xxs">
                                <div class="progress-bar progress-bar-danger" style="width: 70%"></div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="javascript:void(0)">
                            <h4 class="control-sidebar-subheading">
                                Update Resume
                                <span class="label label-success pull-right">95%</span>
                            </h4>

                            <div class="progress progress-xxs">
                                <div class="progress-bar progress-bar-success" style="width: 95%"></div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="javascript:void(0)">
                            <h4 class="control-sidebar-subheading">
                                Laravel Integration
                                <span class="label label-warning pull-right">50%</span>
                            </h4>

                            <div class="progress progress-xxs">
                                <div class="progress-bar progress-bar-warning" style="width: 50%"></div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="javascript:void(0)">
                            <h4 class="control-sidebar-subheading">
                                Back End Framework
                                <span class="label label-primary pull-right">68%</span>
                            </h4>

                            <div class="progress progress-xxs">
                                <div class="progress-bar progress-bar-primary" style="width: 68%"></div>
                            </div>
                        </a>
                    </li>
                </ul>
                <!-- /.control-sidebar-menu -->

            </div>
            <!-- /.tab-pane -->
            <!-- Stats tab content -->
            <div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab Content</div>
            <!-- /.tab-pane -->
            <!-- Settings tab content -->
            <div class="tab-pane" id="control-sidebar-settings-tab">
                <form method="post">
                    <h3 class="control-sidebar-heading">General Settings</h3>

                    <div class="form-group">
                        <label class="control-sidebar-subheading">
                            Report panel usage
                            <input type="checkbox" class="pull-right" checked>
                        </label>

                        <p>
                            Some information about this general settings option
                        </p>
                    </div>
                    <!-- /.form-group -->

                    <div class="form-group">
                        <label class="control-sidebar-subheading">
                            Allow mail redirect
                            <input type="checkbox" class="pull-right" checked>
                        </label>

                        <p>
                            Other sets of options are available
                        </p>
                    </div>
                    <!-- /.form-group -->

                    <div class="form-group">
                        <label class="control-sidebar-subheading">
                            Expose author name in posts
                            <input type="checkbox" class="pull-right" checked>
                        </label>

                        <p>
                            Allow the user to show his name in blog posts
                        </p>
                    </div>
                    <!-- /.form-group -->

                    <h3 class="control-sidebar-heading">Chat Settings</h3>

                    <div class="form-group">
                        <label class="control-sidebar-subheading">
                            Show me as online
                            <input type="checkbox" class="pull-right" checked>
                        </label>
                    </div>
                    <!-- /.form-group -->

                    <div class="form-group">
                        <label class="control-sidebar-subheading">
                            Turn off notifications
                            <input type="checkbox" class="pull-right">
                        </label>
                    </div>
                    <!-- /.form-group -->

                    <div class="form-group">
                        <label class="control-sidebar-subheading">
                            Delete chat history
                            <a href="javascript:void(0)" class="text-red pull-right"><i class="fa fa-trash-o"></i></a>
                        </label>
                    </div>
                    <!-- /.form-group -->
                </form>
            </div>
            <!-- /.tab-pane -->
        </div>
    </aside>
    <!-- /.control-sidebar -->
    <!-- Add the sidebar's background. This div must be placed
         immediately after the control sidebar -->
    <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->

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
