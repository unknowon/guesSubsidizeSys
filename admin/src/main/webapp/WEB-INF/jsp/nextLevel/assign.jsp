<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<!DOCTYPE HTML>
<html>
<head>
    <head>
        <title>nextLevelassign</title>

        <%@include file="/WEB-INF/jsp/header.jsp"%>

    </head>
</head>
<body>
<article onsubmit="ajaxSubmitForm(this, true)" action="<%=ctxPath%>/NextLevel/nextLevelEdit.do" class="page-container">
    <form class="form form-horizontal" id="form-add">
        <input type="hidden" name="id" value="${nextLevel.id }"/>


        <div class="col-md-6 col-xs-12">
            <div class="box-body">
                <div class="form-group">
                    <label for="name"><span class="c-red">*</span>用户名：</label>
                    <input type="text" class="form-control" value="${nextLevel.name}" id="name" name="name" placeholder="${nextLevel.name}" readonly>
                </div>
                <div class="row cl">
                    <label class="form-label col-3"><span class="c-red">*</span>管辖范围（学院或班级）：</label>

                    <div class="formControls col-5">
                        <select id="roleId" name="roleId" datatype="*">
                            <c:forEach items="${clzList}" var="clz">
                                <option value="${clz.id }">${clz.name}</option>
                            </c:forEach>
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
