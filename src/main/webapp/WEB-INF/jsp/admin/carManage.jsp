<%--
  Created by IntelliJ IDEA.
  User: Fh
  Date: 2022/5/23
  Time: 9:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@ include file="adpath.jsp"%>
    <link rel="stylesheet" type="text/css" href="<%=cssUrl%>custom.popup-v2.0.css"/>
    <script type="text/javascript" src="<%=jsUrl%>jquery.custom.popup-v2.0.js"></script>
</head>
<body>
<div class="dvcontent">
    <div>
        <!--tab start-->
        <div class="tabs">
            <div class="hd">
                <ul>
                    <li class="on" style="box-sizing: initial;-webkit-box-sizing: initial;">车辆管理</li>
                    <li class="on" style="box-sizing: initial;-webkit-box-sizing: initial;">车辆调度</li>
                    <li class="on" style="box-sizing: initial;-webkit-box-sizing: initial;">添加车辆</li>
                </ul>
            </div>
            <div class="bd">
                <ul style="display: block;padding: 20px;">
                    <form action="#" method="POST" style="margin-top: 10px;margin-bottom: 10px;">
                        <span>车型：</span>
                        <select name="car_type" style="height: 40px;width: 120px;margin-right: 10px;">
                            <option value="a">所有</option>
                            <option value="b">SUV</option>
                            <option value="c">轿车</option>
                            <option value="d">跑车</option>
                        </select>
                        <span>所在门店：</span>
                        <select name="car_shop" style="height: 40px;width: 120px;margin-right: 10px;">
                            <option value="a">所有</option>
                            <option value="b">一分店</option>
                            <option value="c">二分店</option>
                            <option value="d">三分店</option>
                        </select>
                        <span>车牌号：</span>
                        <input name="car_key" placeholder="请输入车牌号" style="height: 40px;width: 180px;margin-right: 10px;">
                        <span>地址：</span>
                        <input name="address_key" placeholder="请输入车辆所在地址" style="height: 40px;width: 180px;margin-right: 10px;">
                        <input name="car_search" type="submit" value="查询车辆">
                    </form>
                    <li>
                        <!--分页显示角色信息 start-->
                        <div id="dv1">
                            <table class="table" id="tbRecord">
                                <thead>
                                <tr>
                                    <th>车辆编号</th>
                                    <th>照片</th>
                                    <th>车型</th>
                                    <th>车辆品牌</th>
                                    <th>车牌号码</th>
                                    <th>所在门店</th>
                                    <th>当前里程数</th>
                                    <th>油箱容量</th>
                                    <th>车身颜色</th>
                                    <th>运营状态</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>001</td>
                                    <td>未上传</td>
                                    <td>SUV</td>
                                    <td>奥迪Q7</td>
                                    <td>川A·88888</td>
                                    <td>武侯区汽车之家</td>
                                    <td>1000km</td>
                                    <td>73L</td>
                                    <td>蓝色</td>
                                    <td><span>租赁中</span></td>
                                    <td class="checkpic"><button onclick="btn_edit(1)"><i
                                            class="icon-edit bigger-120"></i>修改信息</button><br>&nbsp;&nbsp;&nbsp;&nbsp;
                                        <button onclick="btn_edit(1)"><i
                                                class="icon-edit bigger-120"></i><a href="EditCar.html"
                                                                                    style="color:aliceblue;">租金设置</a></button><br>&nbsp;&nbsp;&nbsp;&nbsp;
                                        <button onclick="btn_delete(1)"><i
                                                class="icon-trash bigger-120"></i>删除此车</button></td>
                                </tr>

                                <tr>
                                    <td>002</td>
                                    <td>未上传</td>
                                    <td>SUV</td>
                                    <td>奥迪Q7</td>
                                    <td>川A·88887</td>
                                    <td>武侯区汽车之家</td>
                                    <td>1000km</td>
                                    <td>73L</td>
                                    <td>白色</td>
                                    <td><span>租赁中</span></td>
                                    <td class="checkpic"><button onclick="btn_edit(1)"><i
                                            class="icon-edit bigger-120"></i>修改信息</button><br>&nbsp;&nbsp;&nbsp;&nbsp;
                                        <button onclick="btn_edit(1)"><i
                                                class="icon-edit bigger-120"></i><a href="EditCar.html"
                                                                                    style="color:aliceblue;">租金设置</a></button><br>&nbsp;&nbsp;&nbsp;&nbsp;
                                        <button onclick="btn_delete(1)"><i
                                                class="icon-trash bigger-120"></i>删除此车</button></td>
                                </tr>

                                <tr>
                                    <td>003</td>
                                    <td>未上传</td>
                                    <td>SUV</td>
                                    <td>奥迪Q7</td>
                                    <td>川A·88889</td>
                                    <td>武侯区汽车之家</td>
                                    <td>1000km</td>
                                    <td>73L</td>
                                    <td>银色</td>
                                    <td><span>未租赁</span></td>
                                    <td class="checkpic"><button onclick="btn_edit(1)"><i
                                            class="icon-edit bigger-120"></i>修改信息</button><br>&nbsp;&nbsp;&nbsp;&nbsp;
                                        <button onclick="btn_edit(1)"><i
                                                class="icon-edit bigger-120"></i><a href="EditCar.html"
                                                                                    style="color:aliceblue;">租金设置</a></button><br>&nbsp;&nbsp;&nbsp;&nbsp;
                                        <button onclick="btn_delete(1)"><i
                                                class="icon-trash bigger-120"></i>删除此车</button></td>
                                </tr>

                                </tbody>

                            </table>
                        </div>
                        <!--分页显示角色信息 end-->
                    </li>
                </ul>


                <ul style="display: block;padding: 20px;">
                    <form action="#" method="POST" style="margin-top: 10px;margin-bottom: 10px;">
                        <span>车型：</span>
                        <select name="car_type_c" style="height: 40px;width: 120px;margin-right: 10px;">
                            <option value="a">所有</option>
                            <option value="b">SUV</option>
                            <option value="c">轿车</option>
                            <option value="d">跑车</option>
                        </select>
                        <span>所在门店：</span>
                        <select name="car_shop_c" style="height: 40px;width: 120px;margin-right: 10px;">
                            <option value="a">所有</option>
                            <option value="b">一分店</option>
                            <option value="c">二分店</option>
                            <option value="d">三分店</option>
                        </select>
                        <span>车牌号：</span>
                        <input name="car_key_c" placeholder="请输入车牌号" style="height: 40px;width: 180px;margin-right: 10px;">
                        <span>地址：</span>
                        <input name="address_key_c" placeholder="请输入车辆所在地址" style="height: 40px;width: 180px;margin-right: 10px;">
                        <input name="car_search_c" type="submit" value="查询车辆">
                    </form>
                    <li>
                        <!--分页显示角色信息 start-->
                        <div id="dvs">
                            <table class="table" id="tbRecords">
                                <thead>
                                <tr>
                                    <th>车辆编号</th>
                                    <th>照片</th>
                                    <th>车型</th>
                                    <th>车辆品牌</th>
                                    <th>车牌号码</th>
                                    <th>所在门店</th>
                                    <th>地址</th>
                                    <th>门店联系电话</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>001</td>
                                    <td>未上传</td>
                                    <td>SUV</td>
                                    <td>奥迪Q7</td>
                                    <td>川A·88888</td>
                                    <td>武侯区汽车之家</td>
                                    <td>欢乐谷</td>
                                    <td>199323232</td>
                                    <td class="checkpic">
                                        <button onclick="showPopup(1,'<span>指派人员</span>&nbsp;<select><option>张三</option><option>李四</option><option>王五</option></select>&nbsp;&nbsp;&nbsp;<span>门店</span>&nbsp;<select><option>一分店</option><option>二分店</option><option>三分店</option></select>');">
                                            <i class="icon-trash bigger-120"></i>调度</button></td>
                                </tr>


                                </tbody>

                            </table>
                        </div>
                        <!--分页显示角色信息 end-->
                    </li>
                </ul>

                <ul class="theme-popbod dform" style="display: none;">
                    <div class="am-cf admin-main" style="padding-top: 0px;">
                        <!-- content start -->
                        <div class="am-cf admin-main" style="padding-top: 0px;">
                            <!-- content start -->
                            <div class="admin-content">
                                <div class="admin-content-body">

                                    <div class="am-g">
                                        <div class="am-u-sm-12 am-u-md-4 am-u-md-push-8">

                                        </div>
                                        <div class="am-u-sm-12 am-u-md-8 am-u-md-pull-4" style="padding-top: 30px;">
                                            <form class="am-form am-form-horizontal" action="user/addUser1Submit.action" method="post">

                                                <div class="am-form-group">
                                                    <label class="am-u-sm-3 am-form-label">
                                                        车辆编号</label>
                                                    <div class="am-u-sm-9">
                                                        <input type="text" id="car-id" name="car-id" required placeholder="车辆编号" name="name">
                                                    </div>
                                                </div>
                                                <div class="am-form-group">
                                                    <label class="am-u-sm-3 am-form-label">
                                                        照片</label>
                                                    <div class="am-u-sm-9">
                                                        <p class="layui-upload-list">
                                                            <!--预览图片-->
                                                            <img class="layui-upload-img" id="demo1" src="img/car/car1.jpg">
                                                            <!--提示上传信息-->
                                                        <p id="demoText"></p>
                                                        </p>
                                                        <!-- <button class="layui-btn" id="choose">选择文件</button> -->
                                                        <input class="layui-upload-file" id="car-photo" name="car-photo" style="width: 200px;" type="file" accept="undefined" id="choose" name="file">
                                                        <button type="button" class="layui-btn" id="load">上传</button>
                                                    </div>
                                                </div>
                                                <div class="am-form-group">
                                                    <label class="am-u-sm-3 am-form-label">
                                                        车型</label>
                                                    <div class="am-u-sm-9">
                                                        <input type="text" id="car-model" name="car-model" required placeholder="车型" name="name">
                                                    </div>
                                                </div>
                                                <div class="am-form-group">
                                                    <label class="am-u-sm-3 am-form-label">
                                                        车辆品牌</label>
                                                    <div class="am-u-sm-9">
                                                        <input type="text" id="car-brand" name="car-brand" required placeholder="车辆品牌" name="name">
                                                    </div>
                                                </div>
                                                <div class="am-form-group">
                                                    <label class="am-u-sm-3 am-form-label">
                                                        车牌号码</label>
                                                    <div class="am-u-sm-9">
                                                        <input type="text" id="car-licence" name="car-licence" required placeholder="车牌号码" name="name">
                                                    </div>
                                                </div>
                                                <div class="am-form-group">
                                                    <label class="am-u-sm-3 am-form-label">
                                                        所在门店</label>
                                                    <div class="am-u-sm-9">
                                                        <select>
                                                            <option>一分店</option>
                                                            <option>二分店</option>
                                                            <option>三分店</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="am-form-group">
                                                    <label class="am-u-sm-3 am-form-label">
                                                        当前里程数</label>
                                                    <div class="am-u-sm-9">
                                                        <input type="text" id="car-mileage" name="car-mileage" required placeholder="当前里程数" name="name">
                                                    </div>
                                                </div>
                                                <div class="am-form-group">
                                                    <label class="am-u-sm-3 am-form-label">
                                                        油箱容量</label>
                                                    <div class="am-u-sm-9">
                                                        <input type="text" id="car-capacity" name="car-capacity" required placeholder="油箱容量" name="name">
                                                    </div>
                                                </div>
                                                <div class="am-form-group">
                                                    <label class="am-u-sm-3 am-form-label">
                                                        车身颜色</label>
                                                    <div class="am-u-sm-9">
                                                        <input type="text" id="car-color" name="car-color" required placeholder="车身颜色" name="name">
                                                    </div>
                                                </div>
                                                <div class="am-form-group">
                                                    <label class="am-u-sm-3 am-form-label">
                                                        备注</label>
                                                    <div class="am-u-sm-9">
                                                        <textarea class="" rows="3" id="car-remarks" name="remark" placeholder="输入备注"></textarea>
                                                        <small>100字以内...</small>
                                                    </div>
                                                </div>
                                                <div class="am-form-group">
                                                    <div class="am-u-sm-9 am-u-sm-push-3">
                                                        <input type="submit" class="am-btn am-btn-success" value="添加车辆🚗" />
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- content end -->
                        </div>
                      </div>

                </ul>
                <!-- end-->
            </div>
        </div>
        <!--tab end-->
    </div>
</div>


<%--<script type="text/javascript" src="<%=jsUrl%>common.js"></script>--%>
<script type="text/javascript" src="<%=jsUrl%>layui.all.js"></script>
<script>
    var num = 1;
    $(function() {

        $(".tabs").slide({
            trigger: "click"
        });

    });

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
    var dispatch = function(id) {
        $.jq_Confirm({
            message: "您确定要调度吗?",
            btnOkClick: function() {
                alert("nihao")
            }
        });
    }

    var mypops = new Array(1);

    $(function() {
        mypops[1] = $.initPopup({
            buttonAlign: "center"
        })
            .addButton("确定", function() {
                alert("调度成功！");
            }).addButton("取消");
    });

    var sonOfpop39;

    function showPopup(index, content) {


        mypops[index].showPopup(content);
    }
</script>
<script type="text/javascript" src="js/layui.all.js"></script>
<script>
    layui.use(['upload', 'jquery'], function() {
        var $ = layui.$,
            upload = layui.upload;

        //普通图片上传
        var uploadInst = upload.render({
            elem: '#car-photo', //选择文件的DOM对象

            auto: false, //选择文件后不自动上传

            bindAction: '#load', //指向一个按钮触发上传

            url: '/upload/',
            choose: function(obj) { //选择文件的回调，obj为选中的文件
                //将每次选择的文件追加到文件队列
                var files = obj.pushFile();

                //预览选中的文件（本地文件）
                obj.preview(function(index, file, result) {
                    $('#demo1').attr('src', result);
                });
            },
            before: function(obj) { //文件上传前的回调

            },
            done: function(res) {
                //如果上传失败
                if (res.code > 0) {
                    return layer.msg('上传失败');
                }
                //上传成功
            },
            error: function() {
                //演示失败状态，并实现重传
                var demoText = $('#demoText');
                demoText.html('<span style="color: #FF5722;">上传失败!</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
                demoText.find('.demo-reload').on('click', function() {
                    uploadInst.upload();
                });
            }
        });
    });
</script>
</body>
</html>
