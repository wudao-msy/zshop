<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>我的订单</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
</head>

<body>
<% request.setAttribute("index",1);%>
<jsp:include page="top.jsp"/>

<!-- content start -->
<div class="container">
    <div class="row">
        <div class="col-xs-12">
            <div class="page-header" style="margin-bottom: 0px;">
                <h3>我的订单</h3>
            </div>
        </div>
    </div>
    <table class="table table-hover   orderDetail">
        <tr>
            <td colspan="5">
                <span>订单编号：<a href="orderDetail.html">4722456552315</a></span>
                <span>成交时间：2017-01-01  11:58:49</span>
            </td>
        </tr>
        <tr>
            <td><img src="${pageContext.request.contextPath}/images/shop1.jpg" alt=""></td>
            <td class="order-content">
                <p>
                    秋冬韩版轮廓型宽松连帽套头学生百搭毛呢卫衣+休闲裤两件套装
                </p>
                <p>颜色：单件粉色上衣</p>
                <p>尺码：s</p>
            </td>
            <td>
                ￥180.00
            </td>
            <td>
                2
            </td>
            <td class="text-color">
                ￥360.00
            </td>
        </tr>
        <tr>
            <td><img src="${pageContext.request.contextPath}/images/shop2.jpg" alt=""></td>
            <td class="order-content">
                <p>
                    秋冬韩版轮廓型宽松连帽套头学生百搭毛呢卫衣+休闲裤两件套装
                </p>
                <p>颜色：单件粉色上衣</p>
                <p>尺码：s</p>
            </td>
            <td>
                ￥60.00
            </td>
            <td>
                2
            </td>
            <td class="text-color">
                ￥60.00
            </td>
        </tr>
        <tr>
            <td colspan="5">
                <span class="pull-right"><button class="btn btn-danger">删除订单</button></span>
                <span class="">总计:<span class="text-color">￥420.00</span></span>
            </td>
        </tr>
        <tr>
            <td colspan="5">
                <span>订单编号：<a href="orderDetail.html">4722456552315</a></span>
                <span>成交时间：2017-01-01  11:58:49</span>
            </td>
        </tr>
        <tr>
            <td><img src="${pageContext.request.contextPath}/images/shop1.jpg" alt=""></td>
            <td class="order-content">
                <p>
                    秋冬韩版轮廓型宽松连帽套头学生百搭毛呢卫衣+休闲裤两件套装
                </p>
                <p>颜色：单件粉色上衣</p>
                <p>尺码：s</p>
            </td>
            <td>
                ￥180.00
            </td>
            <td>
                2
            </td>
            <td class="text-color">
                ￥360.00
            </td>
        </tr>
        <tr>
            <td><img src="${pageContext.request.contextPath}/images/shop2.jpg" alt=""></td>
            <td class="order-content">
                <p>
                    秋冬韩版轮廓型宽松连帽套头学生百搭毛呢卫衣+休闲裤两件套装
                </p>
                <p>颜色：单件粉色上衣</p>
                <p>尺码：s</p>
            </td>
            <td>
                ￥60.00
            </td>
            <td>
                2
            </td>
            <td class="text-color">
                ￥60.00
            </td>
        </tr>
        <tr>
            <td colspan="5">
                <span class="pull-right"><button class="btn btn-danger">删除订单</button></span>
                <span class="">总计:<span class="text-color">￥420.00</span></span>
            </td>
        </tr>
    </table>
</div>
<!-- content end-->
<!-- footers start -->
<div class="footers">
    版权所有：中兴软件技术
</div>
<!-- footers end -->

</body>

</html>
