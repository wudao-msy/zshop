<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>全国大学英语四、六级考试报名网</title>
    <link href="${pageContext.request.contextPath}/css/ufo3.css?v=5.0" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/css/lanrenzhijia.css" type="text/css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/css/fudong.css" rel="stylesheet" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
</head>


<body>

<jsp:include page="top.jsp"/>
    
<div id="main" class="" style="color: black; font-size: 14px; ">

    <div style="margin-right: 5%; margin-left: 5%;">
        <table width="80%" cellpadding="1" cellspacing="0" align="center" style="border: 1px solid #FFFFFF;
            margin-right: 10%; margin-left: 10%; height: 50px;">
            <tr style="border: 1px solid #FFFFFF; height: 50px;">
                <td colspan="7" style="border: 1px solid #FFFFFF; line-height: 2em;">
                    <p align="center" style="color: #212963; font-size: 24px; font-weight: bolder; border-bottom: 1px solid #d580be;
                        padding-bottom: 13px;">
                        考生须知
                    </p>
                </td>
            </tr>
        </table>
        <br />
        <div align="center" style="font-size: 16px; text-decoration: underline; line-height: 2em;">
            <br />
            <br />
            <br />

            <c:forEach items="${pdf0s}" var="pdf" >
                <p>
                    <a href="${pdf.path}">${pdf.name}</a>
                </p>
                <br />
            </c:forEach>

            
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
        </div>
    </div>

    <div style="clear:both"></div>
</div>
    <div style="clear:both;"></div>
    <div style="width:100% ;margin:2em 0;">
        <div id="footer">
            <div id="">
                <p>
                    <span class="footer_title">COPYRIGHT 中华人民共和国教育部考试中心 All RIGHTS RESERVED</span><br />
                    京ICP备05031027号 (Powered by :84112845)<br /><font color="red">建议浏览器：火狐浏览器、谷歌浏览器、IE9+、360浏览器（选择极速模式）</font><br />
                </p>
            </div>
        </div>
    </div>
</body>
</html>