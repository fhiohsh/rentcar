<%--
  Created by IntelliJ IDEA.
  User: Fh
  Date: 2022/5/19
  Time: 15:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="/statics/layui/css/layui.css">
    <link rel="stylesheet" type="text/css" href="/statics/css/base.css" />
    <link rel="stylesheet" type="text/css" href="/statics/css/home.css" />
    <link rel="stylesheet" type="text/css" href="/statics/css/hurst.css" />
    <link rel="stylesheet" type="text/css" href="/statics/css/self.css">
    <link rel="stylesheet" type="text/css" href="/statics/city/city.css">
    <link rel="stylesheet" type="text/css" href="/statics/css/loginstyle.css">

    <link rel="stylesheet" type="text/css" href="/statics/css/charge.css">

    <script type="text/javascript" src="/statics/layui/layui.js"></script>
    <script type="text/javascript" src="/statics/script/jquery-1.8.0.min.js"></script>
    <title>我的风车</title>
</head>
<body>
<%@ include file="common/header.jsp"%>
<ul class="navmenu">
    <li><a href="">首页</a><span></span></li>
    <li><a href="">租车</a><span></span></li>
    <li><a href="">车型查询</a><span></span></li>
    <li><a href="">营业网点</a><span></span></li>
    <li class="active"><a href="">个人中心</a></li>
</ul>
<div class="clear_fix"></div>
<div class="clear_fix"></div>
<!--会员中心-->
<div class="mebBox">
    <div class="meb-cont clearfix mainbox">
        <div class="meb-nav meb-nav2 fl dInline">
            <ul class="mr2 clearfix">
                <li><a>个人中心</a></li>
                <li class="on"><a href="">订单管理</a></li>
                <li><a>账户管理</a></li>
            </ul>
        </div>
        <div class="meb-right fr dInline">
            <div class="mr-top">
                <div class="mr-top-div clearfix">
                        <span class="fl">
                            <img src="/statics/images/userphoto.png" style="height: 80px">
                        </span>
                    <div class="mr-infor mr-infor2 fl dInline">
                        <h2>尊敬的会员 <b>username</b></h2>
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
                    <div class="me-dl" style="display: block;">
                        <div class="me-one" id="me-four">
                            <ul class="cs-list">
                                <li class="clearfix" style="position: relative;"> <span class="carImg fl dInline"><a
                                        href="#" target="_blank">
                                                <div class="car_bg"> </div> <img src="/statics/images/carrent1.png" width="300">
                                            </a> </span>
                                    <div class="carTxt fr dInline">
                                        <h2><a href="#" target="_blank">奥迪A4L (排量：2.0T 排放标准：10L)</a></h2>
                                        <p>
                                            <span>取车时间：2022-04-27 14:00</span>
                                            <span>还车时间：2022-04-29 14:00</span>
                                        </p>
                                        <div class="price clearfix" style="margin:5px 0;">
                                            <div class="fl dInline pNum">
                                                <font>租期：2天</font><br> <span class="num nBlue">99 </span>
                                                <font> /日</font>
                                            </div>
                                            <span class="num1 fl" style="height:43px;padding-top:10px;">
                                                    <em>取车门店：八万人体育场店</em><br>
                                                    <em>取车地址：上海上海市徐汇区斜土路2899号甲（光启文化广场内）</em>
                                                    <em ><a href="/shop" style="color: forestgreen">查看地图</a></em>
                                                    <br>
                                                    <input type="hidden" class="CarValue_287"
                                                           value="{img:'/',id:'224',price:'28.2',status:'',title:'奥迪A4L 2013 款 2.0T CVT 35TFSI 技术型',url:'#'}">
                                            </span>
                                        </div>
                                        <div class="cs_bt clearfix">
                                            <a href="javascript:;" class="cs-q cs-q1">填写验车单</a>
                                            <a href="javascript:void(0)" onclick="delNeedThis('287')">取消预约</a>
                                        </div>
                                    </div>
                                </li>

                            </ul>
                            <div class="hPages"> </div>

                        </div>

                    </div>
                    <!-- 2 -->
                    <div class="me-dl" style="display: none;">
                        <div class="me-one" id="me-e">
                            <ul class="cs-list">
                                <li class="clearfix" style="position: relative;"> <span class="carImg fl dInline"><a
                                        href="#" target="_blank">
                                                <div class="car_bg"> </div> <img src="/statics/images/carrent1.png" width="300">
                                            </a> </span>
                                    <div class="carTxt fr dInline">
                                        <h3><a href="#" target="_blank">订单编号：1102</a></h3>
                                        <h2><a href="#" target="_blank">奥迪A4L (排量：2.0T 排放标准：10L)</a></h2>
                                        <p>
                                            <span>取车时间：2022-04-27 14:00</span><br>
                                            <span>还车时间：2022-05-06 14:00</span><br>
                                            <input type="hidden" id="test1" value="2022-06-26 1:18:30">

                                        <blockquote class="layui-elem-quote" style="margin-top: 10px;">
                                            <div id="test2"></div>
                                        </blockquote>
                                        <!-- <span>距离还车时间还有：2天1小时</span>             -->
                                        </p>
                                        <div class="price clearfix" style="margin:5px 0;">
                                            <div class="fl dInline pNum">
                                                <font>租期：2天</font><br> <span class="num nBlue">99 </span>
                                                <font> /日</font>
                                            </div>

                                            <span class="num1 fl" style="height:43px;padding-top:10px;">
                                                    <em>推荐还车门店：八万人体育场店</em><br>
                                                    <em>地址：上海上海市徐汇区斜土路2899号甲（光启文化广场内）</em>
                                                    <br>
                                                <div class="layui-form-item">
                                                    <button type="button" class="layui-btn layui-btn-sm selectShop">选择门店</button>
                                                </div>
                                            </span>

                                        </div>
                                        <div class="cs_bt clearfix" style="margin-top: 17px;margin-left: -10px;">
                                            <a class="cs-q cs-q3">修改租期</a>
                                            <a class="cs-q4">现在还车</a>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                            <div class="hPages"> </div>
                        </div>
                        <!-- 3 -->
                    </div>
                    <div class="me-dl" style="display: none;">
                        <div class="me-one" id="ee">
                            <ul class="cs-list">
                                <li class="clearfix" style="position: relative;"> <span class="carImg fl dInline"><a
                                        href="#" target="_blank">
                                                <div class="car_bg"> </div> <img src="/statics/images/carrent1.png" width="300">
                                            </a> </span>
                                    <div class="carTxt fr dInline">
                                        <h2><a href="#" target="_blank">奥迪A4L (排量：2.0T 排放标准：10L)</a></h2>
                                        <p>
                                            <span>取车时间：2022-04-27 14:00</span>
                                            <span>还车时间：2022-04-29 14:00</span>
                                        </p>
                                        <div class="price clearfix" style="margin:5px 0;">
                                            <div class="fl dInline pNum">
                                                <font>租期：9天</font><br> <span class="num nBlue">99 </span>
                                                <font> /日</font>
                                            </div>
                                            <span class="num1 fl" style="height:43px;padding-top:10px;">
                                                    <em>取车门店：八万人体育场店</em><br>
                                                    <em>取车地址：上海上海市徐汇区斜土路2899号甲（光启文化广场内）</em>
                                                    <br>

                                                    <input type="hidden" class="CarValue_287"
                                                           value="{img:'/',id:'224',price:'28.2',status:'',title:'奥迪A4L 2013 款 2.0T CVT 35TFSI 技术型',url:'#'}">
                                                </span>
                                        </div>
                                    </div>
                                </li>
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
<div class="signpanel" style="z-index: 99;display: none; width: 400px;border:1px  rgb(59, 202, 171) solid;position: relative;left: 600px;top: -800px;background: #fff"><div class="signature" id="signature" style="background: #F6F6F6;margin: 0 auto;width:400px;height:300px;border: 1px rgb(59, 202, 171) solid;"></div><p style="text-align: center"><b style="color: red">请按着鼠标写字签名。</b></p><div class="btnss" style="text-align: center"><div class="layui-btn layui-btnyes" id="yes">确认</div><div class="layui-btn" id="reset">重写</div></div><div id="someelement"></div></div>
<script type="text/javascript" src="/statics/script/jSignature.min.js"></script>
<script src="https://cdn.bootcss.com/html2canvas/0.5.0-beta4/html2canvas.min.js"></script>


<script type="text/javascript" src="/statics/script/users/orderSign.js"></script>
<script type="text/javascript" src="/statics/script/user.js"></script>
<%@ include file="common/footer.jsp"%>

<script>
    $(".selectShop").click(function () {
        location.href = "/shopByCity/成都"
    });
    $("#timebtn").click(function () {
        $(".logindemoBg2").fadeOut();
        // $("#timebtn").submit();
    });
    $(".cs-q4").click(function () {
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
                btn: ['支付'],
                yes:function(index){
                    layer.msg('请稍候...', {
                        icon: 6,
                        shade: [0.5, '#f5f5f5'],
                        time:200},function (index) {
                        layer.msg("订单已完成",{icon: 1,time:300},function(index){
                            // $(".bg110").show();
                            // $(".verifyformBg").fadeIn();
                        });
                    });
                    layer.close(index)
                },

                content: '<div class="layui-form-item" style="margin:20px"><label class="layui-form-label">订单id:</label>' +
                    '<div class="layui-input-block"><input type="text" name="title" autocomplete="off" class="layui-input" value="1121" style="width:100px;" readonly="readonly"></div>' +
                    '<label class="layui-form-label">￥费用统计:</label><div class="layui-input-block"><input type="text" name="title" autocomplete="off" class="layui-input" value="1121" style="width:100px;" readonly="readonly"></div>' +
                    '<div class="renewtime" style="margin-top:10px;"><label class="layui-form-label">上传车辆照片</label><div class="layui-input-block">' +
                    '<input type="file" name="title" autocomplete="off" class="layui-input" style="width:150px;"></div></div>' +
                    '<div class="renewtime" style="margin-top:10px;"><label class="layui-form-label">还车地址:</label><div class="layui-input-block" style="padding-top: 11px">' +
                    '<p style="margin-bottom: 5px;width:180px;">啊达瓦达瓦法网发无法无大苏打实打实大苏打法哇法网发</p></div></div>'
            });
        });
    });
    $(".cs-q3").click(function () {
        // $(".logindemoBg2").fadeIn();
        layer.msg('获取信息中...',{icon: 6,
            shade: [0.5, '#f5f5f5'],
            time:200},function () {
            layer.open({
                type: 1,
                title: ' 续租订单 ',
                skin: 'layui-layer-demo', //样式类名
                closeBtn: 0, //不显示关闭按钮
                anim: 2,
                shadeClose: true, //开启遮罩关闭
                // btn: ['确定'],
                yes:function(index){
                    layer.msg('请稍候...', {
                        icon: 6,
                        shade: [0.5, '#f5f5f5'],
                        time:200},function (index) {
                        layer.msg("支付费用",{icon: 1,time:300},function(index){
                            $(".bg110").show();
                            $(".verifyformBg").fadeIn();
                        });
                    });
                    layer.close(index)
                },
                content: '<div class="layui-form-item" style="margin:20px"><label class="layui-form-label">订单id:</label><div class="layui-input-block">' +
                    '<input type="text" name="title" autocomplete="off" class="layui-input" value="1121" style="width:100px;" readonly="readonly"></div>' +
                    '<div class="renewtime" style="margin-top:10px;"><label class="layui-form-label">续租日期</label><div class="layui-input-block">' +
                    '<input type="date" name="title" autocomplete="off" class="layui-input renewdate" style="width:150px;"></div>' +
                    '</div><button type="button" class="layui-btn" style="margin:17px 0px -6px 143px">确定</button></div>'
            });
        });
    });

</script>
</body>
</html>
