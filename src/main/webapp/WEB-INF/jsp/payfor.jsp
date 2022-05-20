<%--
  Created by IntelliJ IDEA.
  User: Fh
  Date: 2022/5/19
  Time: 15:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="/statics/css/charge.css">
    <link rel="stylesheet" type="text/css" href="/statics/css/self.css">
    <link rel="stylesheet" type="text/css" href="/statics/css/loginstyle.css">
    <script type="text/javascript" src="/statics/script/jquery-1.8.0.min.js"></script>
    <title>订单明细</title>
</head>
<body>
<%@ include file="common/header.jsp"%>
<div class="step2-progress-box">
    <div class="progress-percent"></div>
    <div class="progress-icon">
        <span class="progress-firsticon">1</span>
        <span class="progress-secondicon">2</span>
        <span class="progress-thirdicon">3</span>
    </div>
    <div class="progress-text">
        <span class="progress-firsttext">挑选车型</span>
        <span class="progress-secondtext">填写与核对订单</span>
        <span class="progress-thirdtext">成功提交</span>
    </div>
</div>
<div class="step2-wrap">
    <div class="step2-box">
        <div class="step2-box-left">
            <div class="order-info-box">
                <div class="car-image-box">
                    <img src="https://externalimage.1hai.cn/cartype/ea953fb306b970b9a435e426909c3a67.png"
                         alt="大众朗逸">
                    <span>租 期：<em id="rentprice"></em>天</span>
                </div>

                <div class="store-info-box">
                    <div class="car-name">
                        <a class="revise-back" href="/BrandStep2/421?carBrandId=2" target="_self"
                           title="修改">修改订单</a>
                        大众朗逸
                        <a class="car-info" href="javascript:void(0);"
                           data-cid="{'cartypeList':[421],'groupId':0}" id="cartypedetail">车辆详情&gt;</a>
                    </div>
                    <ul>
                        <li><span class="store-title">取车地点</span><span class="store-title">还车地点</span></li>
                        <li><span>取车门店：上海神旺大酒店送车点</span><span>还车门店：上海神旺大酒店送车点</span></li>
                        <li><span>取车时间：2022-04-27 10:00</span><span>还车时间：2022-04-29 10:00</span></li>
                        <li><span>取车地址：上海上海市徐汇区宜山路650号</span><span>还车地址：上海上海市徐汇区宜山路650号</span></li>
                        <li style="padding-top: 5px;"><span class="store-title">订单说明：</span></li>
                        <li class="rule-toggle">不限公里数，超时费按车辆租赁费及门店服务费均价÷6收取实际超期小时费 (部分0元活动订单，按照40元/小时进行收取)。<a
                                href="javascript:void(0);" id="gz">退改规则</a></li>
                        <li style="color: red;">温馨提示：<a
                                href="https://www.1hai.cn/NewHelp/HelpContent?menuId=20&amp;isLimitRules=True#77"
                                title="限行城市规则" style="color: red;" target="_blank">点击阅读限行城市规则</a></li>
                    </ul>
                </div>
            </div>
            <!-- 增值 -->
            <%@ include file="common/paymore.jsp"%>
        </div>

        <!-- 订单支付 -->
        <div class="step2-box-right" id="priceall">
            <div class="price-detail">
                <div class="title">
                    费用明细
                </div>
                <ul>
                    <li class="line-clear" id="baseRatePrice">
                        <em class="price-drop">
                            ￥142<i class="price-drop-open" style="display: block;"></i>
                            <i class="price-drop-close" style="display: none;"></i>
                        </em>车辆租赁费及门店服务费
                    </li>
                    <!--基本保障服务费-->
                    <li>
                        <em class="price-mid ">￥100</em>基本保障服务费
                        <span></span>
                        <span style="color:#666">基本保障服务费50元 * 2天</span>
                    </li>
                    <li id="servicePriceList">
                        <em class="price-drop">
                            ￥20
                            <i class="price-drop-open" style="display: block;"></i>
                            <i class="price-drop-close" style="display: none;"></i>
                        </em>其它服务费
                        <div class="price-drop-box" id="serviceList" style="display: none;">
                            <span>
                                <p class="orange">￥20</p>
                                <p>手续费</p>
                            </span>
                        </div>
                    </li>
                    <li id="promotionPriceList" class="hidelable">

                    </li>
                </ul>
                <div class="deposit_box">
                    <p>车辆保证金<em>（可退）</em><span>￥3000</span></p>
                    <p>违章押金<em>（可退）</em><span>￥2000</span></p>
                </div>
                <div class="price-box" id="totalAmount">
                    <span class="sub-load hidelable" id="priceloading"></span>
                    <span class="price-txt" id="priceTitle">总计:</span>
                    <span class="price-total" id="priceTotal"><em>￥</em>262</span>
                </div>

                <div class="price-btnbox">
                    <a href="javascript:;" title="提交订单" id="btnSubmit" class="btnSubmit">提交订单</a>
                    <span class="sub-load hidelable" id="loading"></span>
                </div>
                <div class="price-help">
                    <p style="display:none; border-bottom: 1px dashed #EB5A01; padding-bottom: 5px; margin-bottom: 5px;">
                        <b>此单可参加周年庆返现活动，您需支付整单金额，返还金额（基本租车费的50%）将在还车后3-5个工作日退还至您的一卡行账户</b>
                    </p>首次租车请使用本人信用卡，本人二代有效身份证，本人有效地方驾驶证正副本。<br>
                    <p>本订单仅为客户租车预约登记，提交该订单后，客户需要到门店办理具体租车手续，具体权利义务以签署的合同为准。</p>
                </div>
                <div id="LimitRemind"
                     style="border-top:1px solid #ccc; color: #EB5A01; background: #FFFCD2; padding: 15px; line-height:20px;display:none;">
                </div>
            </div>
        </div>
    </div>
</div>

<div class="paycode" style="z-index: 99;;display: none;width:400px;height: 300px;background: #fff;position: absolute;top: 150px;left: 40%;">
    <img src="/statics/images/qrcode.png" alt="">
    <span style="position: absolute;font-size: 27px;right: 20px;top: 30px;">扫码支付</span>
    <span style="position: absolute;font-size: 17px;right: 20px;top:270px;color: #EB5A01;">
        已<a href="/paysuccess">支付</a>完成？
            <a href="/usercenter" style="color: #4ab8b4;" target="_blank">点击查看订单</a>  </span>
</div>
<script>

    $(".btnSubmit").click(function () {
        $(".bg110").show();
        $(".paycode").fadeIn();
    });
</script>
<%@ include file="common/footer.jsp"%>
</body>
</html>