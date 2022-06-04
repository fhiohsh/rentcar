<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@ include file="common/path2.jsp"%>
    <script type="text/javascript" src="/statics/layui/layui.js"></script>
    <script type="text/javascript" src="/statics/script/jquery-1.8.0.min.js"></script>
    <script type="text/javascript" src="/statics/script/city.js"></script>
    <title>Title</title>
</head>
<body>
<%@ include file="common/header.jsp"%>
<ul class="navmenu">
    <li ><a href="/a">首页</a><span></span></li>
    <li class="active"><a href="/cars/shopsCar/1201">租车</a><span></span></li>
    <li><a href="/cars/pages/1">车型查询</a><span></span></li>
    <li><a href="/shop">营业网点</a><span></span></li>
</ul>
<div class="clear_fix"></div>
<div class="crumbp"> <a href="#">首页</a> <em>&gt;</em> <span>租车门店</span> </div>
<div class="mainbox">
    <%@ include file="common/caropt.jsp"%>
<%--    <div class="clear_fix"></div>--%>
    <div class="flexlay" style="display: flex;position: relative;min-width: 1400px;margin: 13px 110px;">
        <div class="seas seas2" style="position: absolute;left: 287px;z-index: 9;">
            <div class="egc-sea-box">
                <form action="">
                    <input type="text" class="sea-ipt-txt sea-ipt-txt2" placeholder="搜索您想要的车">
                    <a href="#" class="search-btn search-btn2">搜索</a>
                </form>
            </div>
        </div>
        <!--门店-->
        <div class="good_car good_car2">
            <div class="block-description"> <span class="title fl">优质车源</span>
                <span class="mores fr"><a href="/shopByCity/${shop.city.name}">查看更多>></a></span></div>
            <div class="clear_fix"></div>
            <div class="goodcarlist">
                <!-- <div class="fl"><img src="images/banner1.jpg" /></div> -->
                <div class="menucarlist fl">
                    <ul class="carList">
                        <c:forEach items="${shopCarList}" var="cars">
                            <li>
                                <div class="list-infoBox">
                                    <a title="奇瑞QQ3 2012款 QQ3 0.8 手动 梦想版" target="_blank" class="imgtype">
                                        <img width="290" height="194" src="/statics/images/${cars.img}" alt="奇瑞QQ3 2012款 QQ3 0.8 手动 梦想版"> </a>
                                    <p class="infoBox"><a title="${cars.name}"
                                                          href="" target="_blank" class="info-title">${cars.name}</a></p>
                                    <p class="fc-gray"><span class="tag-gray">${cars.city.name}</span><span class="">三箱 ${cars.seats}座 自动</span>
                                        <em class="shuxian">|</em> ${cars.carml}</p>
                                    <p class="priType-s"><span> <i class="fc-org priType" name> ${cars.rentprice}/天 </i> </span></p>
                                    <a href="/cars/carShops/${shop.city.name}/${cars.name}"><div class="carlist-btn">预定</div></a>
                                </div>
                            </li>
                        </c:forEach>


                    </ul>
                </div>
            </div>
        </div>

        <div class="shop_site">
            <div class="fr" style="width:338px; height:366px;padding: 15px; border:1px solid #e6e6e6; line-height:30px; position:relative;">
                <div class="md-title">
                    <div style="border-bottom:1px solid #d6d6d6;"> <span class="text">门店信息</span> </div>
                    <span class="arr-ico"></span>
                </div>
                <div class="store-name">${shop.name}</div>
                <div>门店电话：
                    <span style="color:#c7000a; font-size:18px">${shop.phone}</span>
                    转 <span style="color:#c7000a; font-size:18px;">033670</span></div>
                <div style="overflow:hidden;">
                    <span style="display:inline-block; font-size:14px; ">门店地址：${shop.city.name}${shop.street.name}${shop.address}</span>
                </div>
                <div id="allmap"
                     style="margin-left: 4px;height: 200px;overflow: hidden; color: rgb(0, 0, 0); text-align: left; z-index: 0; background-color: rgb(243, 241, 236);">
                </div>
            </div>
        </div>
        <div class="clear_fix"></div>
    </div>

</div>
<script type="text/javascript">
    //百度地图API功能
    function loadJScript() {
        var script = document.createElement("script");
        script.type = "text/javascript";
        script.src = "http://api.map.baidu.com/api?v=2.0&ak=kTejdTSqYshrtRwLhntcOmEz&callback=init";
        document.body.appendChild(script);
    }

    function init() {
        var map = new BMap.Map("allmap"); // 创建Map实例
        var points = '${shop.point}';
        var p0 = points.split(",")[0];
        var p1 = points.split(",")[1];
        var lab_text = '${shop.name}';
        var point = new BMap.Point(p0, p1); // 创建点坐标
        map.centerAndZoom(point, 13);
        //map.enableScrollWheelZoom();
        var marker = new BMap.Marker(new BMap.Point(p0, p1));
        map.addOverlay(marker); //增加点
        marker.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画
        var top_left_control = new BMap.ScaleControl({
            anchor: BMAP_ANCHOR_TOP_LEFT
        }); // 左上角，添加比例尺
        var top_left_navigation = new BMap.NavigationControl(); //左上角，添加默认缩放平移控件
        var top_right_navigation = new BMap.NavigationControl({
            anchor: BMAP_ANCHOR_TOP_RIGHT,
            type: BMAP_NAVIGATION_CONTROL_SMALL
        }); //右上角，仅包含平移和缩放按钮
        /*缩放控件type有四种类型:BMAP_NAVIGATION_CONTROL_SMALL：仅包含平移和缩放按钮；BMAP_NAVIGATION_CONTROL_PAN:仅包含平移按钮；BMAP_NAVIGATION_CONTROL_ZOOM：仅包含缩放按*/
        map.addControl(top_left_control);
        //map.addControl(top_left_navigation);
        map.addControl(top_right_navigation);
    }
    window.onload = loadJScript; //异步加载地图
</script>
<%@ include file="common/footer.jsp"%>
</body>
</html>
