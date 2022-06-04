<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="header">
    <div class="header-box">
        <a href="/a" class="top-logo"></a>
        <div class="top-banner">
            <div class="login-box ">
                <c:choose>
                    <c:when test="${not empty sessionScope.user && !(sessionScope.user eq null)}">
                        <span class="userShow">
                    <p>您好,</p><a href="/user/usercenters/${sessionScope.user.id}" class="userShowInfo">${sessionScope.user.phone}</a>
                            <p class="ulogout" style="cursor: pointer;">| 注销账号</p>
                    </span>
                    </c:when>
                    <c:otherwise>
                        <span id="spanLogin">
                            <a id="Login" class="pp-login">登录</a>
                        </span>
                    </c:otherwise>
                </c:choose>
                <span>|</span>
            </div>
            <div class="top-menu-box">
                    <c:choose>
                        <c:when test="${not empty sessionScope.user && !(sessionScope.user eq null)}">
                            <a class="usercenter" target="_blank" title="我的风车2" style="cursor: pointer">
                                我的风车
                            </a>
                        </c:when>
                        <c:otherwise>
                            <a class="nologin" target="_blank" title="我的风车" style="cursor: pointer">
                                我的风车
                            </a>
                        </c:otherwise>
                    </c:choose>
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

    <%--var uids = '${sessionScope.user.id}';--%>

    $('.usercenter').click(function () {
        location.href = '/user/usercenters/'+'${sessionScope.user.id}';
    });

    $(".nologin").click(function () {
        layer.alert('您还未登录！', {title:'error',icon: 4},function (index) {
            $(".bg110").show();
            $(".loginpop").toggle();
            layer.close(index);
        });
    });

    var href = location.href;
    console.log(href);
    function junmp() {
        location.replace(location.href);
    }
    function validateTip(element,status){
        element.prev().attr("validateStatus",status);
    }

</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/statics/script/utilMy.js"></script>
