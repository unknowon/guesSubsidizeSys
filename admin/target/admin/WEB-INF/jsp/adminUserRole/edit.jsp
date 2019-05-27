<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<!DOCTYPE HTML>
<html>
<head>
    <%@include file="../header.jsp"%>

    <title>修改用户</title>
</head>
<body>
<article class="page-container">
    <form class="form form-horizontal" id="form-add">
        <input type="hidden" name="id" value="${adminUser.id }" />


        <div class="col-md-6 col-xs-12">
            <div class="box-body">
                <div class="form-group">
                    <label for="name"><span class="c-red">*</span>用户名：</label>
                    <input type="text" class="form-control" value="${adminUser.name}"  id="name" name="name" placeholder="输入用户名">
                </div>
                <div class="row cl">
                    <label class="form-label col-3"><span class="c-red">*</span>角色：</label>
                    <div class="formControls col-5">
                        <select id="roleId" name="roleId" datatype="*">
                            <option value="${adminUser.roleId}">${adminUser.roleName}</option>

                            <c:forEach items="${roleList}" var="role">
                                <option value="${role.id }">${role.name}</option>
                            </c:forEach>

                        </select>
                    </div>
                    <div class="form-group">
                        <label for="workId"><span class="c-red">*</span>工号：</label>
                        <input type="text" class="form-control" value="${adminUser.workId}" id="workId" name="workId" placeholder="输入工号">
                    </div>
                    <div class="form-group">
                        <label for="phone"><span class="c-red">*</span>工号：</label>
                        <input type="text" class="form-control" value="${adminUser.phone}" id="phone" name="phone" placeholder="输入电话">
                    </div>
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
                url:"<%=ctxPath%>/AdminUserRole/adminUserRoleEdit.do",type:"post",
                data:data,
                success:function(result){
                    if(result.status=="success")
                    {
                        parent.location.reload();//刷新父窗口
                    }
                    else
                    {
                        alert("保存失败"+result.data);
                    }
                },
                error:function(){alert("保存网络请求失败");}
            });
        });
    });
</script>
</body>
</html>
