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
    <form onsubmit="ajaxSubmitForm(this, true)" action="<%=ctxPath%>/User/stuMemberAdd.do" class="form form-horizontal" id="form-add">

        <div class="col-md-6 col-xs-12">
            <div class="box-body">
                <div class="form-group">
                    <label for="UNAME"><span class="c-red">*</span>姓名：</label>
                    <input type="text" class="form-control" value="" id="UNAME" name="name" placeholder="输入家庭成员">
                </div>
                <div class="form-group">
                    <label for="age"><span class="c-red">*</span>年龄：</label>
                    <input type="text" class="form-control" value="" id="age" name="age" placeholder="输入年龄，例：48">
                </div>
                <div class="form-group">
                    <label for="profession"><span class="c-red">*</span>职业：</label>
                    <input type="text" class="form-control" value="" id="profession" name="product" placeholder="例如：工人">
                </div>
                <div class="form-group">
                    <label for="income"><span class="c-red">*</span>年收入：</label>
                    <input type="text" class="form-control" value="" id="income" name="yearIncome" placeholder="例如：8000">
                </div>
                <div class="form-group">
                    <label for="profession"><span class="c-red">*</span>健康状况：</label>
                    <div>
                        <select class="form-control" name="healthStatus">
                            <option>健康</option>
                            <option>疾病</option>
                            <option>残疾</option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label for="company"><span class="c-red">*</span>工作单位：</label>
                    <input type="text" class="form-control" value="" id="company" name="employer" placeholder="请填写工作单位">
                </div>
                <div class="form-group">
                    <label for="status"><span class="c-red">*</span>成员状况：</label>
                    <div>
                        <select id="status" class="form-control" name="memberStatus">
                            <option>正常(含重组家庭)</option>
                            <option>离异</option>
                            <option>单亲</option>
                        </select>
                    </div>
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
