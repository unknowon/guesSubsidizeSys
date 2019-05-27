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

                <textarea class="textarea"  name="inputStatement" id="inputStatement" readonly
                          style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;">${subsidizeInfo.id}</textarea>
                <div class="Validform_checktip"></div>
            </div>

            <!-- /.box-body -->

            <div class="box-footer">
                <div class="col-sm-12">
                    <a href="<%=ctxPath%>/Table/surveyForm.do"><input type="button" class="btn btn-info col-sm-offset-2" value="调查表"/></a>
                    <a href="<%=ctxPath%>/Table/affirmsForm.do"><input type="button" class="btn btn-info col-sm-offset-2" value="认定表"/></a>
                    <%--<a href="<%=ctxPath%>/User/stuCommunication.do"><input type="button" class="btn btn-default col-xs-offset-4" value="上一步"/></a>--%>
                    <a href="<%=ctxPath%>/DisposeCheck/check.do"><input type="button" class="btn btn-info col-sm-offset-2" value="下一步"/></a>
                </div>
            </div>
        </div>

</article>


</body>
</html>
