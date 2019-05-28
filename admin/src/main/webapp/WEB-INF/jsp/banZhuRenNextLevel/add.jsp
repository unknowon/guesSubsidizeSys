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

    <title>增加学生</title>
</head>
<body>
<article class="page-container">
    <form onsubmit="ajaxSubmitForm(this, true)" action="<%=ctxPath%>/BanZhuRenNextLevel/banZhuRenNextLevelAdd.do" class="form form-horizontal" id="form-add">

        <div class="col-md-6 col-xs-12">
            <div class="box-body">
                <div class="form-group">
                    <label for="name"><span class="c-red">*</span>姓名：</label>
                    <input type="text" class="form-control" value="" id="name" name="name" placeholder="输入学生姓名">
                </div>
            </div>
            <div class="box-body">
                <div class="form-group">
                    <label><span class="c-red">*</span>性别：</label>
                    <div>

                    <%--
                    TODO：像是单选、复选框、下拉列表这种
                    在里面加<c:if>标签，也要加name 和 value
                    --%>
                    <input type="radio" name="gender" class="flat-red" checked value="true">
                    男
                    <input type="radio" name="gender" class="flat-red" value="false">
                    女
                </div>
                </div>
                <div class="form-group">
                    <label for="idCardNum"><span class="c-red">*</span>身份证：</label>
                    <input type="text" class="form-control" value="" id="idCardNum" name="idCardNum" placeholder="输入学生身份证号">
                </div>
                <div class="form-group">
                    <label for="studentNum"><span class="c-red">*</span>学号：</label>
                    <input type="text" class="form-control" value="" id="studentNum" name="studentNum" placeholder="输入学生学号">
                </div>
                <div class="form-group">
                    <label for="phone"><span class="c-red">*</span>电话：</label>
                    <input type="text" class="form-control" value="" id="phone" name="phone" placeholder="输入学生电话号码">
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
