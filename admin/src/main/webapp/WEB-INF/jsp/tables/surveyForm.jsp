<%--
  Created by IntelliJ IDEA.
  User: lulu
  Date: 2019-05-15
  Time: 19:05
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
        学生资助调查表
    </title>

    <style type="text/css">
        html,
        body {

            margin:0;
            padding:0;
        }
        .style1
        {
            width: 700px;
            height:30px;
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
    <script language=javascript>

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
<form name="form1" method="post" action="Export.aspx?id=130844" id="form1">
    <div>
        <input type="hidden" name="__EVENTTARGET" id="__EVENTTARGET" value="" />
        <input type="hidden" name="__EVENTARGUMENT" id="__EVENTARGUMENT" value="" />
        <input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="/wEPDwUKLTc4NDQzNzkyOA9kFgICAw9kFjACAQ8PFgIeBFRleHQFDOavleiKguWtpumZomRkAgMPDxYCHwAFG+S/oeaBr+W3peeoi+WtpumZoiAgICAgICAgIGRkAgUPDxYCHwAFDOi9r+S7tuW3peeoi2RkAgcPDxYCHwAFCjIwMTYgICAgICBkZAIJDw8WAh8ABQnnjovkvLzotoVkZAILDw8WAh8ABQPnlLdkZAINDw8WAh8ABQgxOTk4MDQxOWRkAg8PDxYCHwAFBuaxieaXj2RkAhEPDxYCHwAFEjUyMDExMzE5OTgwNDE5MTIxMGRkAhMPDxYCHwAFDOWFsemdkuWbouWRmGRkAhUPDxYCHwAFEui0teW3nuecgea4hemVh+W4gmRkAhcPDxYCHwAFATNkZAIZDw8WAh8ABRXmuIXplYfluILnrKzkuIDkuK3lraZkZAIjDw8WAh8ABSTotLXlt57nnIHmuIXplYfluILlvJjkuJrnlJ/mtLvkuozljLpkZAIlDw8WAh8ABQY1NTE0MDBkZAInDw8WAh8ABQsxMzYzOTEwODA5N2RkAikPFgIeC18hSXRlbUNvdW50AgIWBGYPZBYCZg8VCAnnjovov5zmtIsCNDgG54i25a2QBuaaguaXoAbmmoLml6AENDU2MAblgaXlurcb5q2j5bi477yI5ZCr6YeN57uE5a625bqt77yJZAIBD2QWAmYPFQgJ546L5rGd6IuxAjQ3BuavjeWtkAbmmoLml6AG5pqC5pegBDQ1NjAG5YGl5bq3G+ato+W4uO+8iOWQq+mHjee7hOWutuW6re+8iWQCKw8PFgIfAAUDMjUzZGQCLQ8PFgIfAAUG5pqC5pegZGQCNQ8PFgIfAAUz54i25q+N5aSx5Lia77yM5pqC5peg5bel5L2c77yM6Z2g5LiL5bKX5bel6LWE55Sf5rS7ZGQCOw8PFgIfAAUw6LS15bee55yB5riF6ZWH5biC5byY5Lia57q657uH5Y2w5p+T5pyJ6ZmQ5YWs5Y+4ZGQCPQ8PFgIfAAUGNTUxNDAwZGQCPw8PFgIfAAULMTM4ODUwMTc2OTVkZAJBDxYCHgdWaXNpYmxlaGQYAQUeX19Db250cm9sc1JlcXVpcmVQb3N0QmFja0tleV9fFgMFAmdjBQJkcQUEbHN6bhzSO2tGpsvPgpGqXi8LpLdN4HD9" />
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


    <!--startprint-->
    <table width="700px"  border="1" align="center" cellpadding="0" cellspacing="0" id="content" style="font-family:'宋体';font-size:12px;width:700px">
        <tr>
            <td colspan="9" align="center" style="font-size:20px;font-weight:bold;border:0px;height:80px"  height="80px">贵州省高等学校学生及家庭情况调查表
            </td>
        </tr>
        <tr>
            <td colspan="9" align="center" style="padding-left:50px;height:35px" border="0"  height="35px">学校：&nbsp;<span id="xuexiao">毕节学院</span>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 院（系）：&nbsp;<span id="yuanxi">信息工程学院         </span>
                &nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 专业：&nbsp;<span id="zhuanye">软件工程</span>
                &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; 年级：&nbsp;<span id="nianji">2016      </span></td>
        </tr>
        <tr>
            <td width="83" rowspan="4" align="center" style="width:83px" >学生本人基本情况</td>
            <td width="91" align="center" height="30px" style="height:30px">姓名</td>
            <td width="131" align="center">
                <span id="name">${user.name}</span>
            </td>
            <td width="44" align="center">性别</td>
            <td width="71" align="center">
                <span id="xb">
                    <c:if test="${user.gender}">男</c:if>
                    <c:if test="${!user.gender}">女</c:if>
                </span>
            </td>
            <td width="53" align="center">出生年月日</td>
            <td width="73" align="center">
                <span id="csnyr">${user.idCardNum.substring(6,14)}</span>
            </td>
            <td width="49" align="center">民族</td>
            <td width="85" align="center">
                <span id="mz">${subInfo["nationality"]}</span>
            </td>
        </tr>
        <tr>
            <td align="center"  height="30px" style="height:30px">身份证号</td>
            <td colspan="2" align="center">
                <span id="sfzh">${user.idCardNum}</span>
            </td>
            <td align="center">政治面貌</td>
            <td colspan="2" align="center">
                <span id="zzmm"><c:choose><c:when test='${subInfo["politicalStatus"] eq "0"}'>群众</c:when><c:when test='${subInfo["politicalStatus"] eq "1"}'>共产党员</c:when><c:when test='${subInfo["politicalStatus"] eq "2"}'>共青团员</c:when><c:when test='${subInfo["politicalStatus"] eq "3"}'>其他民主党派</c:when></c:choose></span>
            </td>
            <td align="center">入学前户口</td>
            <td align="center">
                <span id="rxqhk">${subInfo["beforeResidency"]}</span>
            </td>
        </tr>
        <tr>
            <td align="center"  height="30px" style="height:30px">家庭人数</td>
            <td colspan="2" align="center">
                <span id="jtrs">${subInfo["totalNumOfFamily"]}</span>
            </td>
            <td align="center">毕业学校</td>
            <td colspan="2" align="center">
                <span id="byxx">${subInfo["graduatedSchool"]}</span>
            </td>
            <td align="center">个人特长</td>
            <td align="center">
                <span id="grtc">${subInfo["specialty"]}</span>
            </td>
        </tr>
        <tr>
            <td align="center"  height="30px" style="height:30px">孤残</td>
            <td colspan="2" align="center">
                <input id="gc" type="checkbox" name="gc" /><label for="gc"> 是</label>
            </td>
            <td align="center">单亲</td>
            <td colspan="2" align="center">
                <input id="dq" type="checkbox" name="dq" /><label for="dq"> 是</label>
            </td>
            <td align="center">烈士子女</td>
            <td align="center">
                <input id="lszn" type="checkbox" name="lszn" /><label for="lszn"> 是</label>
            </td>
        </tr>
        <tr>
            <td rowspan="2" align="center" width="83" style="height:30px;width:83px;min-width:83px">家庭通讯</td>
            <td colspan="2" align="center"  height="30px" style="height:30px">详细通讯地址</td>
            <td colspan="6" align="left">
                &nbsp; <span id="address">${subInfo["inputAdd"]}</span>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center"  height="30px" style="height:30px">邮编号码</td>
            <td colspan="2" align="left">
                &nbsp; <span id="yzbm">${subInfo["inputPost"]}</span>
            </td>
            <td align="center">家长电话</td>
            <td colspan="3">
                &nbsp;<span id="tel">${subInfo["inputTel2"]}</span>
            </td>
        </tr>
        <tr>
            <td align="center">家庭成员</td>
            <td colspan="8" align="left" valign="top"><table width="100%"  border="1" align="center" cellpadding="0" cellspacing="0"  style="font-family:'宋体'; font-size:12px;height:100% ">
                <tr>
                    <td width="15%" height="31" align="center" style="height:30px">姓名</td>
                    <td width="10%" align="center">年龄</td>
                    <%--<td width="12%" align="center">与学生关系</td>--%>
                    <td width="12%" align="center">工作（学习）单位</td>
                    <td width="12%" align="center">职业</td>
                    <td width="12%" align="center">年收入（元）</td>
                    <td width="12%"align="center">健康情况</td>   <td width="12%" align="center">成员状态</td>
                </tr>

                <c:forEach items="${memberList}" var="member">
                <tr>
                    <td height="36" align="center" style="height:30px">${member.name}</td>
                    <td align="center">${member.age}</td>
                    <%--<td align="center">父子</td>--%>
                    <td align="center">${member.employer}</td>
                    <td align="center">${member.product}</td>
                    <td align="center">${member.yearIncome}</td>
                    <td align="center">${member.healthStatus}</td>
                    <td align="center">${member.memberStatus}</td>
                </tr>
                </c:forEach>

                <%--<tr>
                    <td height="36" align="center" style="height:30px">王汝英</td>
                    <td align="center">47</td>
                    <td align="center">母子</td>
                    <td align="center">暂无</td>
                    <td align="center">暂无</td>
                    <td align="center">4560</td>
                    <td align="center">健康</td>
                    <td align="center">正常（含重组家庭）</td>
                </tr>--%>

            </table>
            </td>
        </tr>
        <tr>
            <td rowspan="7" align="center">影响家庭经济状况有关信息</td>
            <td colspan="2" align="center"  height="30px" style="height:30px">家庭人均月收入</td>
            <td colspan="2" align="center"><span id="shouru">${subInfo["inputIncome"]}</span>元</td>
            <td colspan="2" align="center">学生本学年已获资助情况</td>
            <td colspan="2" align="center">&nbsp;<span id="zizhu">${subInfo["subSidize"]}</span></td>
        </tr>

        <tr>
            <td colspan="2" align="center"  height="30px" style="height:30px">家庭遭受自然灾害情况</td>
            <td colspan="6" align="left">&nbsp; <span id="zrzh">${subInfo["inputHazard"]}</span></td>
        </tr>
        <tr>
            <td  colspan="2" align="center"  height="30px" style="height:30px">家庭遭受突发意外事件</td>
            <td colspan="6" align="left">&nbsp; <span id="tfyw">${subInfo["inputAccident"]}</span> </td>
        </tr>
        <tr>
            <td  colspan="2" align="center"  height="30px" style="height:30px">家庭成员因残疾、年迈而劳动能力弱情况</td>
            <td colspan="6" align="left">&nbsp; <span id="sc">${subInfo["inputLabor"]}</span></td>
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
            <td rowspan="2" align="center" >民政  部门        信息</td>
            <td  colspan="2" align="center"  height="30px" style="height:30px">详细地址</td>
            <td colspan="6" align="left">&nbsp;<span id="dizhi">${subInfo["inputAdd2"]}</span></td>
        </tr>
        <tr>
            <td colspan="2" align="center"  height="30px" style="height:30px">邮政编码</td>
            <td colspan="2" align="center">&nbsp;<span id="youbian">${subInfo["inputPost2"]}</span></td>
            <td colspan="2" align="center">联系电话</td>
            <td colspan="2" align="center">&nbsp;<span id="dianhua">${subInfo["inputTel3"]}</span></td>
        </tr>


    </table>
    <br />
    <!--endprint-->

    <a id="LinkButton2" href="javascript:__doPostBack('LinkButton2','')" style="display:none">ii</a>
</form>
</body>
</html>

