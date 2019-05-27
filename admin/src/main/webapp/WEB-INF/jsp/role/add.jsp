<%--
  Created by IntelliJ IDEA.
  User: lulu
  Date: 2019-05-27
  Time: 00:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>

<!DOCTYPE HTML>
<html>
<head>
    <%@include file="../header.jsp"%>

    <title>增加角色</title>
</head>
<body>
<article class="page-container">
    <form onsubmit="ajaxSubmitForm(this, true)" action="<%=ctxPath%>/Role/roleAdd.do" class="form form-horizontal" id="form-add">


        <div class="col-md-6 col-xs-12">
            <div class="box-body">
                <div class="form-group">
                    <label for="name"><span class="c-red">*</span>角色名：</label>
                    <input type="text" class="form-control" value="" id="name" name="name" placeholder="输入角色名">
                </div>
                <div class="form-group">
                    <label for="description"><span class="c-red">*</span>描述：</label>
                    <input type="text" class="form-control" value="" id="description" name="description" placeholder="描述角色信息">
                </div>

                <div class="row cl">

                    <label class="form-label col-2">分配权限</label>
                    <div class="formControls col-6">
                        <c:forEach items="${permissionList }" var="permission">
                            <div class="col-2">
                                <input type="checkbox" name="permissionIds" value="${permission.id }" id="permissionId${permission.id}" /><label for="permissionId${permission.id}">${permission.name }</label>
                            </div>
                        </c:forEach>
                    </div>


                    <%--<label class="form-label col-2">权限：</label>
                    <div class="formControls col-10">
                        <dl class="permission-list">
                            <dt>
                                <label>权限列表</label>
                            </dt>

                                <dd>
                                    <dl class="cl permission-list">
                                        <c:forEach items="${permissionList}" var="perm">
                                        <div class="col-3"><input type="checkbox" name="permissionIds" value="${perm.id }" id="1" /><label for="1">${perm.name}</label></div>
                                        </c:forEach>
                                    </dl>
                                </dd>

                        </dl>
                    </div>--%>


                </div>

            </div>

            <!-- /.box-body -->

            <div class="box-footer">
                <input type="button" id="btnSave" class="btn btn-primary" value="确定"/>
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
                url:"",type:"post",
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
