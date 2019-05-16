<%--
  Created by IntelliJ IDEA.
  User: lulu
  Date: 2019-05-15
  Time: 21:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
    <title>
        学生资助认定表
    </title>
    <style type="text/css">
        html,
        body {
            margin:0;
            padding:0;
        }
        div,
        p,
        table,
        th,
        td,font {
            font-size: 1em;
            font-family: inherit;
            line-height: inherit;
            border-collapse: collapse;
            border-color: #C0C0C0;
        }
        img{   border:0; max-width:660px;  }
    </style>
    <script type="text/javascript" language="javascript">
        function word()
        {
            __doPostBack('LinkButton2','');
        }
        function doPrint() {
            bdhtml=window.document.body.innerHTML;
            sprnstr="<!--startprint-->";
            eprnstr="<!--endprint-->";
            prnhtml=bdhtml.substr(bdhtml.indexOf(sprnstr)+17);
            prnhtml=prnhtml.substring(0,prnhtml.indexOf(eprnstr));
            window.document.body.innerHTML=prnhtml;
            window.print();
        }
    </script>
</head>
<body>
<form name="form1" method="post" action="rending.aspx?id=130844" id="form1">
    <div>
        <input type="hidden" name="__EVENTTARGET" id="__EVENTTARGET" value="" />
        <input type="hidden" name="__EVENTARGUMENT" id="__EVENTARGUMENT" value="" />
        <input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="/wEPDwUKMTIxMjAwNTMwOA9kFgICAw9kFjgCAQ8PFgIeBFRleHQFDOavleiKguWtpumZomRkAgMPDxYCHwAFCeeOi+S8vOi2hWRkAgUPDxYCHwAFA+eUt2RkAgcPDxYCHwAFCDE5OTgwNDE5ZGQCCQ8PFgIfAAUG5rGJ5pePZGQCCw8PFgIfAAUSNTIwMTEzMTk5ODA0MTkxMjEwZGQCDQ8PFgIfAAUM5YWx6Z2S5Zui5ZGYZGQCDw8PFgIfAAUDMjUzZGQCEQ8PFgIfAAUb5L+h5oGv5bel56iL5a2m6ZmiICAgICAgICAgZGQCEw8PFgIfAAUb5L+h5oGv5bel56iL5a2m6ZmiICAgICAgICAgZGQCFQ8PFgIfAAUM6L2v5Lu25bel56iLZGQCFw8PFgIfAAUKMjAxNiAgICAgIGRkAhkPDxYCHwAFEDE26L2v5Lu25pysICAgICBkZAIbDw8WAh8ABQsxMzYzOTEwODA5N2RkAh0PDxYCHwAFiALlm6DniLbmr43miYDlnKjljZXkvY3noLTkuqfvvIznjrDlnKjkuIvlspfml6DkuJrvvIzml6DnqLPlrprmlLblhaXvvIzlj6rog73pnaAzODDlhYPnmoTkuIvlspflt6XotYTnlJ/mtLvvvIznu4/mtY7lm7Dpmr7vvJvlnKjmoKHlrabkuaDli6TlpYvvvIzlm6Lnu5PlkIzlrabvvIzlsIrmlazogIHluIjvvIzmiJDnu6nkvJjlvILvvIzmi4Xku7vnj63lubLpg6jvvJvkuLrkuoblh4/ovbvniLbmr43otJ/mi4XvvIznibnnlLPor7fliqnlrabph5HvvIzmnJvmibnlh4ZkZAIfDw8WAh8ABQnnjovkvLzotoVkZAIhDw8WAh8ABRAyMDE45bm0NOaciDEw5pelZGQCIw8QDxYCHgdDaGVja2VkZ2RkZGQCJQ8PFgIfAGVkZAInDw8WAh8ABQbkvZnkuLlkZAIpDw8WAh8ABRAyMDE45bm0NuaciDEy5pelZGQCMQ8QDxYCHwFnZGRkZAI3Dw8WAh8ABQbmnpfoj4FkZAI5Dw8WAh8ABRAyMDE45bm0NuaciDIy5pelZGQCOw8QDxYCHwFnZGRkZAI/Dw8WAh8AZWRkAkEPDxYCHwAFCemZiOacneelpWRkAkMPDxYCHwAFEDIwMTjlubQ35pyIMjPml6VkZGSYOpmIc3AhKe2XezYKZUloOQuUjw==" />
    </div>

    <script type="text/javascript">
        //<![CDATA[
        var theForm = document.forms['form1'];
        if (!theForm) {
            theForm = document.form1;
        }
        function __doPostBack(eventTarget, eventArgument) {
            if (!theForm.onsubmit || (theForm.onsubmit() != false)) {
                theForm.__EVENTTARGET.value = eventTarget;
                theForm.__EVENTARGUMENT.value = eventArgument;
                theForm.submit();
            }
        }
        //]]>
    </script>



    <div>
        <!--startprint-->
        <table  align="center">
            <tr>
                <td class="style4">
                    <p style="text-align:center; font-size: 18px; font-weight: bold;width:700px;margin:0 auto;padding-top:30px">家庭经济困难学生认定申请表</p>
                </td>
            </tr>
        </table>
        <table  align="center">
            <tr>
                <td align="left">
                    学校：<span id="xuexiao">贵州工程应用技术学院</span></td>
                <td height="44" align="left">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    院系：<span id="院系">信息学院</span></td>
                <td height="44" align="left">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    专业：<span id="zhuanye">计算机</span></td>
                <td height="44" align="left">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    年级：<span id="nianji">2016级</span></td>
                <td height="44" align="left">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    班级：<span id="banji">3班</span></td>
            </tr>
        </table>
        <table width="700" border="1" align="center" cellpadding="0" cellspacing="0">
            <tbody>

            <tr>
                <td width="71" rowspan="6" align="center">
                    <p style="font-weight: 600">学</p>
                    <p style="font-weight: 600">生</p>
                    <p style="font-weight: 600">基</p>
                    <p style="font-weight: 600">本</p>
                    <p style="font-weight: 600">情</p>
                    <p style="font-weight: 600">况</p>
                </td>
                <td width="56" height="21px" align="center">姓名</td>
                <td colspan="1" align="center"><span id="name">${user.name}</span></td>
                <td width="58" align="center">性别</td>
                <td width="65" align="center"><span id="xb"><c:if test="${user.gender}">男</c:if><c:if test="${!user.gender}">女</c:if></span></td>
                <td width="75" align="center">出生年月</td>
                <td align="center">
                    <span id="csny">${user.idCardNum.substring(6,14)}</span>
                </td>
                <td width="66" align="center">民族</td>
                <td align="center" width="148"><span id="gj">${subInfo["nationality"]}</span></td>
            </tr>
            <tr>
                <td height="21px" align="center">身份证号码</td>
                <td colspan="3" align="center"><span id="sfzh">${user.idCardNum}</span></td>
                <td align="center">政治面貌</td>
                <td align="center"><span id="zzmm"><c:choose><c:when test='${subInfo["politicalStatus"] eq "0"}'>群众</c:when><c:when test='${subInfo["politicalStatus"] eq "1"}'>共产党员</c:when><c:when test='${subInfo["politicalStatus"] eq "2"}'>共青团员</c:when><c:when test='${subInfo["politicalStatus"] eq "3"}'>其他民主党派</c:when></c:choose></span></td>
                <td align="center" width="73">入学前户口</td>
                <td colspan="2" align="left">
                    <span >${subInfo["beforeResidency"]}</span>
                </td>
            </tr>
            <tr>
                <td height="21px" align="center">毕业学校</td>
                <td colspan="3" align="center"><span id="school">${subInfo["graduatedSchool"]}</span></td>
                <td colspan="2" align="center">家庭人口数</td>
                <td colspan="2" align="center"><span id="jtrs">${subInfo["totalNumOfFamily"]}</span></td>
            </tr>
            <tr>
                <td height="21px" align="center">家庭类型</td>
                <td colspan="7" align="left">
                    <span disabled="disabled" style="display:inline-block;width:55px;">
                        <input id="type1" type="checkbox" name="type1" disabled="disabled" />孤儿</span>
                    <span disabled="disabled" style="display:inline-block;border-style:None;width:55px;">
                        <input id="type2" type="checkbox" name="type2" disabled="disabled" />单亲</span>
                    <span disabled="disabled" style="display:inline-block;border-style:None;width:55px;">
                        <input id="type3" type="checkbox" name="type3" disabled="disabled" />残疾</span>
                    <span disabled="disabled" style="display:inline-block;border-style:None;width:165px;">
                        <input id="type4" type="checkbox" name="type4" disabled="disabled" />烈士或优抚对象子女</span>
                    <span disabled="disabled" style="display:inline-block;border-style:None;width:100px;">
                        <input id="type5" type="checkbox" name="type5" disabled="disabled" />低保家庭</span>
                    <span disabled="disabled" style="display:inline-block;border-style:None;width:135px;">
                        <input id="type6" type="checkbox" name="type6" disabled="disabled" />建档立卡贫困户</span>
                    <span disabled="disabled" style="display:inline-block;border-style:None;width:55px;">
                        <input id="type7" type="checkbox" name="type7" disabled="disabled" />其他</span>
                </td>
            </tr>
            <tr>
                <td height="21px" align="center">家庭通讯地址</td>
                <td colspan="7" align="left">
                    <span id="address">${subInfo["inputAdd"]}</span>
                </td>
            </tr>
            <tr>
                <td height="21px" align="center">邮政编码</td>
                <td colspan="2" align="center">
                    <span id="post">${subInfo["inputPost"]}</span>
                </td>
                <td align="center" colspan="2">家长联系方式</td>
                <td colspan="3" align="center">
                    <span id="phone">${subInfo["inputTel2"]}</span>
                </td>
            </tr>



            <tr>
                <td height="150px" align="center" style="font-weight: 600" rowspan="3">
                    <p>家</p>
                    <p>庭</p>
                    <p>成</p>
                    <p>员</p>
                    <p>情</p>
                    <p>况</p>
                </td>
                <td width="75" height="21px" align="center">姓名</td>
                <td width="58" align="center">年龄</td>
                <%--<td width="75" align="center">与学生关系</td>--%>
                <td align="center" colspan="2">工作（学习）单位</td>
                <td width="66" align="center">职业</td>
                <td width="66" align="center">年收入（元）</td>
                <td width="38" align="center">健康状况</td>
            </tr>
            <c:forEach items="${memberList}" var="member">
            <tr>
                <td colspan="1" align="center">
                    <span id="pname1">${member.name}</span>
                </td>
                <td width="65" align="center">
                    <span id="nl1">${member.age}</span>
                </td>
               <%-- <td align="center">
                    <span id="guanxi1">父子</span>
                </td>--%>
                <td align="center" colspan="2">
                    <span id="danwei1">${member.employer}</span>
                </td>
                <td align="center" width="148">
                    <span id="zhiye1">${member.product}</span>
                </td>
                <td align="center" width="148">
                    <span id="shouru1">${member.yearIncome}</span>
                </td>
                <td align="center" width="148">
                    <span id="jkzk1">${member.healthStatus}</span>
                </td>
            </tr>
            </c:forEach>
            <%--<tr>
                <td colspan="1" align="center">
                    <span id="pname2">王远洋</span>
                </td>
                <td width="65" align="center">
                    <span id="nl2">50</span>
                </td>
                <td align="center">
                    <span id="guanxi2">父子</span>
                </td>
                <td align="center" colspan="2">
                    <span id="danwei2">贵州省贵阳市清纺厂</span>
                </td>
                <td align="center" width="148">
                    <span id="zhiye2">工人</span>
                </td>
                <td align="center" width="148">
                    <span id="shouru2">30000</span>
                </td>
                <td align="center" width="148">
                    <span id="jkzk2">健康</span>
                </td>
            </tr>--%>

            <tr>
                <td height="150px" align="center" style="font-weight: 600" rowspan="5">
                    <p>家</p>
                    <p>庭</p>
                    <p>有</p>
                    <p>关</p>
                    <p>信</p>
                    <p>息</p>
                </td>
                <td colspan="2" align="center"  height="30px" style="height:30px">家庭人均月收入</td>
                <td colspan="2" align="center"><span id="shouru">${subInfo["inputIncome"]}</span>元</td>
                <td colspan="2" align="center">学生本学年已获资助情况</td>
                <td colspan="2" align="center">&nbsp;<span id="zizhu">${subInfo["subSidize"]}</span></td>
            </tr>

            <tr>
                <td  colspan="2" align="center"  height="30px" style="height:30px">家庭遭受突发意外事件</td>
                <td colspan="6" align="left">&nbsp; <span id="tfyw">${subInfo["inputAccident"]}</span> </td>
            </tr>
            <tr>
                <td  colspan="2" align="center"  height="30px" style="height:30px">家庭成员失业情况</td>
                <td colspan="6" align="left">&nbsp; <span id="sy">${subInfo["inputUnemployment"]}</span></td>
            </tr>
            <tr>
                <td  colspan="2" align="center"  height="30px" style="height:30px">家庭欠债情况</td>
                <td colspan="6" align="left">&nbsp; <span id="qz">${subInfo["inputDebt"]}</span></td>
            </tr>
            <tr>
                <td  colspan="2" align="center"  height="30px" style="height:30px">其他情况</td>
                <td colspan="6" align="left">&nbsp; <span id="qt">${subInfo["inputElse"]}</span></td>
            </tr>

            <tr>
                <td height="50px" align="center" colspan="9">
                    <p style="font-weight: 600" >本人承诺以上所填内容真实无误，并予以认可，如不真实，本人愿意承担相应后果。</p>
                    <p style="text-align:right">&nbsp;学生本人签名：<span id="name1">${user.name}</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;学生家长或监护人签名：<span id="name2">${memberList[0].name}</span>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;<span id="time1">2018年4月10日</span>
                        &nbsp;&nbsp;&nbsp; &nbsp; </p>
                </td>
            </tr>

            <tr>
                <td height="50px" align="center" style="font-weight: 600" colspan="2">
                    <p>学生家庭所在地乡镇或街道民政部门确认签章</p>
                </td>
                <td align="center" colspan="7">
                    <p style="text-align:left">&nbsp;&nbsp;&nbsp;经办人签字：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;单位名称：&nbsp;&nbsp;&nbsp;（加盖公章）</p>
                    <p style="text-align:left">&nbsp;&nbsp;&nbsp;联系电话：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日期：&nbsp;&nbsp;&nbsp;</p>
                </td>
            </tr>


            <tr>
                <td height="150px" align="center" style="font-weight: 600" ><p>学生</p>
                    <p>陈述</p>
                    <p>申请</p>
                    <p>认定</p>
                    <p>理由</p></td>
                <td colspan="9" align="left" valign="top"><table width="100%">
                    <tbody>
                    <tr>
                        <td height="354"><p style="height:300px;padding-top:5px;padding-left:5px;font-siz:8pt">
                            <span id="chenshu" style="font-size:11pt;">${subInfo["inputStatement"]}</span>
                        </p>

                            <p style="text-align:right">&nbsp;学生签字 ：<span id="name0">${user.name}</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;<span id="addtime">2018年4月10日</span>
                                &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </p></td>
                    </tr>
                    <tr>
                        <td> 注:可另附详细情况说明</td>
                    </tr>
                    </tbody>
                </table></td>
            </tr>
            <tr>
                <td rowspan="4" align="center"><p>民</p>
                    <p>主</p>
                    <p>评</p>
                    <p>议</p></td>
                <td rowspan="4" align="center"><p>推</p>
                    <p>荐</p>
                    <p>档</p>
                    <p>次</p></td>
                <td height="36px" align="center">&nbsp;
                </td>
                <td colspan="2" align="left">A.家庭经济一般困难<span disabled="disabled" style="display:inline-block;width:50px;"><input id="td1" type="checkbox" name="td1" <c:if test="${otherInfo.checkStatus == '6'}"> checked="checked"</c:if> disabled="disabled" /></span>
                </td>
                <td rowspan="4" align="center"><p>陈</p>
                    <p>述</p>
                    <p>理</p>
                    <p>由</p></td>
                <td colspan="4" rowspan="4" align="left" valign="top"><table width="100%">
                    <tbody>
                    <tr style="height:120px">
                        <td valign="top" style="padding-left:5px;padding-top:5px">
                            <span id="t1_note"></span>
                        </td>
                    </tr>
                    <tr>
                        <td >评议小组组长签字:<span id="t1_name">&nbsp;&nbsp;余丹</span>
                        </td>
                    </tr>
                    <tr>
                        <td align="right"><span id="t1_time">2018年6月12日</span>
                             &nbsp;</td>
                    </tr>
                    </tbody>
                </table></td>
            </tr>
            <tr>
                <td height="39px" align="center">&nbsp;
                </td>
                <td colspan="2" align="left">B.家庭经济困难<span disabled="disabled" style="display:inline-block;border-style:None;width:50px;"><input id="td2" type="checkbox" name="td2" <c:if test="${otherInfo.checkStatus == '7'}"> checked="checked"</c:if> disabled="disabled" /></span>
                </td>
            </tr>
            <tr>
                <td height="38px" align="center">&nbsp;
                </td>
                <td colspan="2" align="left">C.家庭经济特殊困难<span disabled="disabled" style="display:inline-block;border-style:None;width:50px;"><input id="td3" type="checkbox" name="td3" <c:if test="${otherInfo.checkStatus == '8'}"> checked="checked"</c:if> disabled="disabled" /></span>
                </td>
            </tr>
            <tr>
                <td height="40px" align="center">&nbsp;
                </td>
                <td colspan="2" align="left">D.家庭经济不困难<span disabled="disabled" style="display:inline-block;border-style:None;width:50px;"><input id="td4" type="checkbox" name="td4" <c:if test="${otherInfo.checkStatus == '5'}"> checked="checked"</c:if> disabled="disabled" /></span>
                </td>
            </tr>
            <tr>
                <td height="213px" align="center"><p>认</p>
                    <p>定</p>
                    <p>决</p>
                    <p>定</p></td>
                <td align="center"><p>院</p>
                    <p>(系)</p>
                    <p>意</p>
                    <p>见</p></td>
                <td colspan="4" align="left" valign="top"><div>
                    <p>经评议小组推荐、本院（系）认真审核后，</p>
                    <p>
                        <span disabled="disabled"><input id="t2_c1" type="checkbox" name="t2_c1" checked="checked" disabled="disabled" /></span>
                        同意评议小组意见。</p>
                    <p>
                        <span disabled="disabled"><input id="t2_c2" type="checkbox" name="t2_c2" disabled="disabled" /></span>
                        不同意评议小组意见。</p>
                    <p>调整为：<u><span id="t2_tateid"></span></u>
                    </p>
                    <p>工作组组长签字：<span id="t2_name">林菁</span>
                    </p>
                </div>
                    <div style="text-align:right">
                        <span id="t2_time">2018年6月22日</span>
                    </div></td>
                <td align="center" valign="middle"><p>学校</p>
                    <p>学生</p>
                    <p>资助</p>
                    <p>管理</p>
                    <p>机构</p>
                    <p>意见</p></td>
                <td colspan="3" align="left">
                    <div>
                        <p>经学生所在院（系）提请，本机构认真核实，</p>
                        <p>
                            <span disabled="disabled"><input id="t3_c1" type="checkbox" name="t3_c1" checked="checked" disabled="disabled" /></span>
                            同意工作组和评议小组意见。</p>
                        <p>
                            <span disabled="disabled"><input id="t3_c2" type="checkbox" name="t3_c2" disabled="disabled" /></span>
                            不同意工作组和评议小组意见。</p>
                        <p>调整为：<u><span id="t3_tateid"></span></u>
                        </p>
                        <p>负责人签字：<span id="t3_name">陈朝祥</span>
                        </p>
                    </div>
                    <div style="text-align:right">
                        <span id="t3_time">2018年7月23日</span>
                    </div></td>
            </tr>
            </tbody>
        </table>
        <!--endprint-->
        <br />
    </div>

    <div id="words" style="text-align:center">
        <input type="button" name="save"  value=" 保存成word文档 " style="cursor: pointer" onclick="word();return false;" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="button" name="ButRefresh"  value=" 刷 新 " style="cursor: pointer"
               onclick="window.location=window.location;"  title="刷新"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="button" name="ButClose" value=" 打  印 " onClick="doPrint();" />&nbsp; <br />
    </div>
    <a id="LinkButton2" href="javascript:__doPostBack('LinkButton2','')" style="display:none">ii</a>

</form>
</body>
</html>
