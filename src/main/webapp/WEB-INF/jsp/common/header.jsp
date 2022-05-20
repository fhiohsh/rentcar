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
                    <span id="spanLogin">
                        <a id="Login" class="pp-login">登录</a>
                        <span>|</span>
                        <a id="Register" class="pp-login">免费注册</a>
                    </span>
                <span>|</span>
            </div>
            <div class="top-menu-box">
                <a href="/usercenter" target="_blank" title="我的风车">
                    我的风车
                </a>
                <span>|</span>
                <a href="" target="_blank" title="帮助中心">
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
            <h style="color: #499c9f; margin-bottom: 30px;font-size: 20px">风车出行</h>
            <br><br>
            <form class="register-form" action="${pageContext.request.contextPath}/signup" method="post">
                <input type="text" id="account" name="account" placeholder="账号" />
                <span id="error1" style="float: left;margin-bottom: 10px"></span>
                <input type="password" id="password" name="password" placeholder="密码" />
                <input type="text" id="phone" name="phone" placeholder="电话" maxlength="13" />
                <input type="text" id="e-mail" name="email" placeholder="邮箱" />
                <input type="text" id="con-email" style="width: 50%" placeholder="邮箱验证码" />
                <input type="button" style="width: 50%;float: right;background-color: #6fc2af" value="获取验证码"
                       onclick="get()" />
                <span id="error" style="float: left;margin-bottom: 10px"></span>
                <button type="submit" id="">注册</button>
                <p class="messagegg">已经注册点击 <a href="#">登录</a></p>
            </form>
            <form class="login-form" action="${pageContext.request.contextPath}/login" method="post">
                <input type="text" placeholder="用户名" />
                <input type="password" placeholder="密码" />
                <button>登录</button>
                <p class="messagegg">没有账号? <a href="#">立即注册</a></p>
            </form>
        </div>
    </div>
    <!-- 关闭按钮 -->
    <span id="close" class="loginclose">&times;</span>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/statics/script/utilMy.js"></script>
