<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%String ctxPath = request.getContextPath(); %>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- Tell the browser to be responsive to screen width -->
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<!-- Bootstrap 3.3.7 -->
<link rel="stylesheet" href="<%=ctxPath%>/bower_components/bootstrap/dist/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet" href="<%=ctxPath%>/bower_components/font-awesome/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet" href="<%=ctxPath%>/bower_components/Ionicons/css/ionicons.min.css">
<!-- DataTables -->
<link rel="stylesheet" href="<%=ctxPath%>/bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="<%=ctxPath%>/dist/css/AdminLTE.min.css">
<!-- DataTables -->
<link rel="stylesheet" href="<%=ctxPath%>/bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">
<!-- iCheck -->
<link rel="stylesheet" href="<%=ctxPath%>/plugins/iCheck/square/blue.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins
folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet" href="<%=ctxPath%>/dist/css/skins/_all-skins.min.css">
<!-- Morris chart -->
<link rel="stylesheet" href="<%=ctxPath%>/bower_components/morris.js/morris.css">
<!-- jvectormap -->
<link rel="stylesheet" href="<%=ctxPath%>/bower_components/jvectormap/jquery-jvectormap.css">
<!-- Date Picker -->
<link rel="stylesheet" href="<%=ctxPath%>/bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
<!-- Daterange picker -->
<link rel="stylesheet" href="<%=ctxPath%>/bower_components/bootstrap-daterangepicker/daterangepicker.css">
<!-- bootstrap datepicker -->
<link rel="stylesheet" href="<%=ctxPath%>/bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
<!-- bootstrap wysihtml5 - text editor -->
<link rel="stylesheet" href="<%=ctxPath%>/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
<!-- Google Font -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">



<%--js--%>

<!-- jQuery 3 -->
<script src="<%=ctxPath%>/bower_components/jquery/dist/jquery.min.js"></script>


<script type="text/javascript" src="<%=ctxPath%>/lib/jquery.validation/1.14.0/validate-methods.js"></script>
<script type="text/javascript" src="<%=ctxPath%>/lib/jquery.validation/1.14.0/messages_zh.js"></script>

<!-- validForm -->
<script src="<%=ctxPath%>/lib/Validform/5.3.2/Validform.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="<%=ctxPath%>/bower_components/jquery-ui/jquery-ui.min.js"></script>






<script type="text/javascript" src="<%=ctxPath%>/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="<%=ctxPath%>/static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="<%=ctxPath%>/static/h-ui.admin/js/H-ui.admin.js"></script>


<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
    $.widget.bridge('uibutton', $.ui.button);
</script>
<!-- Bootstrap 3.3.7 -->
<script src="<%=ctxPath%>/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- DataTables -->
<script src="<%=ctxPath%>/bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="<%=ctxPath%>/bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
<!-- Morris.js charts -->
<script src="<%=ctxPath%>/bower_components/raphael/raphael.min.js"></script>
<script src="<%=ctxPath%>/bower_components/morris.js/morris.min.js"></script>
<!-- Sparkline -->
<script src="<%=ctxPath%>/bower_components/jquery-sparkline/dist/jquery.sparkline.min.js"></script>
<!-- Select2 -->
<script src="<%=ctxPath%>/bower_components/select2/dist/js/select2.full.min.js"></script>
<!-- InputMask -->
<script src="<%=ctxPath%>/plugins/input-mask/jquery.inputmask.js"></script>
<script src="<%=ctxPath%>/plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
<script src="<%=ctxPath%>/plugins/input-mask/jquery.inputmask.extensions.js"></script>
<!-- date-range-picker -->
<script src="<%=ctxPath%>/bower_components/moment/min/moment.min.js"></script>
<script src="<%=ctxPath%>/bower_components/bootstrap-daterangepicker/daterangepicker.js"></script>
<!-- bootstrap datepicker -->
<script src="<%=ctxPath%>/bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
<!-- bootstrap color picker -->
<script src="<%=ctxPath%>/bower_components/bootstrap-colorpicker/dist/js/bootstrap-colorpicker.min.js"></script>
<!-- bootstrap time picker -->
<script src="<%=ctxPath%>/plugins/timepicker/bootstrap-timepicker.min.js"></script>
<!-- jvectormap -->
<script src="<%=ctxPath%>/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="<%=ctxPath%>/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<!-- jQuery Knob Chart -->
<script src="<%=ctxPath%>/bower_components/jquery-knob/dist/jquery.knob.min.js"></script>
<!-- daterangepicker -->
<script src="<%=ctxPath%>/bower_components/moment/min/moment.min.js"></script>
<script src="<%=ctxPath%>/bower_components/bootstrap-daterangepicker/daterangepicker.js"></script>
<!-- datepicker -->
<script src="<%=ctxPath%>/bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
<%--<!-- Bootstrap WYSIHTML5 -->
<script src="<%=ctxPath%>/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>--%>
<!-- Slimscroll -->
<script src="<%=ctxPath%>/bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="<%=ctxPath%>/bower_components/fastclick/lib/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="<%=ctxPath%>/dist/js/adminlte.min.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="<%=ctxPath%>/dist/js/pages/dashboard.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="<%=ctxPath%>/dist/js/demo.js"></script>
<!-- CK Editor -->
<script src="<%=ctxPath%>/bower_components/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="<%=ctxPath%>/js/common.js"></script>

