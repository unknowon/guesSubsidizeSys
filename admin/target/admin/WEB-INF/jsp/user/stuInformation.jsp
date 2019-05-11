<%--
  Created by IntelliJ IDEA.
  User: lulu
  Date: 2019-05-06
  Time: 22:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>

    <title>stuInformation</title>

    <%@include file="../header.jsp"%>
    <!-- iCheck for checkboxes and radio inputs -->
    <link rel="stylesheet" href="<%=ctxPath%>/plugins/iCheck/all.css">
    <!-- Bootstrap Color Picker -->
    <link rel="stylesheet" href="<%=ctxPath%>/bower_components/bootstrap-colorpicker/dist/css/bootstrap-colorpicker.min.css">
    <!-- Bootstrap time Picker -->
    <link rel="stylesheet" href="<%=ctxPath%>/plugins/timepicker/bootstrap-timepicker.min.css">
    <!-- Select2 -->
    <link rel="stylesheet" href="<%=ctxPath%>/bower_components/select2/dist/css/select2.min.css">

    <%--
    TODO：把header里面有的全部删掉
    没有的路径改成这种ctxPath的

    改的时候注意这些文件的顺序，有的js引入的时候顺序出错会报错
    如果是在中间的那种，你就把它加到header里面去

    --%>

</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

    <%@include file="../contextHeader.jsp"%>

    <%--
    TODO：顶栏我独立出来了，把顶栏的部分全部改成上面这句话

    --%>


    <%--

    TODO：下面侧边栏这一块
    可以直接整个aside拷贝粘贴过去，但是要注意页面要把对应的地方改成active

    --%>

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

                <li class="active">
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
                基本信息
                <small>学生个人基本情况说明</small>
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
                            <h3 class="box-title">基本信息</h3>
                        </div>
                        <!-- /.box-header -->
                        <!-- form start -->

                        <%--
                        TODO：form这里改成这样，action里面就是这个页面的路径

                        --%>
                        <form action="<%=ctxPath%>/User/stuInformation.do" class="form-horizontal" method="post">
                            <div class="box-body">
                                <div class="form-group">
                                    <label for="name" class="col-sm-2 control-label">姓名</label>
                                    <div class="col-sm-6">

                                        <%--
                                        TODO：每个这种input要把加上name属性，属性名就是数据库的字段值
                                        要加上value
                                        value的值是${XXX}这种格式，user是学生，如果是T_user那张表里的属性，你user.XXX，如果不是的话，就写单词，但是写个文档给我
                                        这样：
                                            民族 nationality
                                            政治面貌 politicalStatus
                                                0 群众
                                                1 共产党员
                                                2 共青团员
                                                3 其他民主党派

                                            入学前户口 beforeResidency
                                            毕业院校 graduatedSchool
                                            家庭总人数 totalNumOfFamily
                                            家庭住房情况 houseStatus
                                                0 楼房
                                                1 瓦房
                                            个人特长 specialty

                                        写在word文档里


                                        --%>
                                        <input type="text" class="form-control" id="name" name="name" placeholder="示例：王三" datatype="*" nullmsg="请输入姓名" value="${user.name }">
                                    </div>
                                </div>
                                <!-- radio -->
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">性别</label>
                                    <div class="col-sm-6">
                                        <div>

                                            <%--
                                            TODO：像是单选、复选框、下拉列表这种
                                            在里面加<c:if>标签，也要加name 和 value
                                            --%>
                                            <input type="radio" name="gender" class="flat-red" <c:if test="${user.gender == true}"> checked</c:if> value="true">
                                            男
                                            <input type="radio" name="gender" class="flat-red" <c:if test="${user.gender == false}"> checked</c:if> value="false">
                                            女
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="nationality" class="col-sm-2 control-label">民族</label>
                                    <div class="col-sm-6">
                                        <input type="text" class="form-control" id="nationality" name="nationality" placeholder="示例：汉族" datatype="*" nullmsg="请填写民族!" value="${nationality}">
                                    </div>
                                </div>
                                <!-- select -->
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">政治面貌</label>
                                    <div class="col-sm-3">
                                        <select name="politicalStatus" class="form-control">
                                            <option value="1" <c:if test="${politicalStatus == '1'}">selected</c:if> >共产党员</option>
                                            <option value="2" <c:if test="${politicalStatus == '2'}">selected</c:if> >共青团员</option>
                                            <option value="3" <c:if test="${politicalStatus == '3'}">selected</c:if> >其它民主党派</option>
                                            <option value="0" <c:if test="${politicalStatus == '0'}">selected</c:if> >群众</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="beforeResidency" class="col-sm-2 control-label">入学前户口</label>
                                    <div class="col-sm-6">
                                        <input type="text" class="form-control" id="beforeResidency" name="beforeResidency" placeholder="示例：贵州省毕节市" datatype="*" nullmsg="请填写户口!" value="${beforeResidency}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="idCardNum" class="col-sm-2 control-label">身份证号码</label>
                                    <div class="col-sm-6">
                                        <input type="text" class="form-control" id="idCardNum" name="idCardNum" placeholder="示例：520118XXXXXXXX5617" datatype="n16-18" nullmsg="请填写身份证号!" errormsg="填写正确的身份证号！" value="${user.idCardNum}">
                                    </div>
                                </div>
                                <%--<div class="form-group">
                                    <label for="datepicker" class="col-sm-2 control-label">出生日期</label>
                                    <div class="col-sm-3">
                                        <div class="input-group date">
                                            <div class="input-group-addon">
                                                <i class="fa fa-calendar"></i>
                                            </div>
                                            &lt;%&ndash;
                                            TODO：遇到日期框，要用<fmt:formatDate>标签格式化，格式是yyyy-MM-dd
                                            &ndash;%&gt;
                                            <input type="text" class="form-control pull-right" id="datepicker" name="birthday" value="<fmt:formatDate value="${user.birthday}" pattern="yyyy-MM-dd"/>">
                                        </div>
                                    </div>
                                    <!-- /.input group -->
                                </div>--%>
                                <div class="form-group">
                                    <label for="graduatedSchool" class="col-sm-2 control-label">毕业院校</label>
                                    <div class="col-sm-6">
                                        <input type="text" class="form-control" id="graduatedSchool" name="graduatedSchool" placeholder="示例：毕节一中" datatype="*" nullmsg="请填写毕业学校!" value="${graduatedSchool}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="totalNumOfFamily" class="col-sm-2 control-label">家庭人数</label>
                                    <div class="col-sm-6">
                                        <input type="text" class="form-control" id="totalNumOfFamily" name="totalNumOfFamily" placeholder="请填写家庭总人数" datatype="n" nullmsg="请填写家庭人数!" errormsg="请使用阿拉伯数字！" value="${totalNumOfFamily}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="phone" class="col-sm-2 control-label">个人电话</label>
                                    <div class="col-sm-6">
                                        <input type="text" class="form-control" id="phone" name="phone" placeholder="请填写个人在校联系电话" datatype="m" nullmsg="请填写个人电话!" errormsg="请填写正确电话号码！" value="${user.phone}">
                                    </div>
                                </div>
                                <!-- select -->
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">家庭住房情况</label>
                                    <div class="col-sm-3">
                                        <select name="houseStatus" class="form-control">
                                            <option value="0" <c:if test="${houseStatus == '0'}" >selected</c:if> >平房</option>
                                            <option value="1" <c:if test="${houseStatus == '1'}">selected</c:if> >瓦房</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="specialty" class="col-sm-2 control-label">个人特长</label>
                                    <div class="col-sm-6">
                                        <input type="text" class="form-control" id="specialty" name="specialty" placeholder="示例：乒乓球、跳舞等" value="${specialty}">
                                    </div>
                                </div>
                            </div>
                            <!-- /.box-body -->
                            <div class="box-footer">
                                <div class="col-sm-12">
                                    <%--<button type="button" onclick="window.location.href='<%=ctxPath%>/User/stuInformation.do'" class="btn btn-default col-xs-offset-4">上一步</button>--%>
                                    <input type="submit" class="btn btn-info col-sm-offset-2" value="下一步"/>
                                    <span style="color: red;">${message}</span>
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


    <%--
    TODO:下面这里原来有很多没用的，也都删掉
    --%>
    <!-- Add the sidebar's background. This div must be placed
         immediately after the control sidebar -->
    <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->


<%--
TODO：下面这里的js文件和上面的css文件一样
--%>

<!-- Select2 -->
<script src="<%=ctxPath%>/bower_components/select2/dist/js/select2.full.min.js"></script>
<!-- InputMask -->
<script src="<%=ctxPath%>/plugins/input-mask/jquery.inputmask.js"></script>
<script src="<%=ctxPath%>/plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
<script src="<%=ctxPath%>/plugins/input-mask/jquery.inputmask.extensions.js"></script>

<!-- bootstrap datepicker -->
<script src="<%=ctxPath%>/bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
<!-- bootstrap color picker -->
<script src="<%=ctxPath%>/bower_components/bootstrap-colorpicker/dist/js/bootstrap-colorpicker.min.js"></script>
<!-- bootstrap time picker -->
<script src="<%=ctxPath%>/plugins/timepicker/bootstrap-timepicker.min.js"></script>

<!-- iCheck 1.0.1 -->
<script src="<%=ctxPath%>/plugins/iCheck/icheck.min.js"></script>

<!-- Page script -->
<script>

    /*
    * TODO：这里也有很多多余的js，不用的就删掉
    *  还有英文的汉化
    * */

    $(function () {
        //Initialize Select2 Elements
        $('.select2').select2()


        //Date picker
        $('#datepicker').datepicker({
            format: 'yyyy-mm-dd',
            autoclose: true,
            monthNames: ['一月','二月','三月','四月','五月','六月','七月','八月','九月','十月','十一月','十二月'],
            monthNamesShort: ['一','二','三','四','五','六', '七','八','九','十','十一','十二'],
            dayNames: ['星期日','星期一','星期二','星期三','星期四','星期五','星期六'],
            dayNamesShort: ['周日','周一','周二','周三','周四','周五','周六'],
            dayNamesMin: ['日','一','二','三','四','五','六'],
            weekHeader: '周',
        })

        //iCheck for checkbox and radio inputs
        $('input[type="checkbox"].minimal, input[type="radio"].minimal').iCheck({
            checkboxClass: 'icheckbox_minimal-blue',
            radioClass   : 'iradio_minimal-blue'
        })
        //Red color scheme for iCheck
        $('input[type="checkbox"].minimal-red, input[type="radio"].minimal-red').iCheck({
            checkboxClass: 'icheckbox_minimal-red',
            radioClass   : 'iradio_minimal-red'
        })
        //Flat red color scheme for iCheck
        $('input[type="checkbox"].flat-red, input[type="radio"].flat-red').iCheck({
            checkboxClass: 'icheckbox_flat-green',
            radioClass   : 'iradio_flat-green'
        })

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

