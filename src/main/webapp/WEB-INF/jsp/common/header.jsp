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
        <a href="/a" class="top-logo"></a>
        <div class="top-banner">
            <div class="login-box ">
                <c:choose>
                    <c:when test="${not empty sessionScope.user && !(sessionScope.user eq null)}">
                        <span class="userShow">
                    <p>您好,</p><a href="/user/usercenter" class="userShowInfo">${sessionScope.user.phone}</a>
                            <p class="ulogout" style="cursor: pointer;">| 注销账号</p>
                    </span>
                    </c:when>
                    <c:otherwise>
                        <span id="spanLogin">
                            <a id="Login" class="pp-login">登录</a>
<%--                        <span>|</span>--%>
<%--                        <a id="Register" class="pp-login">免费注册</a>--%>
                        </span>
                    </c:otherwise>
                </c:choose>
                <span>|</span>

            </div>

            <div class="top-menu-box">
                <a href="/user/usercenter" target="_blank" title="我的风车">
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
<%--                    signupform--%>
                    <input type="text" id="regaccount" name="account" placeholder="账号" />
                    <input type="password" id="regpassword" name="password" placeholder="密码" />
                    <input type="text" id="regphone" name="phone" placeholder="电话" maxlength="13" />
                    <input type="text" id="regemail" name="email" placeholder="邮箱" />
                    <input type="text" id="conemail" style="width: 50%" placeholder="邮箱验证码" />
                    <input type="button" style="width: 50%;float: right;background-color: #6fc2af" value="获取验证码" onclick="get()" />
                    <span id="error" style="float: left;margin-bottom: 10px"></span>
                    <button type="button" id="regbtn">注册</button>
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
    var href = location.href;
    console.log(href);
    function junmp() {

        location.replace(location.href);
    }
    function validateTip(element,status){
        element.prev().attr("validateStatus",status);
    }
    //注册
    $("#regbtn").on('click',function () {
        var regaccount = document.getElementById('regaccount').value;
        var regpassword = document.getElementById('regpassword').value;
        var regphone = document.getElementById('regphone').value;
        var regemail = document.getElementById('regemail').value;
        var conemail = document.getElementById('conemail').value;//验证码

        //去除空格;
        var regaccounts = regaccount.replace(/(^\s*)|(\s*$)/g, '');
        var pwds = regpassword.replace(/(^\s*)|(\s*$)/g, '');
        var regphones = regphone.replace(/(^\s*)|(\s*$)/g, '');
        var regemails = regemail.replace(/(^\s*)|(\s*$)/g, '');

        var reg1=/^[a-zA-Z_$]\w{3,9}$/;//用户名:至少4位到10位
        var reg2=/^\w{6,13}$/;//密码至少6位,最多10位。
        // var reg3=/^(1[6-9])|([2-9][0-9])$/;//16-99年龄必须16-99岁。
        var reg5 = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;
        var reg3=/^[a-zA-Z\d]{3,}\w*@([a-z]|\d)\w*\.[a-z]{3}(\.[a-z]{2})?$/;//邮箱验证
        var reg4=/^1\d{10}$/;//:以1开头，必须是11位致字

        if(regaccounts === '' || regaccounts === undefined || regaccounts === null){
            layer.msg("账号为空");
            return false;
        }
        if(!reg1.test(regaccounts)){
            layer.msg("用户名至少4位到10位以字母、下划线、$开头");
             return false;
        }
        if(pwds === '' || pwds === undefined || pwds === null){
            layer.msg("密码为空");
            return false;
        }
        if(!reg2.test(pwds)){
            layer.msg("密码至少6~14位");
            return false;
        }
        if(regphones === '' || regphones === undefined || regphones === null){
            layer.msg("手机号为空");
            return false;
        }
        if(!reg4.test(regphones)){
            layer.msg("手机格式不正确~");
            return false;
        }
        if(regemails === '' || regemails === undefined || regemails === null){
            layer.msg("邮箱为空");
            return false;
        }
        if(!reg5.test(regemails)){
            layer.msg("邮箱格式不合法~");
            return false;
        }
         $.ajax({
             type:"POST",
             url:"/user/register",
             data:{username:regaccount,password:regpassword,phone:regphone,email:regemail},
             success:function(data){
                 if (data.result === 'oks'){
                     layer.msg("注册成功，请重新登录");
                     console.log("注册成功，现在登录ok?");
                     location.replace(href);
                     // setTimeout(junmp,1000);
                 }else if(data.result === 'RepeatUserName'){
                     layer.msg("用户名已经被注册了~");
                     console.log("用户名已经被注册了");
                 }else if(data.result === 'RepeatNumber'){
                     layer.msg("手机号已经被注册了~");
                     console.log("手机号已经被注册了");
                 }else if(data.result === 'RepeatEmail'){
                     layer.msg("邮箱已经被注册了~");
                     console.log("邮箱已经被注册了");
                 }else{
                     layer.msg("信息异常");
                     console.log("信息异常");
                 }
             }
         });


    });
    //注销
    $(".Ulogout").on('click',function () {
        $.ajax({
            type:"POST",
            url:"/user/logout",
            data:{},
            success:function(data){
                if (data.result == 'logout'){
                    layer.msg("注销成功");
                    location.replace(href);
                }
            }
        });
    });



    //登录时 ajax验证
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
                        location.reload();
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
