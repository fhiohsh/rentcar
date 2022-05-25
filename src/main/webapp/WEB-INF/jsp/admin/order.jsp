<%--
  Created by IntelliJ IDEA.
  User: Fh
  Date: 2022/5/22
  Time: 23:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@ include file="adpath.jsp"%>
    <link rel="stylesheet" type="text/css" href="/statics/layui/css/layui.css"/>
    <script type="text/javascript" src="/statics/layui/layui.js"></script>
</head>
<body>
<div class="dvcontent">
    <div>
        <!--tab start-->
        <div class="formorder" style="font-weight:bold;color:rgb(30, 64, 67);">
            <form action="#" method="POST" style="margin: 30px;">
                <span>已完成订单编号：</span>
                <input name="order_key_b" placeholder="请输入订单编号" style="height: 40px;width: 180px;margin-right: 10px;padding: 10px;">
                <span>预定车型：</span>
                <select name="car_type_b" style="height: 40px;width: 120px;margin-right: 20px;">
                    <option value="a">所有</option>
                    <option value="b">SUV</option>
                    <option value="c">轿车</option>
                    <option value="d">跑车</option>
                </select>
                <span>订单时间：</span>
                <input name="order_date_b" type="date" style="height: 40px;width: 180px;margin-right: 10px;">
                <span>承租人：</span>
                <input name="rent_key_b" placeholder="请输入承租人姓名" style="height: 40px;width: 180px;margin-right: 10px;padding: 10px;">
                <input name="order_search_b" type="submit" value="查询订单">
            </form>
        </div>

        <div class="tabs">
            <div class="hd">
                <ul>
                    <li style="box-sizing: initial;-webkit-box-sizing: initial;" class="on">全部订单</li>
                    <li style="box-sizing: initial;-webkit-box-sizing: initial;" class="on">待取车</li>
                    <li style="box-sizing: initial;-webkit-box-sizing: initial;" class="on">待还车</li>
                    <li style="box-sizing: initial;-webkit-box-sizing: initial;" class="on">已退订</li>
                    <li style="box-sizing: initial;-webkit-box-sizing: initial;" class="on">已完成</li>
                </ul>
            </div>
<%--            --%>
            <div class="bd">
                <ul style="display: block;padding: 2px;">

                    <li>
                        <!--分页显示角色信息 start-->
                        <div id="dv1">
                            <table class="table" id="tbRecord">
                                <thead>
                                <tr>
                                    <th>all订单编号</th>
                                    <th style="white-space:nowrap">订单时间</th>
                                    <th style="white-space:nowrap">承租人</th>
                                    <th style="white-space:nowrap">取还车时间</th>
                                    <th style="white-space:nowrap">取还车地址</th>
                                    <th style="white-space:nowrap">租期</th>
                                    <th style="white-space:nowrap">预定车型</th>
                                    <th style="white-space:nowrap">支付金额</th>
                                    <th style="white-space:nowrap">押金金额</th>
                                    <th style="white-space:nowrap">订单状态</th>
                                    <th style="white-space:nowrap">合同</th>
                                    <th style="white-space:nowrap">操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>20220325</td>
                                    <td>2022-03-25</td>
                                    <td>张三 13434343</td>
                                    <td><span>取车：2022-09-08 9：00</span><br>&nbsp;&nbsp;&nbsp;&nbsp;
                                        <span>还车：2022-09-10 9：00</span></td>
                                    <td><span>取 门店：武侯区汽车之家射丢丢丢丢帝都丢</span><br>&nbsp;&nbsp;&nbsp;&nbsp;
                                        <span>还 门店：武侯区汽车之家</span></td>
                                    <td>2天</td>
                                    <td>奥迪Q7</td>
                                    <td>$200</td>
                                    <td>$100</td>
                                    <td><span>待取车</span></td>
                                    <!-- <td class="edit"><button onclick="btn_edit(1)"><i
                                                class="icon-edit bigger-120"></i>编辑</button></td>
                                    <td class="delete"><button onclick="btn_delete(1)"><i
                                                class="icon-trash bigger-120"></i>删除</button></td> -->

                                    <td><button class="printcontract" onclick="btn_msg()">打印合同</button></td>
                                    <td class="delete"><button onclick="btn_delete(1)"><i
                                            class="icon-trash bigger-120"></i>取车</button><br>&nbsp;&nbsp;&nbsp;&nbsp;
                                        <button onclick="btn_delete(1)"><i
                                                class="icon-trash bigger-120"></i>修改</button></td>
                                </tr>
                                <tr>
                                    <td>20220326</td>
                                    <td>2022-03-26</td>
                                    <td>张三 13434343</td>
                                    <td><span>取车：2022-09-08 9：00</span><br>&nbsp;&nbsp;&nbsp;&nbsp;
                                        <span>还车：2022-09-10 9：00</span></td>
                                    <td><span>取 门店：武侯区汽车之家</span><br>&nbsp;&nbsp;&nbsp;&nbsp;
                                        <span>还 门店：武侯区汽车之家</span></td>
                                    <td>2天</td>
                                    <td>奥迪Q7</td>
                                    <td>$200</td>
                                    <td>$100</td>
                                    <td><span>待还车</span></td>
                                    <!-- <td class="edit"><button onclick="btn_edit(1)"><i
                                                class="icon-edit bigger-120"></i>编辑</button></td>
                                    <td class="delete"><button onclick="btn_delete(1)"><i
                                                class="icon-trash bigger-120"></i>删除</button></td> -->

                                    <td><button class="printcontract">打印合同</button></td>
                                    <td class="delete"><button onclick="btn_delete(1)"><i
                                            class="icon-trash bigger-120"></i>取车</button><br>&nbsp;&nbsp;&nbsp;&nbsp;
                                        <button onclick="btn_delete(1)"><i
                                                class="icon-trash bigger-120"></i>修改</button></td>
                                </tr>
                                <tr>
                                    <td>20220327</td>
                                    <td>2022-03-25</td>
                                    <td>张三 13434343</td>
                                    <td><span>取车：2022-09-08 9：00</span><br>&nbsp;&nbsp;&nbsp;&nbsp;
                                        <span>还车：2022-09-10 9：00</span></td>
                                    <td><span>取 门店：武侯区汽车之家</span><br>&nbsp;&nbsp;&nbsp;&nbsp;
                                        <span>还 门店：武侯区汽车之家</span></td>
                                    <td>2天</td>
                                    <td>奥迪Q7</td>
                                    <td>$200</td>
                                    <td>$100</td>
                                    <td><span>待取车</span></td>
                                    <td><button class="printcontract">打印合同</button></td>
                                    <td class="delete"><button onclick="btn_delete(1)"><i
                                            class="icon-trash bigger-120"></i>取车</button><br>&nbsp;&nbsp;&nbsp;&nbsp;
                                        <button onclick="btn_delete(1)"><i
                                                class="icon-trash bigger-120"></i>修改</button></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <!--分页显示角色信息 end-->
                    </li>
                </ul>
                <ul style="display: block;padding: 2px;">

                    <li>
                        <!--分页显示角色信息 start-->
                        <div id="dv1d">
                            <table class="table" id="tbRecordd">
                                <thead>
                                <tr>
                                    <th>待取订单编号</th>
                                    <th style="white-space:nowrap">订单时间</th>
                                    <th style="white-space:nowrap">承租人</th>
                                    <th style="white-space:nowrap">取还车时间</th>
                                    <th style="white-space:nowrap">取还车地址</th>
                                    <th style="white-space:nowrap">租期</th>
                                    <th style="white-space:nowrap">预定车型</th>
                                    <th style="white-space:nowrap">支付金额</th>
                                    <th style="white-space:nowrap">押金金额</th>
                                    <th style="white-space:nowrap">订单状态</th>
                                    <th style="white-space:nowrap">合同</th>
                                    <th style="white-space:nowrap">操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>20220330</td>
                                    <td>2022-03-25</td>
                                    <td>张三 13434343</td>
                                    <td><span>取车：2022-09-08 9：00</span><br>&nbsp;&nbsp;&nbsp;&nbsp;
                                        <span>还车：2022-09-10 9：00</span></td>
                                    <td><span>取 门店：武侯区汽车之家</span><br>&nbsp;&nbsp;&nbsp;&nbsp;
                                        <span>还 门店：武侯区汽车之家</span></td>
                                    <td>2天</td>
                                    <td>奥迪Q7</td>
                                    <td>$200</td>
                                    <td>$100</td>
                                    <td><span>待取车</span></td>
                                    <!-- <td class="edit"><button onclick="btn_edit(1)"><i
                                                class="icon-edit bigger-120"></i>编辑</button></td>
                                    <td class="delete"><button onclick="btn_delete(1)"><i
                                                class="icon-trash bigger-120"></i>删除</button></td> -->

                                    <td><button class="printcontract">打印合同</button></td>
                                    <td class="delete"><button onclick="btn_delete(1)"><i
                                            class="icon-trash bigger-120"></i>取车</button><br>&nbsp;&nbsp;&nbsp;&nbsp;
                                        <button onclick="btn_delete(1)"><i
                                                class="icon-trash bigger-120"></i>修改</button></td>
                                </tr>
                                </tbody>

                            </table>
                        </div>
                        <!--分页显示角色信息 end-->
                    </li>
                </ul>


                <ul style="display: block;padding: 2px;">

                    <li>
                        <!--分页显示角色信息 start-->
                        <div id="dv123">
                            <table class="table" id="tbRecord1">
                                <thead>
                                <tr>
                                    <th>待还车订单编号</th>
                                    <th style="white-space:nowrap">订单时间</th>
                                    <th style="white-space:nowrap">承租人</th>
                                    <th style="white-space:nowrap">取还车时间</th>
                                    <th style="white-space:nowrap">取还车地址</th>
                                    <th style="white-space:nowrap">租期</th>
                                    <th style="white-space:nowrap">预定车型</th>
                                    <th style="white-space:nowrap">支付金额</th>
                                    <th style="white-space:nowrap">押金金额</th>
                                    <th style="white-space:nowrap">订单状态</th>
                                    <th style="white-space:nowrap">合同</th>
                                    <th style="white-space:nowrap">操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>20220401</td>
                                    <td>2022-03-25</td>
                                    <td>张三 13434343</td>
                                    <td><span>取车：2022-09-08 9：00</span><br>&nbsp;&nbsp;&nbsp;&nbsp;
                                        <span>还车：2022-09-10 9：00</span></td>
                                    <td><span>取 门店：武侯区汽车之家</span><br>&nbsp;&nbsp;&nbsp;&nbsp;
                                        <span>还 门店：武侯区汽车之家</span></td>
                                    <td>2天</td>
                                    <td>奥迪Q7</td>
                                    <td>$200</td>
                                    <td>$100</td>
                                    <td><span>待还车</span></td>
                                    <!-- <td class="edit"><button onclick="btn_edit(1)"><i
                                                class="icon-edit bigger-120"></i>编辑</button></td>
                                    <td class="delete"><button onclick="btn_delete(1)"><i
                                                class="icon-trash bigger-120"></i>删除</button></td> -->

                                    <td><button class="printcontract">打印合同</button></td>
                                    <td class="delete"><button onclick="btn_delete(1)"><i
                                            class="icon-trash bigger-120"></i>取车</button><br>&nbsp;&nbsp;&nbsp;&nbsp;
                                        <button onclick="btn_delete(1)"><i
                                                class="icon-trash bigger-120"></i>修改</button></td>
                                </tr>
                                </tbody>

                            </table>
                        </div>
                        <!--分页显示角色信息 end-->
                    </li>
                </ul>
                <ul style="display: block;padding: 2px;">

                    <li>
                        <!--分页显示角色信息 start-->
                        <div id="dvs">
                            <table class="table" id="tbRecords">
                                <thead>
                                <tr>
                                    <th>已退订订单编号</th>
                                    <th style="white-space:nowrap">订单时间</th>
                                    <th style="white-space:nowrap">承租人</th>
                                    <th style="white-space:nowrap">取还车时间</th>
                                    <th style="white-space:nowrap">取还车地址</th>
                                    <th style="white-space:nowrap">租期</th>
                                    <th style="white-space:nowrap">预定车型</th>
                                    <th style="white-space:nowrap">支付金额</th>
                                    <th style="white-space:nowrap">押金金额</th>
                                    <th style="white-space:nowrap">订单状态</th>
                                    <th style="white-space:nowrap">合同</th>
                                    <th style="white-space:nowrap">操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>20220401</td>
                                    <td>2022-03-25</td>
                                    <td>张三 13434343</td>
                                    <td><span>取车：2022-09-08 9：00</span><br>&nbsp;&nbsp;&nbsp;&nbsp;
                                        <span>还车：2022-09-10 9：00</span></td>
                                    <td><span>取 门店：武侯区汽车之家</span><br>&nbsp;&nbsp;&nbsp;&nbsp;
                                        <span>还 门店：武侯区汽车之家</span></td>
                                    <td>2天</td>
                                    <td>奥迪Q7</td>
                                    <td>$200</td>
                                    <td>$100</td>
                                    <td><span>待还车</span></td>
                                    <!-- <td class="edit"><button onclick="btn_edit(1)"><i
                                                class="icon-edit bigger-120"></i>编辑</button></td>
                                    <td class="delete"><button onclick="btn_delete(1)"><i
                                                class="icon-trash bigger-120"></i>删除</button></td> -->

                                    <td><button class="printcontract">打印合同</button></td>
                                    <td class="delete"><button onclick="btn_delete(1)"><i
                                            class="icon-trash bigger-120"></i>取车</button><br>&nbsp;&nbsp;&nbsp;&nbsp;
                                        <button onclick="btn_delete(1)"><i
                                                class="icon-trash bigger-120"></i>修改</button></td>
                                </tr>
                                </tbody>

                            </table>
                        </div>
                        <!--分页显示角色信息 end-->
                    </li>
                </ul>
                <ul style="display: block;padding: 2px;">

                    <li>
                        <!--分页显示角色信息 start-->
                        <div id="dv12">
                            <table class="table" id="tbRecord2">
                                <thead>
                                <tr>
                                    <th>已完成订单编号</th>
                                    <th style="white-space:nowrap">订单时间</th>
                                    <th style="white-space:nowrap">承租人</th>
                                    <th style="white-space:nowrap">取还车时间</th>
                                    <th style="white-space:nowrap">取还车地址</th>
                                    <th style="white-space:nowrap">租期</th>
                                    <th style="white-space:nowrap">预定车型</th>
                                    <th style="white-space:nowrap">支付金额</th>
                                    <th style="white-space:nowrap">押金金额</th>
                                    <th style="white-space:nowrap">订单状态</th>
                                    <th style="white-space:nowrap">合同</th>
                                    <th style="white-space:nowrap">操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>20220401</td>
                                    <td>2022-03-25</td>
                                    <td>张三 13434343</td>
                                    <td><span>取车：2022-09-08 9：00</span><br>&nbsp;&nbsp;&nbsp;&nbsp;
                                        <span>还车：2022-09-10 9：00</span></td>
                                    <td><span>取 门店：武侯区汽车之家</span><br>&nbsp;&nbsp;&nbsp;&nbsp;
                                        <span>还 门店：武侯区汽车之家</span></td>
                                    <td>2天</td>
                                    <td>奥迪Q7</td>
                                    <td>$200</td>
                                    <td>$100</td>
                                    <td><span>待还车</span></td>
                                    <!-- <td class="edit"><button onclick="btn_edit(1)"><i
                                                class="icon-edit bigger-120"></i>编辑</button></td>
                                    <td class="delete"><button onclick="btn_delete(1)"><i
                                                class="icon-trash bigger-120"></i>删除</button></td> -->

                                    <td><button class="printcontract">打印合同</button></td>
                                    <td class="delete"><button onclick="btn_delete(1)"><i
                                            class="icon-trash bigger-120"></i>取车</button><br>&nbsp;&nbsp;&nbsp;&nbsp;
                                        <button onclick="btn_delete(1)"><i
                                                class="icon-trash bigger-120"></i>修改</button></td>
                                </tr>
                                <tr>
                                    <td>20220402</td>
                                    <td>2022-03-25</td>
                                    <td>张三 13434343</td>
                                    <td><span>取车：2022-09-08 9：00</span><br>&nbsp;&nbsp;&nbsp;&nbsp;
                                        <span>还车：2022-09-10 9：00</span></td>
                                    <td><span>取 门店：武侯区汽车之家</span><br>&nbsp;&nbsp;&nbsp;&nbsp;
                                        <span>还 门店：武侯区汽车之家</span></td>
                                    <td>2天</td>
                                    <td>奥迪Q7</td>
                                    <td>$200</td>
                                    <td>$100</td>
                                    <td><span>待还车</span></td>
                                    <!-- <td class="edit"><button onclick="btn_edit(1)"><i
                                                class="icon-edit bigger-120"></i>编辑</button></td>
                                    <td class="delete"><button onclick="btn_delete(1)"><i
                                                class="icon-trash bigger-120"></i>删除</button></td> -->

                                    <td><button class="printcontract" onclick="btn_msg()">打印合同</button></td>
                                    <td class="delete"><button onclick="btn_delete(1)"><i
                                            class="icon-trash bigger-120"></i>取车</button><br>&nbsp;&nbsp;&nbsp;&nbsp;
                                        <button onclick="btn_delete(1)"><i
                                                class="icon-trash bigger-120"></i>修改</button></td>
                                </tr>
                                </tbody>

                            </table>
                        </div>
                        <!--分页显示角色信息 end-->
                    </li>
                </ul>

            </div>
        </div>
        <!--tab end-->
    </div>
</div>
<script>
    var num = 1;
    $(function() {

        $(".tabs").slide({
            trigger: "click"
        });

    });
    var btn_msg = function () {
        layer.msg("打印开始~");
    };
    var btn_save = function() {
        var pid = $("#RawMaterialsTypePageId  option:selected").val();
        var name = $("#RawMaterialsTypeName").val();
        var desc = $("#RawMaterialsTypeDescription").val();
        var ramark = $("#Ramark").val();
        $.ajax({
            type: "post",
            url: "/RawMaterialsType/AddRawMaterialsType",
            data: {
                name: name,
                pid: pid,
                desc: desc,
                ramark: ramark
            },
            success: function(data) {
                if (data > 0) {
                    $.jq_Alert({
                        message: "添加成功",
                        btnOktext: "确认",
                        dialogModal: true,
                        btnOkClick: function() {
                            //$("#RawMaterialsTypeName").val("");
                            //$("#RawMaterialsTypeDescription").val("");
                            //$("#Ramark").val("");
                            //page1();
                            location.reload();

                        }
                    });
                }
            }
        });
        alert(t);
    }

    var btn_edit = function(id) {
        $.jq_Panel({
            url: "/RawMaterialsType/EditRawMaterialsType?id=" + id,
            title: "编辑分类",
            dialogModal: true,
            iframeWidth: 500,
            iframeHeight: 400
        });
    }
    var btn_delete = function(id) {
        $.jq_Confirm({
            message: "您确定要删除吗?",
            btnOkClick: function() {
                $.ajax({
                    type: "post",
                    url: "/RawMaterialsType/DeleteRawMaterialsType",
                    data: {
                        id: id
                    },
                    success: function(data) {
                        if (data > 0) {
                            $.jq_Alert({
                                message: "删除成功",
                                btnOkClick: function() {
                                    page1();
                                }
                            });
                        }
                    }
                });
            }
        });
    }
</script>
</body>
</html>
