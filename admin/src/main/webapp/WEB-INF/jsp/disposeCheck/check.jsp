<%--
  Created by IntelliJ IDEA.
  User: Wonder
  Date: 2019/5/27
  Time: 0:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>

    <title>资格审查-审核处理</title>

    <%@include file="/WEB-INF/jsp/header.jsp"%>


</head>
<body>
<article class="page-container">
    <form class="form form-horizontal" id="form-add">
        <input type="hidden" name="id" value="${adminUser.id }" />
        <input type="hidden" name="userId" value="${userId }" />



        <div class="col-md-6 col-xs-12">
            <div class="box-body">
                <div class="form-group">
                    <label class="col-sm-2 control-label">审核状态</label>
                    <div class="col-sm-6">
                        <div>
                            <input type="radio" name="checkStatus"  class="flat-red" <c:if test="${subsidizeInfo.checkStatus == 18}"> checked</c:if> value="1">
                            通过
                            <input type="radio" name="checkStatus" class="flat-red" <c:if test="${subsidizeInfo.checkStatus == 19}"> checked</c:if> value="2">
                            不通过
                            <input type="radio" name="checkStatus" class="flat-red" <c:if test="${subsidizeInfo.checkStatus == 20}"> checked</c:if> value="3">
                            信息不完整，重新提交
                        </div>
                    </div>
                </div>



                <div class="row cl">
                    <label class="form-label col-3"><span class="c-red">*</span>经济状态：</label>
                    <div class="formControls col-5">
                        <select id="economyStatus" name="economyStatus" datatype="*">
                            <option value="1">家庭一般困难</option>
                            <option value="2">家庭不困难</option>
                            <option value="3">家庭困难</option>
                            <option value="4">家庭特殊困难</option>
                        </select>
                    </div>
                </div>
                <div class="row cl">
                    <textarea class="textarea"  name="description" id="description" placeholder="备注信息（可不填）"
                          style="width: 100%; height: 400px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;"></textarea>
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
                url:"<%=ctxPath%>/DisposeCheck/check.do",type:"post",
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
