<%--
  Created by IntelliJ IDEA.
  User: 11479
  Date: 2019/5/27
  Time: 0:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>

    <title>资格审查-申请陈述</title>

    <%@include file="/WEB-INF/jsp/header.jsp"%>


</head>
<body>
<article class="page-container">



        <div class="col-md-6 col-xs-12">
            <div class="box-body pad">
                <div class="box-header">
                    <h3 class="box-title">学生认定理由</h3>
                    <!-- tools box -->
                    <!-- /. tools -->
                </div>

                <textarea class="textarea"  name="inputStatement" id="inputStatement" readonly
                          style="width: 100%; height: 400px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;">${subsidizeInfo.key}</textarea>
                <div class="Validform_checktip"></div>
            </div>

            <!-- /.box-body -->

                <div class="box-footer">

                <div class="col-sm-12">
                    <a href="<%=ctxPath%>/Table/surveyForm.do" target="_blank"><input type="button" class="btn btn-primary col-sm-offset-6" value="调查表" id="survey" onclick="openButton('affirms')"/></a>
                    <a href="<%=ctxPath%>/Table/affirmsForm.do" target="_blank"><input type="button" class="btn btn-primary col-sm-offset-1" disabled value="认定表" id="affirms" onclick="openButton('check')"/></a>
                    <%--<a href="<%=ctxPath%>/User/stuCommunication.do"><input type="button" class="btn btn-default col-xs-offset-4" value="上一步"/></a>--%>
                    <a href="<%=ctxPath%>/DisposeCheck/check.do"><input type="button" class="btn btn-danger col-sm-offset-1" disabled value="审核处理" id="check"/></a>
                </div>
            </div>
        </div>

</article>

<script>
    function openButton(id){
        document.getElementById(id).disabled="";
    }
</script>

</body>
</html>
