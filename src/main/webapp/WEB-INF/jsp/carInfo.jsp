<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <%@ include file="common/path2.jsp"%>
    <link rel="stylesheet" type="text/css" href="/statics/css/datecaculate.css">
    <script type="text/javascript" src="/statics/script/jquery-1.8.0.min.js"></script>
    <script type="text/javascript" src="/statics/script/city3.js"></script>
    <script type="text/javascript" src="/statics/layui/layui.js"></script>
    <title>Title</title>
</head>
<body>
<%@ include file="common/header.jsp"%>
<ul class="navmenu">
    <li><a href="/a">首页</a><span></span></li>
    <li><a href="/cars/shopsCar/1201">租车</a><span></span></li>
    <li class="active"><a href="/carList">车型查询</a><span></span></li>
    <li ><a href="/shop">营业网点</a><span></span></li>
</ul>
<div class="clear_fix"></div>
<div class="crumbp"> <a href="#">首页</a> <em>&gt;</em> <span>个人二手车</span> </div>
<div class="clear_fix"></div>
<!-- 车box -->
<div class="carbox">
    <div class="carimg">
        <img src="/statics/images/${car.img}" alt="日产轩逸">
    </div>
    <form action="" id="form0" method="post">
        <div class="car-info">
            <div class="car-name">
                ${car.name}
            </div>
            <div class="car-des">
                三厢&nbsp;&nbsp;${car.seats}座&nbsp;&nbsp;自动
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
                    <c:forEach var="street" items="${streetList}">
                        <a href="/cars/carShops/${citys.name}/${car.name}/${street.id}">${street.name}区</a>
<%--                        <input type="hidden" id="streetIdVal" value="${street.id}">--%>
                    </c:forEach>
                    <c:if test="${empty streetList}">
                        <span style="position: absolute;margin-left:120px;margin-top: 21px;font-size: 21px;font-weight: bold;">目前该城市还没有，请您查询其他城市！</span>
                    </c:if>
                </div>
            </div>
            <span class="common-bg city-logo"></span>
        </div>
    </div>
</div>
<div class="mainbox main2">
    <div id="carinfo" style="display: none">
        <c:forEach var="cars" items="${carShopList}">
            <div class="shops" style="">
                <div class="store-info">
                    <p>${cars.shops.name}</p>
                    <span>${cars.shops.city.name}${cars.shops.street.name}${cars.shops.address}</span>
                </div>
                <div class="store-price">
                    ￥ ${cars.rentprice}
                    <i>/天</i>
                </div>
                <div class="store-btn">
                    <a href="javascript:;" class="bookcar"><span>预  定</span></a>
                </div>
            </div>
            <input type="hidden" id="rentprice" name="rentprice" value="${cars.rentprice}">
                <input type="hidden" id="carId" name="car_id" value="${cars.id}">
                <input type="hidden" id="shopId" name="shopId" value="${cars.shops.id}">
        </c:forEach>
    </div>
    <div class="carwrap">
        <!-- 做个加载条 -->
        <div class="pageLoading" id="loadings" style="display: block;">
            <p class="loadingbox">
                <img src="https://booking.1hai.cn/Content/Images/Shared/loading.gif?v=77725ca3d3a84eb48103c13db6db5e28" alt="">
                正在为您查询可租车型...
            </p>
        </div>
        <c:if test="${empty carShopList}">
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
            <form action="/Order/SecondStep" id="orderCarInfo" method="post">
<%--                <div class="denglu">预约时间</div>--%>
                <div id="time">
                    <div id="yhu">取车时间: <input type="date" name="pickcartime" id="curtime"></div>
                    <div id="pas">还车时间: <input type="date" name="returncartime" id="backtime"></div>
                </div>

<%--                <span id="orderday"></span>--%>
                <input type="hidden" id="OrderShopId" name="shop_id" value>

                <input type="hidden" id="OrderCarId" name="car_id" value>
                <input type="hidden" id="rentTime" name="renttime" value>
                <input type="hidden" id="OrderPrice" name="rentprice" value>
                <input type="hidden" name="deposit" value="4000">
                <input type="hidden" name="renttype" value="门店支付">
                <input type="hidden" name="rentfrom" value="PC">

                    <a href="#" id="qued"><div class="layui-btn-container">
                        <button type="button" class="layui-btn layui-btn-lg" style="font-size: 23px;">预定</button>
                    </div>
                    </a>
            </form>
        </div>
<%--        <span id="close" class="loginclosedate">&times;</span>--%>
    </div>
</div>
<script type="text/javascript" src="/statics/script/datecau.js"></script>
<script>
    var carname = '${car.name}';

    <%--$('#streetId').click(function () {--%>
    <%--    // var strId = $('#streetIdVal').val();--%>
    <%--    var strId = $("#streetIdVal").attr("sid");--%>
    <%--    location.href="/cars/carShops/${citys.name}/${car.name}/"+strId;--%>
    <%--});--%>

    var countdown = function(){
        setTimeout(function (){
            $("#carinfo").css('display','block');
            $("#loadings").css('display','none');
            $("#nocartip").css('display','block');
        },200);
    };
    countdown();

    $(".bookcar").click(function () {

        // $(".bg110").show();
        // $("#modal").fadeIn();
        layer.open({
            title:'选择日期',
            type: 1,
            skin: 'layui-layer-demo', //样式类名
            closeBtn: 1, //不显示关闭按钮
            anim: 2,
            overflow:0,
            area: ['380px', '390px'],
            shadeClose: true, //开启遮罩关闭
            content: $("#modal")
        });
    });
    $(".loginclosedate").click(function () {
        $(".bg110").hide();
        $("#modal").fadeOut();
    });

    //结束时间
    $("#backtime").change(function () {
        var start = document.getElementById('curtime').value;//开始日期
        var stime = formatDate(start);

        var b = document.getElementById('backtime').value;
        var etime = formatDate(b);
        // $("#backtime").attr("value", $(this).val()); //赋值
        // var ins = document.getElementById('backtime').value;
        document.getElementById('OrderPrice').value= document.getElementById('rentprice').value;
        document.getElementById('OrderCarId').value= document.getElementById('carId').value;
        document.getElementById('OrderShopId').value=document.getElementById('shopId').value;
        document.getElementById('rentTime').value=getDaysBetween(stime, etime);
        return etime;
    });
    $("#qued").on('click', function () {
        var serverTime = new Date().getTime();//系统时间
        var start = document.getElementById('curtime').value;//开始日期
        var b = document.getElementById('backtime').value;//结束日期
        // 赋值
        var st = new Date(start);
        var end = new Date(b);
        if(st.getTime() < serverTime){
            layer.msg("选择合适的日期");
        }else if(end.getTime() < st.getTime()){
            layer.msg("结束日期不合理");
        }else if(start === ''){
            layer.msg("请选择日期");
        }else{
            $("#orderCarInfo").submit();
        }

    });
</script>
<div class="clear_fix"></div>


<%@ include file="common/footer.jsp"%>
</body>
</html>
