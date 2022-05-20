<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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


    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=IDvNBsejl9oqMbPF316iKsXR"></script>
    <script type="text/javascript" src="http://api.map.baidu.com/library/SearchInfoWindow/1.5/src/SearchInfoWindow_min.js"></script>
    <link rel="stylesheet" href="http://api.map.baidu.com/library/SearchInfoWindow/1.5/src/SearchInfoWindow_min.css"/>
    <title>门店地图</title>
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
<div class="crumbp"> <a href="#">首页</a> <em>&gt;</em> <span>营业网点</span><em>&gt;</em> <span>地图导航</span> </div>
<div class="clear_fix"></div>
<div class="navigation navg2">
    <div class="nav-cent nac2">
        <!-- <div class="logo"><a href="index.html"><img src="images/logo.png" width="240" /></a></div> -->
        <div class="citychange">
            <div class="city clearcity"> <em></em>
                <span id="DY_site_name" class="red city-name Left cl" style="font-size: 20px;">${city.name}</span>
                <div id="JS_hide_city_menu_11" class="city-select cut_handdler Left">
                    <a href="javascript:void(0);" class="common-bg selector selector2">切换城市</a>
                    <div id="JS_header_city_bar_box" class="hide_city_group">
                        <div class="hideMap">
                            <div class="showPanel clearfix">
                                <div class="Left mycity">

                                    <div id="JS_current_city_box">
                                        当前城市：<strong id="JS_city_current_city">${city.name}</strong> </div>
                                    <div id="JS_default_city_delete" style="display: none;"></div>
                                </div>
                            </div>
                            <div class="showPanel showPanel2 clearfix">
                                <div class="hot_city" id="JS_header_city_hot"> </div>
                                <div class="city_words mt10" id="JS_header_city_char"> </div>
                            </div>
                            <div class="scrollBody">
                                <div class="cityMap clearfix">
                                    <table id="JS_header_city_list" class="city_list" style="margin-top: 0px;">
                                        <tbody>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="scrollBar"> <span id="JS_header_city_bar" style="margin-top: 0px;"></span> </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <span class="common-bg city-logo"></span>
            <div class="cityqu">
                <div class="newarea">
                    <c:forEach var="street" items="${streetList}">
                        <a href="">${street.name}区</a>
                    </c:forEach>
                    <c:if test="${empty streetList}">
                        <span style="position: absolute;margin-left:120px;margin-top: 21px;font-size: 21px;font-weight: bold;">目前该城市还么有，请您查询其他城市！</span>
                    </c:if>
                </div>
            </div>

        </div>
    </div>
</div>

    <div class="mainbox mainmaps">
        <div class="main-box-left">
            <c:forEach var="shop" items="${shopList}">
                <div class="store-box" onclick="openInfoWindows('${shop.id}','${shop.city.id}')">
                    <ul>
                        <li class="store-mark">1</li>
                        <li class="store-name">${shop.name}<em class="store-tips">支持24小时自助取还</em></li>
                        <li class="store-address">${shop.city.name}${shop.address}-${shop.name}<span></span></li>
                        <li class="store-phone">门店电话：<span>${shop.phone}</span></li>
                        <li class="store-time">营业时间：<span>${shop.business_hours}</span></li>
                    </ul>
                </div>
            </c:forEach>
            <c:if test="${empty shopList}">
                <div class="nocontentmsg" style="background: url(/statics/images/nocontent.png) no-repeat -156px 16px;width: 370px;height: 550px">
                    <span style="padding:20px;margin: 20px auto;display: inline;color: #000;font-weight: bold;font-size: 15px" >该地区暂时没有出租门店，您可以联系人工服务(668472)或查看其他区域门店。</span>
                </div>
            </c:if>

        </div>
        <%--    地图--%>
        <div class="main-box-right">
            <div class="fcmap" id="fcmap"></div>
        </div>
    </div>


<script type="text/javascript" src="${pageContext.request.contextPath}/statics/script/city2.js"></script>
<script type="text/javascript">
    //初始化
    var map = new BMap.Map('fcmap');

    //根据城市标注经纬
    var localSearch = new BMap.LocalSearch(map);
    localSearch.enableAutoViewport();
    var keyword = '${city.name}';
    console.log(keyword);
    localSearch.search(keyword);
    var pois;
    localSearch.setSearchCompleteCallback(function (searchResult) {
        // map.clearOverlays();//清除覆盖物
        var poi = searchResult.getPoi(0);
        pois = new BMap.Point(poi.point.lng, poi.point.lat);
        map.centerAndZoom(pois, 12);
        map.enableScrollWheelZoom(true);
        map.addControl(new BMap.NavigationControl());
        map.addControl(new BMap.ScaleControl());
        map.addControl(new BMap.OverviewMapControl());
    });
    //添加mark
    var myIcon = new BMap.Icon("/statics/images/locals2.png", new BMap.Size(60, 50), {});
    var marker = []; //存放标注点对象的数组
    var packJson= [];
    <c:forEach var="shop" items="${shopList}" varStatus="i">
        // var q=0;
        // var i = q+1;
        var points = '${shop.point}';
        var p0 = points.split(",")[0];
        var p1 = points.split(",")[1];
        marker[${i.index}] = new BMap.Marker(new BMap.Point(p0, p1), {icon: myIcon});
        map.addOverlay(marker[${i.index}]);
        //content
        var cons = '<div><h4 style="margin:0 0 5px 0;font-size:20px;color: #666;">${shop.name}${shop.id}</h4>' +
            '<p style="line-height:1.5;font-size:13px;">${shop.address}-${shop.city.name}${shop.street.name}</p>' +
            '<div style=""><p style="line-height:1.5;font-size:13px;">营业时间：<b>${shop.business_hours}</b></p>' +
            '<p style="line-height:1.5;font-size:13px;">门店电话：<b>${shop.phone}</b></p></div>' +
            '<div style="text-align:right;"><a href="/cars/shopsCar/${shop.id}" style="color:#23b7b7; font-weight: bolder;font-size: 14px;">查看门店>></a></div>';
        addinfo(cons, marker[${i.index}]);
         console.log(${i.index});
        //q++;

    </c:forEach>

    //点击mark
    function addinfo(cons, marker) {
        //信息窗口
        var infoWindow = new BMap.InfoWindow(cons);
        marker.addEventListener("click", function () {
            this.openInfoWindow(infoWindow);
        });
    }
    //按钮显示
    function openInfoWindows(id) {
        console.log(id);
        // var s = 0;
        <c:forEach var="shop" items="${shopList}" varStatus="i">
            sid = '${shop.id}';
           if(sid === id){
               var cons = '<div><h4 style="margin:0 0 5px 0;font-size:20px;color: #666;">${shop.name}${shop.id}</h4>' +
                   '<p style="line-height:1.5;font-size:13px;">${shop.address}-${shop.city.name}${shop.street.name}</p>' +
                   '<div style=""><p style="line-height:1.5;font-size:13px;">营业时间：<b>${shop.business_hours}</b></p>' +
                   '<p style="line-height:1.5;font-size:13px;">门店电话：<b>${shop.phone}</b></p></div>' +
                   '<div style="text-align:right;"><a href="/cars/shopsCar/${shop.id}" style="color:#23b7b7; font-weight: bolder;font-size: 14px;">查看门店>></a></div>';
               var infoWindows = new BMap.InfoWindow(cons);
               // infoWindow.open(marker[i]);
               var points = '${shop.point}';
               var p0 = points.split(",")[0];
               var p1 = points.split(",")[1];
               marker[${i.index}].openInfoWindow(infoWindows);
               poiss = new BMap.Point(p0, p1);
               this.map.centerAndZoom(poiss, 16);
           }else{
               console.log('加载粗错');
           }
        </c:forEach>
    }


    $('.main-box-left div').each(function (index) {
      $(this).click(function () {
        $(this).addClass('store-box-hover').siblings().removeClass('store-box-hover');
        // $('.me-dl').eq(index).show().siblings().hide();
      })
    });



</script>

</body>
</html>
