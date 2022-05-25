<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Fh
  Date: 2022/4/30
  Time: 1:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="header">
    <div class="header-box">
        <a href="https://www.1hai.cn" class="top-logo"></a>
        <div class="top-banner">
            <div class="login-box ">
                <c:choose>
                    <c:when test="${not empty sessionScope.user && !(sessionScope.user eq null)}">
                        <span class="userShow">
                    <p>您好,</p><a href="/user/usercenter" class="userShowInfo">${sessionScope.user.name}</a>
                            <p class="ulogout" style="cursor: pointer;">| 注销账号</p>
                </span>

                    </c:when>
                    <c:otherwise>
                            <span id="spanLogin">
                        <a id="Login" class="pp-login">登录</a>
                        <span>|</span>
                        <a id="Register" class="pp-login">免费注册</a>
                    </span>
                    </c:otherwise>
                </c:choose>
                <span>|</span>

            </div>

            <div class="top-menu-box">
                <a href="/usercenter" target="_blank" title="我的风车">
                    我的风车
                </a>
                <span>|</span>
                <a href="/admin/ad" target="_blank" title="帮助中心">
                    帮助中心
                </a>
                <span>|</span>

                <span class="contact-us">400-888-6608 </span>
                <div class="contact-popup" style="display: none;">
                    <div class="space-hack">
                    </div>
                    港澳台及海外电话 <em>+86-511-81886608</em>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="clear_fix"></div>
<div class="bg110"></div>
<div class="loginpop" style="display: none;">
    <div class="login-page">
        <div class="form fr1">
            <h style="color: #499c9f; margin-bottom: 30px;font-size: 20px">风车租赁</h>
            <br><br>
            <div class="shiftlogin" style="display: none">
                <input type="text" id="account" name="account" placeholder="账号" />
                <span id="error1" style="float: left;margin-bottom: 10px"></span>
                <input type="password" id="regpassword" name="password" placeholder="密码" />
                <input type="text" id="phone" name="phone" placeholder="电话" maxlength="13" />
                <input type="text" id="e-mail" name="email" placeholder="邮箱" />
                <input type="text" id="con-email" style="width: 50%" placeholder="邮箱验证码" />
                <input type="button" style="width: 50%;float: right;background-color: #6fc2af" value="获取验证码"
                       onclick="get()" />
                <span id="error" style="float: left;margin-bottom: 10px"></span>
                <button type="submit" id="">注册</button>
                <p class="messagegg">已经注册点击 <a href="#">登录</a></p>
            </div>
            <div class="shiftlogin">
                <input type="text" id="username" placeholder="用户名/手机号/邮箱" />
                <input type="password" id="password" placeholder="密码" />
                <a><button id="loginbtns">登录</button></a>
                <p class="messagegg">没有账号? <a href="#">立即注册</a></p>
            </div>


        </div>
    </div>
    <!-- 关闭按钮 -->
    <span id="close" class="loginclose">&times;</span>
</div>
<script type="text/javascript">
    var jump = function(){
        // location.href="/shop";
        //刷新页面
        location.replace(location.href);
        //刷新返回前一个页面
        // location.replace(document.referrer);
    };
    $(".Ulogout").on('click',function () {
        $.ajax({
            type:"POST",
            url:"/user/logout",
            data:{},
            success:function(data){
                if (data.result == 'logout'){
                    layer.msg("注销成功");
                    setTimeout(jump(),2000);
                }
            }
        });
    });

    //登录时ajax验证
    $("#loginbtns").on('click',function () {
        var uname = document.getElementById('username').value;
        var pwd = document.getElementById('password').value;
        //去除空格;
        var unames = uname.replace(/(^\s*)|(\s*$)/g, '');
        var pwds = pwd.replace(/(^\s*)|(\s*$)/g, '');
        var fg = 0;
        if(unames === '' || unames === undefined || unames === null){
            layer.msg("账号为空");
            fg = 1;
        }else if(pwds === '' || pwds === undefined || pwds === null){
            layer.msg("密码为空");
            fg = 1;
        }
        console.log(fg);
        if(fg === 0){
            $.ajax({
                type:"POST",
                url:"/user/login",
                data:{'username':uname,'password':pwd},
                success:function(data){
                    if (data.result == 'oks'){
                        layer.msg("登录成功");
                        setTimeout(jump(),2000);
                    }else if(data.result == 'noPhone'){
                        layer.msg("手机号或密码错误");
                    }else if(data.result == 'noEmail'){
                        layer.msg("邮箱或密码错误");
                    }else if(data.result == 'noUsername'){
                        layer.msg("用户名或密码错误");
                    }else{
                        layer.msg("信息异常");
                    }
                }
            });
        }else{
            layer.msg("账户或密码为空");
        }
    });
</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/statics/script/utilMy.js"></script>
