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

    <title>添加班级</title>
</head>
<body>
<article class="page-container">
    <form onsubmit="ajaxSubmitForm(this, true)" action="<%=ctxPath%>/Class/classAdd.do" class="form form-horizontal" id="form-add">

        <div class="col-md-6 col-xs-12">
            <div class="box-body">
                <div class="form-group">
                    <label for="name"><span class="c-red">*</span>班级名称：</label>
                    <input type="text" class="form-control" value="" id="name" name="name" placeholder="输入班级名称">
                </div>
                <div class="row cl">
                    <label class="form-label col-3"><span class="c-red">*</span>所属学院：</label>
                    <div class="formControls col-5">
                        <select id="collegeId" name="collegeId" datatype="*" >

                            <c:forEach items="${collegeList}" var="college">
                            <option value="${college.id }">${college.name}</option>
                            </c:forEach>


                        </select>
                    </div>
                    <div class="col-4"> </div>
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
