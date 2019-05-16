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
    <form onsubmit="ajaxSubmitForm(this, true)" action="<%=ctxPath%>/updatePassword.do" class="form form-horizontal" id="form-add">

        <div class="col-md-6 col-xs-12">
            <div class="box-body">
                <div class="form-group">
                    <label for="oldPassword"><span class="c-red">*</span>旧密码：</label>
                    <input type="password" class="form-control" value="" id="oldPassword" name="password" placeholder="输入旧密码">
                </div>
                <div class="form-group">
                    <label for="newPassword"><span class="c-red">*</span>新密码：</label>
                    <input type="password" class="form-control" value="" id="newPassword" name="newpassword" placeholder="输入新密码">
                </div>
                <div class="form-group">
                    <label for="rePassword"><span class="c-red">*</span>重复新密码：</label>
                    <input type="password" class="form-control" value="" id="rePassword" name="renewpassword" placeholder="重复新密码">
                </div>
            </div>


            <div class="box-footer">
                <input type="submit" id="btnSave" class="btn btn-primary" value="确定"/>
            </div>
        </div>

    </form>
</article>

</body>
</html>
