
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
    <%@ include file="adpath.jsp"%>
</head>
<body>
<div class="dvcontent">
    <div>
        <!--tab start-->
        <div class="tabs">
            <div class="hd">
                <ul>
                    <li style="box-sizing: initial;-webkit-box-sizing: initial;" class="on">查看门店</li>
                    <li class="on" style="box-sizing: initial;-webkit-box-sizing: initial;">添加门店</li>
                    <li style="box-sizing: initial;-webkit-box-sizing: initial;" class="on">查看店员</li>
                    <li style="box-sizing: initial;-webkit-box-sizing: initial;" class="on">添加店员</li>
                </ul>
            </div>
            <div class="bd">
                <!-- 门店列表 -->
                <ul style="display: block;padding: 20px;">
                    <form action="#" method="POST" style="margin-top: 10px;margin-bottom: 10px;">
                        <input name="shop_key" placeholder="请输入门店名称或地址"
                               style="height: 40px;width: 180px;margin-right: 10px;">
                        <input name="shop_search" type="submit" value="查询门店">
                    </form>
                    <li>
                        <!--分页显示角色信息 start-->
                        <div id="dv1">
                            <table class="table" id="tbRecord">
                                <thead>
                                <tr>
                                    <th>门店编号</th>
                                    <th>门店名称</th>
                                    <th>门店描述</th>
                                    <th>备注</th>
                                    <th>门店地址</th>
                                    <th>营业时间</th>
                                    <th>联系电话</th>
                                    <th>编辑</th>
                                    <th>删除</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>001</td>
                                    <td>人车合一</td>
                                    <td>不要开快车</td>
                                    <td>可以使用惯性漂移</td>
                                    <td>武侯区天府三街66号</td>
                                    <td>周日9：00-17：00 周一至周六8：00-18:00</td>
                                    <td>13968437228</td>
                                    <td class="edit"><button onclick="btn_edit(1)"><i
                                            class="icon-edit bigger-120"></i>编辑</button></td>
                                    <td class="delete"><button onclick="btn_delete(1)"><i
                                            class="icon-trash bigger-120"></i>删除</button></td>
                                </tr>

                                </tbody>

                            </table>
                        </div>
                        <!--分页显示角色信息 end-->
                    </li>
                </ul>
                <!-- 添加门店 2 -->
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
                                            <form class="am-form am-form-horizontal"
                                                  action="user/addUser1Submit.action" method="post">

                                                <div class="am-form-group">
                                                    <label for="shop-name" class="am-u-sm-3 am-form-label">
                                                        门店名称</label>
                                                    <div class="am-u-sm-9">
                                                        <input type="text" id="shop-name" name="shop-name" required
                                                               placeholder="门店名称" name="name">
                                                    </div>
                                                </div>
                                                <div class="am-form-group">
                                                    <label for="shop-des" class="am-u-sm-3 am-form-label">
                                                        门店描述</label>
                                                    <div class="am-u-sm-9">
                                                        <input type="text" id="shop-des" name="shop-des" required
                                                               placeholder="门店描述" name="name">
                                                    </div>
                                                </div>
                                                <div class="am-form-group">
                                                    <label for="shop-remarks" class="am-u-sm-3 am-form-label">
                                                        备注</label>
                                                    <div class="am-u-sm-9">
                                                            <textarea class="" rows="3" id="shop-remarks"
                                                                      name="shop-remark" placeholder="输入备注"></textarea>
                                                        <small>100字以内...</small>
                                                    </div>
                                                </div>
                                                <div class="am-form-group">
                                                    <label for="shop-address" class="am-u-sm-3 am-form-label">
                                                        门店地址</label>
                                                    <div class="am-u-sm-9">
                                                        <input type="text" id="shop-address" name=shop-address"
                                                        required placeholder="门店地址" name="name">
                                                    </div>
                                                </div>
                                                <div class="am-form-group">
                                                    <label for="shop-time" class="am-u-sm-3 am-form-label">
                                                        营业时间</label>
                                                    <div class="am-u-sm-9">
                                                        <input type="text" id="shop-time" name="shop-time" required
                                                               placeholder="营业时间" name="name">
                                                    </div>
                                                </div>
                                                <div class="am-form-group">
                                                    <label for="shop-phone" class="am-u-sm-3 am-form-label">
                                                        联系电话</label>
                                                    <div class="am-u-sm-9">
                                                        <input type="text" id="shop-phone" name="shop-phone"
                                                               required placeholder="联系电话" name="name">
                                                    </div>
                                                </div>

                                                <div class="am-form-group">
                                                    <div class="am-u-sm-9 am-u-sm-push-3">
                                                        <input type="submit" class="am-btn am-btn-success"
                                                               value="添加门店" />
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
                        <!-- end-->
                </ul>
                <!-- 店员列表 -->
                <ul style="display: block;padding: 20px;">
                    <form action="#" method="POST" style="margin-top: 10px;margin-bottom: 10px;">
                        <span>所属门店：</span>
                        <select name="clerk_shop" style="height: 40px;width: 100px;margin-right: 20px;">
                            <option value="a">所有</option>
                            <option value="b">一分店</option>
                            <option value="c">二分店</option>
                            <option value="d">三分店</option>
                        </select>
                        <input name="clerk_key" placeholder="请输入店员姓名或昵称"
                               style="height: 40px;width: 180px;margin-right: 10px;">
                        <input name="clerk_search" type="submit" value="查询店员">
                    </form>
                    <li>
                        <!--分页显示角色信息 start-->
                        <div id="dv21">
                            <table class="table" id="tbsRecord">
                                <thead>
                                <tr>
                                    <th>店员编号</th>
                                    <th>店员姓名</th>
                                    <th>店员昵称</th>
                                    <th>店员账号</th>
                                    <th>密码</th>
                                    <th>所属门店</th>
                                    <th>个人电话</th>
                                    <th>邮箱</th>
                                    <th>编辑</th>
                                    <th>删除</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>001</td>
                                    <td>张三</td>
                                    <td>车神</td>
                                    <td>cargod</td>
                                    <td>******</td>
                                    <td>一分店</td>
                                    <td>13968437228</td>
                                    <td>323134121@qq.com</td>
                                    <td class="edit"><button onclick="btn_edit(1)"><i
                                            class="icon-edit bigger-120"></i>编辑</button></td>
                                    <td class="delete"><button onclick="btn_delete(1)"><i
                                            class="icon-trash bigger-120"></i>删除</button></td>
                                </tr>

                                </tbody>

                            </table>
                        </div>
                        <!--分页显示角色信息 end-->
                    </li>
                </ul>

                <!-- 添加店员 -->
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
                                            <form class="am-form am-form-horizontal"
                                                  action="user/addUser1Submit.action" method="post">

                                                <div class="am-form-group">
                                                    <label for="clerk-name" class="am-u-sm-3 am-form-label">
                                                        店员姓名</label>
                                                    <div class="am-u-sm-9">
                                                        <input type="text" id="clerk-name" name="clerk-name"
                                                               required placeholder="店员姓名" name="name">
                                                    </div>
                                                </div>
                                                <div class="am-form-group">
                                                    <label for="clerk-pet name" class="am-u-sm-3 am-form-label">
                                                        店员昵称</label>
                                                    <div class="am-u-sm-9">
                                                        <input type="text" id="clerk-pet name" name="clerk-pet name"
                                                               required placeholder="店员昵称" name="name">
                                                    </div>
                                                </div>
                                                <div class="am-form-group">
                                                    <label for="clerk-account" class="am-u-sm-3 am-form-label">
                                                        店员账号</label>
                                                    <div class="am-u-sm-9">
                                                        <input type="text" id="clerk-account" name="clerk-account"
                                                               required placeholder="店员账号" name="name">
                                                    </div>
                                                </div>
                                                <div class="am-form-group">
                                                    <label for="clerk-password" class="am-u-sm-3 am-form-label">
                                                        密码</label>
                                                    <div class="am-u-sm-9">
                                                        <input type="password" id="clerk-password"
                                                               name="clerk-password" required placeholder="密码"
                                                               name="name">
                                                    </div>
                                                </div>
                                                <div class="am-form-group">
                                                    <label class="am-u-sm-3 am-form-label">
                                                        所属门店</label>
                                                    <div class="am-u-sm-9">
                                                        <!-- <input type="text" id="user-name" required placeholder="营业时间" name="name"> -->
                                                        <select>
                                                            <option>一分店</option>
                                                            <option>二分店</option>
                                                            <option>三分店</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="am-form-group">
                                                    <label for="clerk-phone" class="am-u-sm-3 am-form-label">
                                                        个人电话</label>
                                                    <div class="am-u-sm-9">
                                                        <input type="text" id="clerk-phone" name="clerk-phone"
                                                               required placeholder="个人电话" name="name">
                                                    </div>
                                                </div>
                                                <div class="am-form-group">
                                                    <label for="clerk-email" class="am-u-sm-3 am-form-label">
                                                        邮箱</label>
                                                    <div class="am-u-sm-9">
                                                        <input type="text" id="clerk-email" name="clerk-email"
                                                               required placeholder="邮箱" name="name">
                                                    </div>
                                                </div>

                                                <div class="am-form-group">
                                                    <div class="am-u-sm-9 am-u-sm-push-3">
                                                        <input type="submit" class="am-btn am-btn-success"
                                                               value="添加店员" />
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
                        <!-- end-->
                </ul>
            </div>
        </div>
        <!--tab end-->
    </div>
</div>



<script>
    $(function () {
        $(".tabs").slide({
            trigger: "click"
        });

    });
    var num = 1;
    var btn_save = function () {
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
            success: function (data) {
                if (data > 0) {
                    $.jq_Alert({
                        message: "添加成功",
                        btnOktext: "确认",
                        dialogModal: true,
                        btnOkClick: function () {
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

    var btn_edit = function (id) {
        $.jq_Panel({
            url: "/RawMaterialsType/EditRawMaterialsType?id=" + id,
            title: "编辑分类",
            dialogModal: true,
            iframeWidth: 500,
            iframeHeight: 400
        });
    }
    var btn_delete = function (id) {
        $.jq_Confirm({
            message: "您确定要删除吗?",
            btnOkClick: function () {
                $.ajax({
                    type: "post",
                    url: "/RawMaterialsType/DeleteRawMaterialsType",
                    data: {
                        id: id
                    },
                    success: function (data) {
                        if (data > 0) {
                            $.jq_Alert({
                                message: "删除成功",
                                btnOkClick: function () {
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
