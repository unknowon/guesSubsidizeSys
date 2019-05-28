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
    <form onsubmit="ajaxSubmitForm(this, true)" action="<%=ctxPath%>/FuDaoYuanNextLevel/fuDaoYuanNextLevelEdit.do" class="form form-horizontal" id="form-add">
        <input type="hidden" name="id" value="${nextLevel.id }"  />

        <div class="col-md-6 col-xs-12">
            <div class="box-body">
                <div class="form-group">
                    <label for="adminUserName"><span class="c-red">*</span>用户名：</label>
                    <input type="text" class="form-control" value="${nextLevel.adminUserName}" id="adminUserName" name="adminUserName" placeholder="输入用户名">
                </div>
            </div>
            <div class="box-body">
                <div class="form-group">
                    <label for="workId"><span class="c-red">*</span>工号：</label>
                    <input type="text" class="form-control" value="${nextLevel.workId}" id="workId" name="workId" placeholder="输入工号">
                </div>
            </div>
            <div class="box-body">
                <div class="form-group">
                    <label for="phone"><span class="c-red">*</span>电话：</label>
                    <input type="text" class="form-control" value="${nextLevel.phone}" id="phone" name="phone" placeholder="输入电话">
                </div>
            </div>
            <div class="box-body">
                <div class="form-group">
                    <select id="roleId" name="classId" datatype="*">
                        <option value="${clz.id }">${clz.Name}</option>
                        <c:forEach items="${classList}" var="clz">
                            <option value="${clz.id }">${clz.Name}</option>
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

<script type="text/javascript">
    $(function(){

        //必须放到页面初始化的时候，不能放到按钮点击里面
        var validForm = $("#form-add").Validform({tiptype:2});//初始化校验器
        $("#btnSave").click(function(){
            if(validForm.check(false)==false)//表单校验不通过
            {
                return;
            }

            var data = $("#form-add").serializeArray();
            $.ajax({
                url:"<%=ctxPath%>/FuDaoYuanNextLevel/fuDaoYuanNextLevelEdit.do",type:"post",
                data:data,
                success:function(result){
                    if(result.status=="success")
                    {
                        parent.location.reload();//刷新父窗口
                    }
                    else
                    {
                        alert("保存失败"+result.msg);
                    }
                },
                error:function(){alert("保存网络请求失败");}
            });
        });
    });
</script>

</body>
</html>
