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

    <title>增加用户</title>
</head>
<body>
<article class="page-container">
    <form onsubmit="ajaxSubmitForm(this, true)" action="<%=ctxPath%>/SchoolNextLevel/schoolNextLevelAdd.do" class="form form-horizontal" id="form-add">

        <div class="col-md-6 col-xs-12">
            <div class="box-body">
                <div class="form-group">
                    <label for="name"><span class="c-red">*</span>用户名：</label>
                    <input type="text" class="form-control" value="" id="name" name="name" placeholder="输入用户名">
                </div>
            </div>
            <div class="box-body">
                <div class="form-group">
                    <label for="workId"><span class="c-red">*</span>工号：</label>
                    <input type="text" class="form-control" value="" id="workId" name="workId" placeholder="输入工号">
                </div>
            </div>
            <div class="box-body">
                <div class="form-group">
                    <label for="phone"><span class="c-red">*</span>电话：</label>
                    <input type="text" class="form-control" value="" id="phone" name="phone" placeholder="输入电话">
                </div>
            </div>
            <div class="box-body">
                <div class="form-group">
                    <select id="roleId" name="collegeId" datatype="*">
                        <c:forEach items="${collegeList}" var="college">
                            <option value="${college.id }">${college.name}</option>
                        </c:forEach>
                    </select>
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
