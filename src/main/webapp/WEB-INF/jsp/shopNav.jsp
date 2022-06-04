<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>风车车</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" type="text/css" href="/statics/layui/css/layui.css">
    <script type="text/javascript" src="/statics/layui/layui.js"></script>
    <%@ include file="common/path.jsp"%>
</head>
<body>
<%@ include file="common/header.jsp"%>
<ul class="navmenu">
    <li><a href="/a">首页</a><span></span></li>
    <li><a href="/cars/shopsCar/1201">租车</a><span></span></li>
    <li><a href="/carList">车型查询</a><span></span></li>
    <li class="active"><a href="/shop">营业网点</a><span></span></li>
</ul>
<div class="clear_fix"></div>
<div class="crumbp">
    <a href="#">首页</a> <em>&gt;</em> <span>城市选择</span> </div>
<div class="clear_fix"></div>
<div class="mainbox">
    <div class="citylist">
        <div class="newtcity">
            城市选择
        </div>
        <div class="hotcity">
            <span>热门城市</span>
            <ul>
                <li><a href="/shopmap/5">北京</a></li>
                <li><a href="">上海</a></li>
                <li><a href="">深圳</a></li>
                <li><a href="">成都</a></li>
                <li><a href="">重庆</a></li>
                <li><a href="">海口</a></li>
                <li><a href="">盐城</a></li>
                <li><a href="">大理</a></li>
                <li><a href="">泸州</a></li>
                <li><a href="">理塘</a></li>
                <li><a href="">三亚</a></li>
                <li><a href="">哈尔滨</a></li>
                <li><a href="">三亚</a></li>
                <li><a href="">哈尔滨</a></li>
                <li><a href="">三亚</a></li>
                <li><a href="">哈尔滨</a></li>
            </ul>
        </div>
        <!-- 城市 -->
        <div class="citylistall">

                <c:forEach var="al" items="${letters}">
                    <div class="citylistss ">
                        <span>${al}</span>
                        <ul>
                            <c:forEach var="city" items="${cities}">
                                <c:if test="${city.letter == al}">
                                <li><a href="/shopByCity/${city.name}">${city.name}</a></li>
                            </c:if>

                            </c:forEach>
                        </ul>
                    </div>
                </c:forEach>

        </div>
    </div>

    <div class="citylist">
        <div class="newtcity">
            城市选车门店
        </div>

        <div class="citylistall">
            <div class="citylistss clear_fix1">
                <span>A</span>
                <ul>
                    <li>
                        <a href="/c_anshan/">鞍山租车</a></li>
                </ul>
            </div>
            <div class="citylistss clear_fix1">
                <span>B</span>
                <ul>
                    <li>
                        <a href="/c_beijing/">北京租车</a></li>
                    <li>
                        <a href="/c_baoding/">保定租车</a></li>
                    <li>
                        <a href="/c_baotou/">包头租车</a></li>
                    <li>
                        <a href="/c_baoji/">宝鸡租车</a></li>
                    <li>
                        <a href="/c_bengbu/">蚌埠租车</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>
<script type="javascript">

    <%--var array = [];--%>
    <%--<c:forEach items="${cities}" var="t">--%>
    <%--array.push(${t.name}); //js中可以使用此标签，将EL表达式中的值push到数组中--%>
    <%--array.push(${t.id});--%>
    <%--array.push(${t.letter});--%>
    <%--</c:forEach>--%>
    <%--console.log(1);--%>
    <%--console.log(array);--%>
</script>
<%@ include file="common/footer.jsp"%>
</body>
</html>
