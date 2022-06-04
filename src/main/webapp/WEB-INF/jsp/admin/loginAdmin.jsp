
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>

<head>
    <title>风车出行后台</title>
    <link href="${pageContext.request.contextPath}/css/login.css" rel="stylesheet" />
    <script type="application/x-javascript">
        addEventListener("load", function() {
            setTimeout(hideURLbar, 0);
        }, false);

        function hideURLbar() {
            window.scrollTo(0, 1);
        }
    </script>
</head>

<body>
<div class="container w3">
    <h2>风车租赁后台管理系统</h2>
    <form action="${pageContext.request.contextPath}/userLogin" method="post">
        <div class="username" style="width: 380px;">
            <span class="username" style="height:19px">用户:</span>
            <input type="text" name="username" class="name" placeholder="请输入账号" required>
            <div class="clear"></div>
        </div>
        <div class="password-agileits" style="width: 380px;">
            <span class="username" style="height:19px">密码:</span>
            <input type="password" name="password" class="password" placeholder="请输入密码" required>
            <div class="clear"></div>
        </div>

        <div class="code" style="width: 380px;margin-top: 20px;">
            <span class="code" style="height:19px;">图片验证码:</span>
            <input type="text" name="password" class="code" style="width: 110px" placeholder="请输入验证码" required>
            <img src="${pageContext.request.contextPath}/passcode" onclick="this.src='passcode?'+Math.random();" style="height: 40px;width:110px;margin-left:20px;float: left;">
            <div class="clear"></div>
        </div>

        <div class="rem-for-agile">
            <input type="checkbox" name="remember" class="remember">记得我
            <br>
            <a href="#">忘记了密码</a><br>
        </div>
        <div class="login-w3">
            <input type="submit" class="login" value="Login">
        </div>
        <h3 style="color: white;position: absolute;left: 570px;margin-top:60px;">${error}</h3>
        <div class="clear"></div>
    </form>
</div>
<div class="footer-w3l">
    <p>风车后台登录系统</p><br/>
    <p><a href="${pageContext.request.contextPath}/login.jsp">风车</a></p>
</div>
</body>

</html>