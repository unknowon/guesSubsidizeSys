<%--
  Created by IntelliJ IDEA.
  User: lulu
  Date: 2019-05-11
  Time: 12:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<!DOCTYPE HTML>
<html>
<head>
    <%@include file="../header.jsp"%>

    <title>修改学院</title>
</head>
<body>
<article class="page-container">
    <form onsubmit="ajaxSubmitForm(this, true)" action="<%=ctxPath%>/College/collegeEdit.do" class="form form-horizontal" id="form-add">
        <input type="hidden" name="id" value="${college.id }"  />

        <div class="col-md-6 col-xs-12">
            <div class="box-body">
                <div class="form-group">
                    <label for="name"><span class="c-red">*</span>学院名：</label>
                    <input type="text" class="form-control" value="${college.name}" id="name" name="name" placeholder="输入学院名称">
                </div>
            </div>

            <!-- /.box-body -->

            <div class="box-footer">
                <input type="submit" id="btnSave" class="btn btn-primary" value="确定"/>
            </div>
        </div>



    </form>
</article>

</body>
</html>
