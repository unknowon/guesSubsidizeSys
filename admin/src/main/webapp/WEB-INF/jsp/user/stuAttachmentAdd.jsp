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

    <title>修改用户</title>
</head>
<body>
<article class="page-container">
    <form action="<%=ctxPath%>/User/stuAttachmentAddSubmit.do" class="form form-horizontal" id="form-add" enctype="multipart/form-data" method="post">

        <div class="col-md-6 col-xs-12">
            <div class="box-body">
                <div class="form-group">
                    <label for="pictureFile"><span class="c-red">*</span>图片：</label>
                    <input type="file" class="form-control" value="" id="pictureFile" name="pictureFile">
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
