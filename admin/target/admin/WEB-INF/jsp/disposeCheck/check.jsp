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
        <input type="hidden" name="id" value="${adminUser.adminUserId }" />


        <div class="col-md-6 col-xs-12">
            <div class="box-body">
                <div class="form-group">
                    <label class="col-sm-2 control-label">审核状态</label>
                    <div class="col-sm-6">
                        <div>

                            <%--
                            TODO：像是单选、复选框、下拉列表这种
                            在里面加<c:if>标签，也要加name 和 value
                            --%>
                            <input type="radio" name="checkStatus" id="checkStatus" class="flat-red" <c:if test="${subsidizesInfo.checkStatus == 18}"> checked</c:if> value="18">
                            通过
                            <input type="radio" name="checkStatus" id="checkStatus" class="flat-red" <c:if test="${subsidizesInfo.checkStatus == 19}"> checked</c:if> value="19">
                            不通过
                            <input type="radio" name="checkStatus" id="checkStatus" class="flat-red" <c:if test="${subsidizesInfo.checkStatus == 20}"> checked</c:if> value="20">
                            信息不完整，重新提交
                        </div>
                    </div>
                </div>



                <div class="row cl">
                    <label class="form-label col-3"><span class="c-red">*</span>经济状态：</label>
                    <div class="formControls col-5">
                        <select id="economyStatus" name="economyStatus" datatype="*">
                            <option value="6">家庭一般困难</option>
                            <option value="5">家庭不困难</option>
                            <option value="7">家庭困难</option>
                            <option value="8">家庭特殊困难</option>
                        </select>
                    </div>
                </div>
                <textarea class="textarea"  name="description" id="description" placeholder="备注信息（可不填）"
                          style="width: 100%; height: 400px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;">${subsidizeInfo.key}</textarea>
            </div>

            <!-- /.box-body -->

            <div class="box-footer">
                <input type="button" id="btnSave" class="btn btn-primary" value="确定"/>
            </div>
        </div>



    </form>
</article>
</body>
</html>
