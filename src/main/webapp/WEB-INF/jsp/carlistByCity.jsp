<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="/statics/css/base.css" />
    <link rel="stylesheet" type="text/css" href="/statics/css/home.css" />
    <link rel="stylesheet" type="text/css" href="/statics/city/city.css">
    <link rel="stylesheet" type="text/css" href="/statics/css/charge.css">
    <link rel="stylesheet" type="text/css" href="/statics/css/self.css">
    <link rel="stylesheet" type="text/css" href="/statics/css/hurst.css">
    <link rel="stylesheet" type="text/css" href="/statics/css/loginstyle.css">
    <script type="text/javascript" src="/statics/script/jquery-1.8.0.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/statics/script/city.js"></script>

</head>
<body>
<%@ include file="common/header.jsp"%>
<ul class="navmenu">
    <li><a href="/a">首页</a><span></span></li>
    <li><a href="">租车</a><span></span></li>
    <li class="active"><a href="/cars/pages/1">车型查询</a><span></span></li>
    <li><a href="/shop">营业网点</a><span></span></li>
    <li><a href="">个人中心</a><span></span></li>
</ul>
<div class="clear_fix"></div>
<div class="crumbp"> <a href="#">首页</a> <em>&gt;</em> <span>租车</span> </div>
<div class="mainbox">
    <div class="citychange citychange2">
        <%@ include file="common/cityopt.jsp"%>
        <div class="cityqu" style=" border: rgb(252, 243, 243) 1px solid;">
            <div class="newarea newarea2">
                <div class="searchbox searchbox2">
                    <form action="" class="bandcity">
                        <input type="text" id="search-band" placeholder="输入品牌或名字查询">
                        <a class="cfm" href="" title="确定">确定</a>
                    </form>

                </div>
            </div>
        </div>
        <span class="common-bg city-logo"></span>
    </div>
<%--    车辆品牌--%>
    <%@ include file="common/caropt.jsp"%>
    <div class="car-box" id="carlistbox">
        <%--  车车列表 --%>
            <div class="carwrap">
                <!-- 做个加载条 -->
                <div class="pageLoading" id="loadings" style="display: block;">
                    <p class="loadingbox">
                        <img src="https://booking.1hai.cn/Content/Images/Shared/loading.gif?v=77725ca3d3a84eb48103c13db6db5e28" alt="">
                        正在为您查询可租车型...
                    </p>
                </div>
                <c:if test="${empty pages.list}">
                    <div class="nocartip" id="nocartip" style="display: none">
                        <img src="https://booking.1hai.cn/Content/Images/Order/Step2/nocar.png?v=d2fb5f2aa0fe4134874c006eb28c20b5" alt="">
                        <div class="nocar-explain">
                            <p class="nocar-text1">抱歉，当前门店该时间段内车辆已经租满。</p>
                            <p class="nocar-text2">您可以重新选择其他门店。</p>
                        </div>
                    </div>
                </c:if>
                <!-- document.getElementById('show').style.display=='none' -->
            </div>
<%--            style="display: none"--%>
            <div id="carinfo" style="display: none">
                <c:forEach var="car" items="${pages.list}">
                    <a href="/cars/carShops/${citys.name}/${car.name}" class="car-list" target="_blank"  >
                        <div class="car-img"><img src="/statics/images/${car.img}" style="display:inline"></div>
                        <div class="car-des">
                            <span title="${car.name}">${car.name}</span>
                            <i>三厢 5座 自动    - ${car.city.name}${car.street.name}</i>
                        </div>
                    </a>
                </c:forEach>

                <div class="pages">

                    <c:if test="${pages.hasPreviousPage}">
                        <a class="" href="/cars/pages/${cn}${pages.navigateFirstPage}">首页</a>
                        <a class="" href="/cars/pages/${cn}${pages.prePage}">&laquo;</a>
                    </c:if>
                    <c:forEach items="${pages.navigatepageNums}" var="num">
                        <a class="" href="/cars/pages/${cn}${num}">${num}</a>
                    </c:forEach>
                    <c:if test="${pages.hasNextPage}">
                        <%--            <a class="/pages/${pages.nextPage}" href="30/p/2.html">下一页</a>--%>
                        <a class="" href="/cars/pages/${cn}${pages.nextPage}">&raquo;</a>
                        <a class="" href="/cars/pages/${cn}${pages.pages}">尾页</a>
                    </c:if>
                </div>
            </div>

    </div>


    <div class="clear_fix"></div>

</div>

<script>
    var countdown = function(){
        setTimeout(function (){
            $("#carinfo").css('display','block');
            $("#loadings").css('display','none');
            $("#nocartip").css('display','block');
        },300);
    };
    countdown();

</script>
<%@ include file="common/footer.jsp"%>
</body>
</html>
