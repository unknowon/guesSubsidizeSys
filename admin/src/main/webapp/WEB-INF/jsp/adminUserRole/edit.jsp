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
        <input type="hidden" name="id" value="${adminUserRole.id }" />


        <div class="col-md-6 col-xs-12">
            <div class="box-body">
                <div class="form-group">
                    <label for="adminUserId"><span class="c-red">*</span>用户名：</label>
                    <input type="text" class="form-control" value="${adminUserRole.adminUserId}"  id="adminUserId" name="adminUserId" placeholder="输入用户名">
                </div>
                <div class="row cl">
                    <label class="form-label col-3"><span class="c-red">*</span>角色：</label>
                    <div class="formControls col-5">
                        <select id="roleId" name="roleId" datatype="*">
                            <option value="辅导员">辅导员</option>

                            <option value="${role.id }">管理员</option>
                            <option value="${role.id }">辅导员</option>
                            <option value="${role.id }">学院书记</option>

                        </select>
                    </div>
                    <div class="col-4"> </div>
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
                    if(result.status=="ok")
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
