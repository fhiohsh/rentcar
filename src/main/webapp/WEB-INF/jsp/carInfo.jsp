
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="/statics/css/base.css" />
    <link rel="stylesheet" type="text/css" href="/statics/css/home.css" />
    <link rel="stylesheet" type="text/css" href="/statics/city/city.css">
    <link rel="stylesheet" type="text/css" href="/statics/css/charge.css">
    <link rel="stylesheet" type="text/css" href="/statics/css/self.css">
    <link rel="stylesheet" type="text/css" href="/statics/css/hurst.css">
    <link rel="stylesheet" type="text/css" href="/statics/css/datecaculate.css">
    <link rel="stylesheet" type="text/css" href="/statics/css/loginstyle.css">
    <script type="text/javascript" src="/statics/script/jquery-1.8.0.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/statics/script/city.js"></script>

    <title>Title</title>
</head>
<body>
<%@ include file="common/header.jsp"%>
<ul class="navmenu">
    <li><a href="/a">首页</a><span></span></li>
    <li><a href="">租车</a><span></span></li>
    <li class="active"><a href="/carList">车型查询</a><span></span></li>
    <li><a href="/shop">营业网点</a><span></span></li>
    <li><a href="">个人中心</a><span></span></li>
</ul>
<div class="clear_fix"></div>
<div class="crumbp"> <a href="#">首页</a> <em>&gt;</em> <span>个人二手车</span> </div>
<div class="clear_fix"></div>
<!-- 车box -->
<div class="carbox">
    <div class="carimg">
        <img src="https://externalimage.1hai.cn/412/26b218c227844591b714a0ad7dd73d58.png"
             onerror="this.src='/Content/Images/Shared/defaultCar.png'" alt="日产轩逸">
    </div>
    <form action="" id="form0" method="post">
        <div class="car-info">
            <div class="car-name">
                日产天籁
            </div>
            <div class="car-des">
                三厢&nbsp;&nbsp;5座&nbsp;&nbsp;自动
                <a href="javascript:;" id="carDetail" class="view-car-para"
                   data-cid="{'cartypeList':[191],'groupId':0}">车辆详情&gt;</a>
            </div>
        </div>
        <div class="searchbox">
            <input type="text" id="" placeholder="输入门店查询"><a class="cfm" href="" title="确定">确定</a>
        </div>
    </form>
</div>


<div class="navigation navg2">
    <div class="nav-cent nac2">
        <!-- <div class="logo"><a href="index.html"><img src="images/logo.png" width="240" /></a></div> -->
        <%@ include file="common/cityopt.jsp"%>
        <%--   区县     --%>
            <div class="cityqu">
                <div class="newarea">
                    <a href="">机场</a>
                    <a href="">机场</a>
                    <a href="">机场</a>
                    <a href="">机场</a>
                    <a href="">机场</a>
                    <a href="">机场</a>
                    <a href="">机场</a>
                    <a href="">机场</a>
                    <a href="">机场</a>
                    <a href="">机场</a>
                    <a href="">机场</a>
                    <a href="">机场</a>
                    <a href="">机场</a>
                    <a href="">机场</a>
                    <a href="">机场</a>
                    <a href="">机场</a>
                    <a href="">机场</a>
                    <a href="">机场</a>
                </div>
            </div>
            <span class="common-bg city-logo"></span>
        </div>
    </div>
</div>
<div class="mainbox main2">
    <div id="carinfo" style="display: none">
        <div class="shops" style="">
            <div class="store-info">
                <p>成化店</p>
                <span>广州市越秀区北路与中山四路11号交界处大东门华庭中国银行旁</span>
            </div>
            <div class="store-price">
                ￥ 83
                <i>/日均</i>
            </div>
            <div class="store-btn">
                <a href="javascript:;" class="bookcar"><span>预  定</span></a>
            </div>
        </div>
    </div>
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
    </div>
</div>

<!-- 背景布 -->
<div class="bg110"></div>
<!-- 预定时间 -->
<div id="modal">
    <!-- 弹窗 -->
    <div id="modal-content">
        <!-- <img src="img\car1.jpg" alt="" style="width: 500px;height: 500px;"> -->
        <div id="neirong-1">
            <form action="" class="">
                <div class="denglu">预约时间</div>
                <div id="time">
                    <div id="yhu">取车时间: <input type="date" name="picktime" id="curtime"></div>
                    <div id="pas">还车时间: <input type="date" name="returntime" id="backtime"></div>
                </div>
                <a href="/topay" id="qued">预定</a>
                <span id="orderday"></span>
                <input type="hidden" id="newtime" name="newtime" value>
            </form>
        </div>
        <span id="close" class="loginclosedate">&times;</span>
    </div>
</div>
<script>
    var countdown = function(){
        setTimeout(function (){
            $("#carinfo").css('display','block');
            $("#loadings").css('display','none');
            $("#nocartip").css('display','block');
        },200);
    };
    countdown();

    $(".bookcar").click(function () {

        $(".bg110").show();
        $("#modal").fadeIn();
    });
    $(".loginclosedate").click(function () {
        $(".bg110").hide();
        $("#modal").fadeOut();
    });
</script>
<div class="clear_fix"></div>

<script type="text/javascript" src="/statics/script/datecau.js"></script>
<%@ include file="common/footer.jsp"%>
</body>
</html>
