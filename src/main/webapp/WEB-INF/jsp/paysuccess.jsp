<%--
  Created by IntelliJ IDEA.
  User: Fh
  Date: 2022/5/19
  Time: 15:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>支付页面</title>
    <link rel="stylesheet" type="text/css" href="/statics/css/loginstyle.css">
    <link rel="stylesheet" type="text/css" href="/statics/css/charge.css">
    <link rel="stylesheet" type="text/css" href="/statics/css/self.css">
    <script type="text/javascript" src="/statics/script/jquery-1.8.0.min.js"></script>
</head>
<body>
<%@ include file="common/header.jsp"%>
<div class="step2-progress-box" style="background: #23b7b7;">
    <div class="progress-percent"></div>
    <div class="progress-icon">
        <span class="progress-firsticon">1</span>
        <span class="progress-secondicon">2</span>
        <span class="progress-thirdicon" style="background:#23b7b7">3</span>
    </div>
    <div class="progress-text">
        <span class="progress-firsttext">挑选车型</span>
        <span class="progress-secondtext">填写与核对订单</span>
        <span class="progress-thirdtext" style="color:#23b7b7">成功提交</span>
    </div>
</div>
<div class="msgs">
    <div class="msg-img">
    </div>
    <div class="msgp">
        <p>订单提交成功！请您按时去门店取车</p>
        <em class="msgimg"></em>
        <span>查看您的<a href="/usercenter"> 订单</a></span>
    </div>
</div>
<%@ include file="common/footer.jsp"%>
</body>
</html>
