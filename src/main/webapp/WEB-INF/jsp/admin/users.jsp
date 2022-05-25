<%--
  Created by IntelliJ IDEA.
  User: Fh
  Date: 2022/5/22
  Time: 23:35
  To change this template use File | Settings | File Templates.
--%>
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
                    <li class="on" style="box-sizing: initial;-webkit-box-sizing: initial;">查看用户</li>
                    <li class="" style="box-sizing: initial;-webkit-box-sizing: initial;">添加用户</li>
                </ul>
            </div>
            <div class="bd">
                <ul style="display: block;padding: 20px;">
                    <form action="#" method="POST" style="margin-top: 10px;margin-bottom: 10px;">
                        <input name="user_key" placeholder="请输入用户账号或姓名"
                               style="height: 40px;width: 180px;margin-right: 10px;">
                        <input name="user_search" type="submit" value="查询用户">
                    </form>
                    <li>
                        <!--分页显示角色信息 start-->
                        <div id="dv1">
                            <table class="table" id="tbRecord">
                                <thead>
                                <tr>
                                    <th>用户编号</th>
                                    <th>账号</th>
                                    <th>密码</th>
                                    <th>姓名</th>
                                    <th>邮箱</th>
                                    <th>电话</th>
                                    <th>权限</th>
                                    <th>删除</th>
                                </tr>
                                </thead>
                                <tbody>
                                <!-- 传入user数据 -->
                                <tr>
                                    <td>1</td>
                                    <td>admin</td>
                                    <td>******</td>
                                    <td>张三</td>
                                    <td>723232@qq.com</td>
                                    <td>13545466474</td>
                                    <td>普通用户</td>
                                    <!-- <td class="edit"><button onclick="btn_edit(1)"><i class="icon-edit bigger-120"></i>编辑</button></td> -->
                                    <td class="delete"><button onclick="btn_delete(1)"><i
                                            class="icon-trash bigger-120"></i>删除</button></td>
                                </tr>

                                <tr>
                                    <td>2</td>
                                    <td>admin</td>
                                    <td>******</td>
                                    <td>李四</td>
                                    <td>723232@qq.com</td>
                                    <td>13545466474</td>
                                    <td>普通用户</td>
                                    <!-- <td class="edit"><button onclick="btn_edit(1)"><i class="icon-edit bigger-120"></i>编辑</button></td> -->
                                    <td class="delete"><button onclick="btn_delete(1)"><i
                                            class="icon-trash bigger-120"></i>删除</button></td>
                                </tr>

                                <tr>
                                    <td>3</td>
                                    <td>admin</td>
                                    <td>******</td>
                                    <td>王五</td>
                                    <td>723232@qq.com</td>
                                    <td>13545466474</td>
                                    <td>普通用户</td>
                                    <!-- <td class="edit"><button onclick="btn_edit(1)"><i class="icon-edit bigger-120"></i>编辑</button></td> -->
                                    <td class="delete"><button onclick="btn_delete(1)"><i
                                            class="icon-trash bigger-120"></i>删除</button></td>
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
                                            <form class="am-form am-form-horizontal"
                                                  action="user/addUser1Submit.action" method="post">

                                                <div class="am-form-group">
                                                    <label for="user-name" class="am-u-sm-3 am-form-label">
                                                        姓名 / Name </label>
                                                    <div class="am-u-sm-9">
                                                        <input type="text" id="user-name" required
                                                               placeholder="姓名 / Name" name="name">
                                                        <small>随便写名字咯...</small>
                                                    </div>
                                                </div>
                                                <div class="am-form-group">
                                                    <label for="user-name" class="am-u-sm-3 am-form-label">
                                                        用户名 / username </label>
                                                    <div class="am-u-sm-9">
                                                        <input type="text" id="user-account" required
                                                               placeholder="用户名 / username" name="username">
                                                        <small>要记得哈...</small>
                                                    </div>
                                                </div>
                                                <div class="am-form-group">
                                                    <label for="user-name" class="am-u-sm-3 am-form-label">
                                                        密码 / password </label>
                                                    <div class="am-u-sm-9">
                                                        <input type="password" id="user-pwd" required
                                                               placeholder="密码 / password" name="password">
                                                        <small>要记得哈...</small>
                                                    </div>
                                                </div>
                                                <div class="am-form-group">
                                                    <label for="user-name" class="am-u-sm-3 am-form-label">
                                                        性别 / sex </label>
                                                    <div class="am-u-sm-9" style="line-height: 30px;">
                                                        <input type="radio" id="man" name="sex" value="1"
                                                        ${user.sex==1? "checked=checked " : "" } /> <label
                                                            for="man">
                                                        男 </label> &nbsp;&nbsp;&nbsp;&nbsp; <input type="radio"
                                                                                                   id="woman" name="sex" value="0"
                                                    ${user.sex==0? "checked=checked " : "" } />
                                                        <label for="woman"> 女 </label>
                                                    </div>
                                                </div>
                                                <div class="am-form-group">
                                                    <label for="user-email" class="am-u-sm-3 am-form-label">
                                                        联系电话 / phone </label>
                                                    <div class="am-u-sm-9">
                                                        <input type="tel" id="user-phone" required
                                                               placeholder="请输入联系电话" name="phone" />
                                                        <small>我会给你打call...</small>
                                                    </div>
                                                </div>
                                                <div class="am-form-group">
                                                    <label for="user-email" class="am-u-sm-3 am-form-label">
                                                        地址 / place </label>
                                                    <div class="am-u-sm-9">
                                                        <input type="text" id="user-address" required
                                                               placeholder="请输入地址" name="place" />
                                                        <small>不用详细的地址也可以哦...</small>
                                                    </div>
                                                </div>
                                                <div class="am-form-group">
                                                    <label for="user-email" class="am-u-sm-3 am-form-label">
                                                        电子邮件 / Email </label>
                                                    <div class="am-u-sm-9">
                                                        <input type="email" id="user-email" required
                                                               placeholder="输入你的电子邮件 / Email" name="email" />

                                                    </div>
                                                </div>
                                                <div class="am-form-group">
                                                    <label for="user-email" class="am-u-sm-3 am-form-label">
                                                        身份 / identify </label>
                                                    <div class="am-u-sm-9">
                                                        <select>
                                                            <option>普通用户</option>
                                                            <option>管理员</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="am-form-group">
                                                    <div class="am-u-sm-9 am-u-sm-push-3">
                                                        <input type="submit" class="am-btn am-btn-success"
                                                               value="添加用户" />
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
            </div>
        </div>
    </div>
</div>
<script>
    var num = 1;
    $(function () {

        $(".tabs").slide({
            trigger: "click"
        });

    });


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
    // 编辑按钮
    var btn_edit = function (id) {
        $.jq_Panel({
            url: "/RawMaterialsType/EditRawMaterialsType?id=" + id,
            title: "编辑分类",
            dialogModal: true,
            iframeWidth: 500,
            iframeHeight: 400
        });
    }
    // 删除按钮
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
