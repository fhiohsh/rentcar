<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@ include file="common/path2.jsp"%>
    <script type="text/javascript" src="/statics/layui/layui.js"></script>
    <script type="text/javascript" src="/statics/script/jquery-1.8.0.min.js"></script>
    <link rel="shortcut icon" href="/statics/images/favicon.ico">
    <title>我的风车</title>
</head>
<body>
<%@ include file="common/header.jsp"%>
<ul class="navmenu">
    <li><a href="/a">首页</a><span></span></li>
    <li><a href="/cars/shopsCar/1201">租车</a><span></span></li>
    <li><a href="/cars/pages/1">车型查询</a><span></span></li>
    <li><a href="/shopIn/shop">营业网点</a><span></span></li>
</ul>
<div class="clear_fix"></div>
<!--会员中心-->
<div class="mebBox">
    <div class="meb-cont clearfix mainbox">
        <div class="meb-nav meb-nav2 fl dInline">
            <ul class="mr2 clearfix">
                <li id="userscenter"><a>个人中心</a></li>
                <li class="on" id="showorders"><a>订单管理</a></li>
                <li id="useraccount"><a>账户管理</a></li>
            </ul>
        </div>
        <div class="meb-right fr dInline">
            <div class="mr-top">
                <div class="mr-top-div clearfix">
                        <span class="fl">
                            <img src="/statics/images/userphoto.png" style="height: 80px">
                        </span>
                    <div class="mr-infor mr-infor2 fl dInline">
                        <h2>尊敬的会员 <b>${sessionScope.user.name}</b></h2>
                        <p>
                            手机：15138911875 邮箱： | [ <a href="#">管理账户信息</a> ]
                        </p>
                    </div>
                </div>
            </div>
            <div class="mr-detail">
                <div class="mr-tab mr-tab2">
                    <a class="on">预约中</a>
                    <a>租赁中</a>
                    <a>预约记录</a>
                </div>
                <div class="bg110"></div>
                <div class="me-box">
                    <!-- 1 -->
                    <div class="me-dl" style="display: none;">
                        <div class="me-one" id="me-four">
                            <ul class="cs-list">
                                <c:forEach var="orders" items="${orderList}">
                                    <c:if test="${orders.orderstatus eq '2'}">
                                    <li class="clearfix" style="position: relative;">
                                    <span class="carImg fl dInline">
                                    <a href="" target="_blank">
                                        <div class="car_bg"> </div>
                                        <img src="/statics/images/${orders.car.img}" width="300">
                                    </a>
                                    </span>
                                        <div class="carTxt fr dInline">
                                            <h3><a href="#" target="_blank">订单编号：${orders.id}</a></h3>
                                            <h2><a href="#" target="_blank">${orders.car.name} (排量：2.0T 排放标准：10L)</a></h2>
                                            <p>
                                                <span>取车时间：${orders.pickcartime}</span>
                                                <span>还车时间：${orders.returncartime}</span>
                                            </p>
                                            <div class="price clearfix" style="margin:5px 0;">
                                                <div class="fl dInline pNum">
                                                    <span>租期：${orders.renttime}天</span><br>
                                                    <span class="num nBlue">${orders.rentprice} </span>
                                                    <span> /日</span>
                                                </div>
                                                <span class="num1 fl" style="height:43px;padding-top:10px;">
                                                    <em>取车门店：${orders.pickaddress}</em><br>
                                                    <em>取车地址：${orders.shop.address}（）</em>
                                                    <em ><a href="/shop" style="color: #ff00d6">查看地图</a></em>
                                                    <br>
                                            </span>
                                            </div>
                                            <div class="cs_bt clearfix">
                                                <a href="javascript:;" class="cs-q cs-q1">填写验车单</a>
                                                <a href="javascript:void(0)" onclick="CancelOrder('1','${orders.id}','${orders.car.id}')">取消预约</a>
                                            </div>
                                        </div>
                                        <input type="hidden" id="fileordername" value="${orders.id}">
                                        <input type="hidden" id="usersign" value="${sessionScope.user.id}">
                                    </li>
                                    </c:if>
                                </c:forEach>
                            </ul>
                            <div class="hPages"> </div>
                        </div>
                    </div>
                    <!-- 2 -->
                    <div class="me-dl" style="display: none;">
                        <div class="me-one" id="me-e">
                            <ul class="cs-list">
                            <c:forEach var="orders" items="${orderList}">
                                <c:if test="${orders.orderstatus eq '3'}">
                                    <li class="clearfix" style="position: relative;"> <span class="carImg fl dInline"><a
                                            href="#" target="_blank">
                                                <div class="car_bg"> </div> <img src="/statics/images/${orders.car.img}" width="300">
                                            </a> </span>
                                        <div class="carTxt fr dInline">
                                            <h3><a href="#" target="_blank">订单编号：${orders.id}</a></h3>
                                            <h2><a href="#" target="_blank">${orders.car.name} (排量：${orders.car.carml}T)</a></h2>
                                            <p>
                                                <span>取车时间：${orders.pickcartime}</span><br>
                                                <span>还车时间：${orders.returncartime}</span><br>
                                                <input type="hidden" id="test1" value="${orders.returncartime}">

                                            <blockquote class="layui-elem-quote" style="margin-top: 10px;">
                                                <div id="test2"></div>
                                            </blockquote>

                                            </p>
                                            <div class="price clearfix" style="margin:5px 0;">
                                                <div class="fl dInline pNum">
                                                    <font>租期：${orders.renttime}天</font><br> <span class="num nBlue">${orders.rentprice} </span>
                                                    <font> /日</font>
                                                </div>

                                                <span class="num1 fl" style="height:43px;padding-top:10px;">
                                                    <em>推荐还车门店：${orders.pickaddress}</em><br>
                                                    <em>选择的地址：${orders.returnaddress}</em>
                                                    <br>
                                                <div class="layui-form-item">
                                                    <button type="button" class="layui-btn layui-btn-sm" onclick="selectShop('${orders.id}')">选择门店</button>
                                                </div>
                                            </span>

                                            </div>
                                            <div class="cs_bt clearfix" style="margin-top: 17px;margin-left: -10px;">
                                                <a class="cs-q cs-q3" onclick="addDate('${orders.id}','${orders.returncartime}','${orders.renttime}','${orders.rentprice}')">修改租期</a>
                                                <a href="javascript:;" class="cs-q4"  onclick="clearOrder('${orders.id}','${orders.totalprice}','${orders.returnaddress}','${orders.car.id}')"> 现在还车</a>
                                            </div>
                                        </div>
                                    </li>
                                </c:if>
                            </c:forEach>
                            </ul>
                            <div class="hPages"> </div>
                        </div>
                        <!-- 3 -->
                    </div>
                    <div class="me-dl" style="display: none;">
                        <div class="me-one" id="ee">
                            <ul class="cs-list">
                                <c:forEach var="orders" items="${orderList}">
                                    <c:if test="${orders.orderstatus eq '0' or orders.orderstatus eq '1' or orders.orderstatus eq '4' or orders.orderstatus eq '5'}">
                                        <li class="clearfix" style="position: relative;">
                                    <span class="carImg fl dInline">
                                    <a href="" target="_blank">
                                        <div class="car_bg"> </div>
                                        <img src="/statics/images/${orders.car.img}" width="300">
                                    </a>
                                    </span>
                                            <div class="carTxt fr dInline">
                                                <h3><a href="#" target="_blank">订单编号：${orders.id}
                                                    <b style="color: #7d02bc">(
                                                        <c:if test="${orders.orderstatus eq '4'}">
                                                            订单完成，等待后台确认
                                                        </c:if>
                                                        <c:if test="${orders.orderstatus eq '1'}">
                                                            订单已取消
                                                        </c:if>
                                                        <c:if test="${orders.orderstatus eq '5'}">
                                                            订单完成✔
                                                        </c:if>
                                                        <c:if test="${orders.orderstatus eq '0'}">
                                                            订单完成✔
                                                        </c:if>
                                                        )
                                                    </b>
                                                    </a>
                                                </h3>
                                                <h2><a href="#" target="_blank">${orders.car.name} (排量：2.0T 排放标准：10L)</a></h2>
                                                <p>
                                                    <span>取车时间：${orders.pickcartime}</span>
                                                    <span>还车时间：${orders.returncartime}</span>
                                                </p>
                                                <div class="price clearfix" style="margin:5px 0;">
                                                    <div class="fl dInline pNum">
                                                        <span>租期：${orders.renttime}天</span><br>
                                                        <span class="num nBlue">${orders.rentprice} </span>
                                                        <span> /日</span>
                                                    </div>
                                                    <span class="num1 fl" style="height:43px;padding-top:10px;">
                                                    <em>取车门店：${orders.pickaddress}</em><br>
                                                    <em>取车地址：${orders.shop.address}（）</em>
                                                    <em ><a href="/shop" style="color: #ff00d6">查看地图</a></em>
                                                    <br>
                                                    </span>
                                                </div>
<%--                                                <div class="cs_bt clearfix">--%>
<%--                                                    <a href="javascript:;" class="cs-q cs-q1">填写验车单</a>--%>
<%--                                                    <a href="javascript:void(0)" onclick="delNeedThis('287')">取消预约</a>--%>
<%--                                                </div>--%>
                                            </div>

                                        </li>
                                    </c:if>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 确认验证单 -->
<form class="layui-form" action="" lay-filter="example">
    <div class="logindemoBg verifyformBg">
        <div class="login_panels">
            <div class="closeBg"><span></span></div>
            <div class="login_labelBg">
                <h2>确认验车单</h2>
            </div>
            <div class="verifybg">
                <ul>
                    <li><span>车型：奥迪R8</span><span></span></li>
                    <li><span>用车人：李宝</span><span>用车租金：成都市高新区</span></li>
                    <li><span>地址：李宝</span><span>租期：2天</span></li>
                    <li><span>电话：李宝</span><span>取车门店：八万人体育场店</span></li>
                    <li><span>取车时间：2022-04-27</span><span>还车时间：2022-04-29</span></li>
                    <li><span>押金：3000</span><span>租价：99/天</span></li>
                    <li>

                        <div class="layui-form-item">
                            <label class="layui-form-label lfl">结算方式</label>
                            <div class="layui-input-block">
                                <input type="radio" name="sex" value="现金" title="现金"
                                       checked="">
                                <input type="radio" name="sex" value="汇款" title="汇款">
                            </div>
                        </div>
                    </li>
                </ul>
                <div class="annunce">
                    <span>以下条款请租用方仔细阅读：</span>
                    <p>① 车辆与您预定不符的，请立即通知我们，并且不能上车，否则视为对所用车辆认可无异议。 </p>
                    <p>② 租车期内车辆所产生的路、桥、渡、停车费由出车方支付。</p>
                    <p>③ 不限公里,按小时计算，超出的时间按每小时四十元。 </p>
                    <p>...............................................</p>
                </div>
            </div>
            <div class="confirmBg">
                <a id="verform"><span>确 认</span></a>
            </div>
        </div>
    </div>
</form>
<%--  --%>
<div class="paycode" style="z-index: 99;display: none;width:400px;height: 300px;background: #fff;position: absolute;top: 150px;left: 40%;">
    <img src="/statics/images/qrcode.png" alt="">
    <span style="position: absolute;font-size: 27px;right: 7px;top: 30px;">扫码支付</span>
    <span style="position: absolute;font-size: 17px;right: 20px;top:270px;color: #EB5A01;">
        已<a href="javascript:;" id="payforOrder">支付</a>完成
    </span>
</div>
<div class="signpanel" style="z-index: 99;display: none; width: 400px;border:1px  rgb(59, 202, 171) solid;position: relative;left: 600px;top: -800px;background: #fff">
    <div class="signature" id="signature" style="background: #F6F6F6;margin: 0 auto;width:400px;height:300px;border: 1px rgb(59, 202, 171) solid;">
    </div>
    <p style="text-align: center"><b style="color: red">请按着鼠标写字签名。</b></p>
    <div class="btnss" style="text-align: center"><div class="layui-btn layui-btnyes" id="yes">确认</div>
        <div class="layui-btn" id="reset">重写</div></div>
    <div id="someelement"></div>
</div>
<script type="text/javascript" src="/statics/script/jSignature.min.js"></script>
<script src="https://cdn.bootcss.com/html2canvas/0.5.0-beta4/html2canvas.min.js"></script>
<script type="text/javascript" src="/statics/script/users/orderSign.js"></script>
<script type="text/javascript" src="/statics/script/user.js"></script>
<%@ include file="common/footer.jsp"%>

<script>


    var selectShop = function(orderId){
        location.href = "/orders/orderReturnAddress/"+orderId;
    };

    $("#timebtn").click(function () {
        $(".logindemoBg2").fadeOut();
    });
    var filename = $("#fileordername").val();
    var f2name = $("#usersign").val();
    var fname = filename+f2name;
    //取消订单
    var CancelOrder = function (fg,orderId,cid) {
        $.ajax({
            type:"POST",
            url:"/orders/user/Cancel",
            data:{fg:fg,orderId:orderId,uid:'${sessionScope.user.id}',carId:cid},
            dataType: 'json',
            success:function(data){
                if(data.result == "1"){
                    layer.alert("订单已取消",function () {
                        location.replace(location.href);
                    })
                }else if(data.result == "0"){
                    layer.alert("订单超时了哟",function () {
                        location.replace(location.href);
                    })
                }else{
                    layer.msg("异常！")
                }
            }
        });
    };
    //合同保存
    $("#someelement").click(function () {
        $(".bg110").hide();
        $(".signpanel").fadeOut();
        layer.msg("合同签字已保存",{icon: 1,time:400},function(index){
            $.ajax({
                type:"POST",
                url:"/orders/tbase",
                data:{bases:$('#signimg')[0].src,orderId:filename,uid:f2name},
                dataType: 'json',
                success:function(data){
                    location.replace(location.href)
                }
            });
        });
    });

    //订单结算
    function clearOrder(orderId,rentprice,returnaddress,carId) {
        if(returnaddress === ''){
            layer.msg("请选择还车地址")
        }else{
            var price = Number(rentprice) + Number(200);
            layer.msg('获取信息中...',{icon: 6,
                shade: [0.5, '#f5f5f5'],
                time:200},function () {
                layer.open({
                    type: 1,
                    title: ' 订单结算 ',
                    skin: 'layui-layer-demo', //样式类名
                    closeBtn: 0, //不显示关闭按钮
                    anim: 2,
                    shadeClose: true, //开启遮罩关闭
                    btn: ['确定'],
                    yes:function(index){
                        layer.msg('请稍候...', {
                            icon: 6,
                            shade: [0.5, '#f5f5f5'],
                            time:400},function (index) {
                            $(".bg110").show();
                            $(".paycode").fadeIn();

                            $("#payforOrder").click(function () {
                                $(".paycode").fadeOut();
                                $(".bg110").hide();
                                layer.msg("订单已完成",{icon: 1,time:300},function(index){
                                    $.ajax({
                                        type:"POST",
                                        url:"/orders/user/Cancel",
                                        data:{fg:'4',orderId:orderId,uid:'${sessionScope.user.id}',carId:carId},
                                        dataType: 'json',
                                        success:function(data){
                                            if(data.result == "1"){
                                                layer.alert("等待后台确认",function () {
                                                    location.replace(location.href);
                                                })
                                            }else if(data.result == "0"){
                                                layer.alert("订单超时了哟",function () {
                                                    location.replace(location.href);
                                                })
                                            }else{
                                                layer.msg("异常！")
                                            }
                                        }
                                    });
                                });
                            });
                            layer.close(index)
                        });
                        layer.close(index)
                    },
                    content: '<div class="layui-form-item" style="margin:20px"><label class="layui-form-label">订单id:</label>' +
                        '<div class="layui-input-block" style="margin-top:10px;">' +
                        '<input type="text" name="title" autocomplete="off" class="layui-input" value='+orderId+' style="width:100px;" readonly="readonly"></div>' +
                        '<div class="renewtime" style="margin-top:4px;"><label class="layui-form-label" style="margin-top:-10px;">￥费用统计:</label><div class="layui-input-block" ><p style="margin-bottom: 5px;width:180px;font-size: 18px;">￥'+price+'</p></div>' +
                        '<div class="renewtime" style="margin-top:4px;"><label class="layui-form-label" style="margin-top:-10px;">租车费用:</label><div class="layui-input-block" ><p style="margin-bottom: 5px;width:180px;font-size: 18px;">￥'+rentprice+'</p></div>' +
                        '<div class="renewtime" style="margin-top:4px;"><label class="layui-form-label" style="margin-top:-10px;">人工服务费:</label><div class="layui-input-block" ><p style="margin-bottom: 5px;width:180px;font-size: 18px;">￥200</p></div>' +
                        '<div class="renewtime" style="margin-top:10px;"><label class="layui-form-label" style="margin-top:-10px;">上传车辆照片</label><div class="layui-input-block">' +
                        '<input type="file" name="title" autocomplete="off" class="layui-input" style="width:150px;"></div></div>' +
                        '<div class="renewtime" style="margin-top:10px;"><label class="layui-form-label">还车地址:</label>' +
                        '<div class="layui-input-block" style="padding-top: 11px">' +
                        '<p style="margin-bottom: 5px;width:180px;">'+returnaddress+'</p></div></div>'
                });
            });
        }

    }
    var addDate = function(orderID,oldreturn,nowDays,rentprice){
        layer.msg('获取信息中...',{icon: 6,
            shade: [0.5, '#f5f5f5'],
            time:300},function () {
            layer.prompt({title:'增加天数',formType:0},function(value, index){
                layer.alert("续租成功~",function () {
                    location.href="/orders/order/renew/"+orderID+"/"+value+"/"+oldreturn+"/"+nowDays+"/"+rentprice+"/"+${sessionScope.user.id};
                });
                layer.close(index);
            })
        });
    };


</script>
</body>
</html>
