<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<head>
    <title>风车出行后台</title>
    <link href="${pageContext.request.contextPath}/mgestyle/css/login.css" rel="stylesheet" />
<%--    <link rel="stylesheet" type="text/css" href="/statics/layui/css/layui.css">--%>
    <script type="text/javascript" src="/statics/layui/layui.js"></script>
    <script type="text/javascript" src="/statics/script/jquery-1.8.0.min.js"></script>
</head>

<body>
<div class="container w3">
    <h2>风车租赁后台管理系统</h2>
    <form action="${pageContext.request.contextPath}/login" method="post" id="formLogin">
        <div class="username" style="width: 380px;">
            <span class="username" style="height:19px">用户:</span>
            <input type="text" name="username" id="username-de" class="name" placeholder="请输入账号" required>
            <div class="clear"></div>
        </div>
        <div class="password-agileits" style="width: 380px;">
            <span class="username" style="height:19px">密码:</span>
            <input type="password" name="password" id="password-de" class="password" placeholder="请输入密码" required>
            <div class="clear"></div>
        </div>

        <div class="code" style="width: 380px;margin-top: 20px;">
            <span class="code" style="height:19px;">图片验证码:</span>
            <input type="text" name="verificationCode" id="verificationCode" class="code" style="width: 110px" placeholder="请输入验证码" required>
            <img src="${pageContext.request.contextPath}/admin/passcode" onclick="this.src='/admin/passcode?'+Math.random();" style="height: 40px;width:110px;margin-left:20px;float: left;">
            <div class="clear"></div>
        </div>

        <div class="rem-for-agile">
            <input type="checkbox" class="remember" name="remember-me" value="true">记得我
            <br>
            <a href="#">忘记了密码</a><br>
        </div>
        <div class="login-w3">
            <div id="login" class="login" >登录</div>
        </div>
        <h3 style="color: #ff5210;position: absolute;left: 540px;margin-top:60px;">${sessionScope.SPRING_SECURITY_LAST_EXCEPTION.message}</h3>
        <div class="clear"></div>
    </form>
</div>
<div class="footer-w3l">
    <p>风车后台登录系统</p><br/>
    <p><a href="${pageContext.request.contextPath}/a">风车</a></p>
</div>
</body>
<script>
    $('.login').click(function () {
        var codes = $('#verificationCode').val();
        var account =$('#username-de').val();
        var pwd =$('#password-de').val();
        if(account == ""){
            layer.msg("请输入账户名",{anim:6});
        }else if(pwd == ""){
            layer.msg("请输入密码",{anim:6});
        }else{
            $.ajax({
                type:"POST",
                url:"/admin/verifyCode",
                data:{code:codes},
                success:function (data) {
                    if(data.result === "0"){
                        layer.msg("验证码不一致",{anim:6});
                    }else if(data.result === "1"){
                        // layer.msg("通过",{anim:0});
                        $('#formLogin').submit();
                    }else{
                        layer.msg("验证码异常",{anim:6});
                    }
                }
            });
        }

    });
</script>
</html>