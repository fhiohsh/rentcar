<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>风车车</title>

    <%@ include file="common/path.jsp"%>
</head>
<body>
<%@ include file="common/header.jsp"%>
<ul class="navmenu">
    <li class="active"><a href="">首页</a><span></span></li>
    <li><a href="">租车</a><span></span></li>
    <li><a href="/cars/pages/1">车型查询</a><span></span></li>
    <li><a href="/shop">营业网点</a><span></span></li>
    <li><a href="">个人中心</a><span></span></li>
</ul>
<div class="clear_fix"></div>
<div class="banner">
    <!--左侧买卖车-->
    <div class="mainmenu">
        <div class="sel-area">
            <div class="buy-tit">租车</div>
            <div class="all-sort-list">
                <div class="item">
                    <h3>
                        <div class="border"><a href="">品牌</a></div>
                        <ul>
                            <li><a href="#">大众</a></li>
                            <li><a href="#">宝马</a></li>
                            <li><a href="#">奥迪</a></li>
                            <li><a href="#">丰田</a></li>
                            <li><a href="#">日产</a></li>
                            <li><a href="#">奔驰</a></li>
                            <li><a href="#">本田</a></li>
                            <li><a href="#">别克</a></li>
                            <li><a href="#">福特</a></li>
                        </ul>
                    </h3>
                    <div class="item-list clearfix" style="top: 0px; display: none;">
                        <div class="close">x</div>
                        <div class="subitem">
                            <dl class="fore1">
                                <dt><a href="#">A</a></dt>
                                <dd><em><a href="#">Alpina</a></em><em><a href="#">阿斯顿马丁</a></em><em><a
                                        href="#">奥迪</a></em></dd>
                            </dl>
                            <dl class="fore2">
                                <dt><a href="#">B</a></dt>
                                <dd><em><a href="#">巴博斯</a></em><em><a href="#">宝骏</a></em><em><a
                                        href="#">宝马</a></em><em><a href="#">保时捷</a></em><em><a
                                        href="#">北京</a></em><em><a href="#">北汽</a></em><em><a
                                        href="#">奔驰</a></em><em><a href="#">奔腾</a></em><em><a
                                        href="#">本田</a></em><em><a href="#">比亚迪</a></em><em><a
                                        href="#">标致</a></em><em><a href="#">别克</a></em><em><a
                                        href="#">宾利</a></em><em><a href="#">宝沃</a></em></dd>
                            </dl>
                            <dl class="fore3">
                                <dt><a href="#">C</a></dt>
                                <dd><em><a href="#">昌河</a></em><em><a href="#">传祺</a></em><em><a
                                        href="#">长安</a></em><em><a href="#">长安商用</a></em><em><a
                                        href="#">长城</a></em><em><a href="#">长丰</a></em></dd>
                            </dl>
                            <dl class="fore4">
                                <dt><a href="#">D</a></dt>
                                <dd><em><a href="#">DS</a></em><em><a href="#">大发</a></em><em><a
                                        href="#">大通</a></em><em><a href="#">大众</a></em><em><a
                                        href="#">道奇</a></em><em><a href="#">帝豪</a></em><em><a
                                        href="#">东风</a></em><em><a href="#">东风风度</a></em><em><a
                                        href="#">东风小康</a></em><em><a href="#">东南</a></em></dd>
                            </dl>
                        </div>
                    </div>
                </div>

                <div class="items">
                    <h3 style="border-bottom:0px;">
                        <div class="border"><a href="">车型</a></div>
                        <ul>
                            <li><a href="#">SUV</a></li>
                            <li><a href="#">商务车</a></li>
                            <li><a href="#">跑车</a></li>
                            <!-- <li><a href="#">急售</a></li> -->
                            <li><a href="#">准新车</a></li>
                            <li><a href="#">超值</a></li>
                            <!-- <li><a href="#">直销车</a></li> -->
                        </ul>
                    </h3>
                </div>
            </div>
            <div class="clear_fix"></div>
            <!-- 汽车扩展显示 -->
            <script type="text/javascript">
                $('.all-sort-list > .item').hover(function () {
                    var eq = $('.all-sort-list >.item').index(this), //获取当前滑过是第几个元素
                        h = $('.all-sort-list').offset().top, //获取当前下拉菜单距离窗口多少像素
                        s = $(window).scrollTop(), //获取游览器滚动了多少高度
                        i = $(this).offset().top, //当前元素滑过距离窗口多少像素
                        item = $(this).children('.item-list').height(), //下拉菜单子类内容容器的高度
                        sort = $('.all-sort-list').height(); //父类分类列表容器的高度

                    if (item < sort) { //如果子类的高度小于父类的高度
                        if (eq == 0) {
                            $(this).children('.item-list').css('top', (i - h));
                        } else {
                            $(this).children('.item-list').css('top', (i - h));
                        }
                    } else {
                        if (s > h) { //判断子类的显示位置，如果滚动的高度大于所有分类列表容器的高度
                            if (i - s > 0) { //则 继续判断当前滑过容器的位置 是否有一半超出窗口一半在窗口内显示的Bug,
                                $(this).children('.item-list').css('top', (s - h) + 2);
                            } else {
                                $(this).children('.item-list').css('top', (s - h) - (-(i - s)) + 2);
                            }
                        } else {
                            $(this).children('.item-list').css('top', 0);
                        }
                    }

                    $(this).addClass('hover');
                    $(this).children('.item-list').css('display', 'block');
                }, function () {
                    $(this).removeClass('hover');
                    $(this).children('.item-list').css('display', 'none');
                });

                $('.item > .item-list > .close').click(function () {
                    $(this).parent().parent().removeClass('hover');
                    $(this).parent().hide();
                });
            </script>
            <!--我要买车-->
            <div class="buy-tit">联系我们</div>
            <div class="sell-car-box">
                <form action="" class="clearfix">
                    <input type="text" class="sell-phone-input" data-role="sellPhone"
                           placeholder="请输入手机号码">
                    <button class="sell-phone-submit sell-phone-submit2">租车</button>
                </form>
                <!--提交失败-->
                <p class="sell-phone-error" style="display:block;">请填写正确的手机号码</p>
                <!--提交成功-->
                <div class="submit-suc" style="display:none">
                    <i></i>提交成功！ <a href="javascript:void(0)"
                                    data-role="go_back">返回</a> </div>
            </div>
        </div>
    </div>
    <div class="menu_r">
        <div class="flexslider">
            <ul class="slides">
                <li style="background-image:url(/statics/imgs/轮播1.jpg);"></li>
                <li style="background-image:url(/statics/imgs/轮播1.jpg);"></li>
                <li style="background-image:url(/statics/images/3.jpg);"></li>
                <li style="background-image:url(/statics/images/4.jpg);"></li>
            </ul>
        </div>
        <div class="clear_fix"></div>

        <div class="purpose">
            <div class="ind-dz-lc">
                <ul>
                    <li>
                        <div class="circle radius"> <i class="lc-01"></i> </div>
                        <div class="txt">
                            <h4>合同质保</h4>
                        </div>
                    </li>
                    <li>
                        <div class="circle radius"> <i class="lc-02"></i> </div>
                        <div class="txt">
                            <h4>全面检测</h4>
                        </div>
                    </li>
                    <li>
                        <div class="circle radius"> <i class="lc-03"></i> </div>
                        <div class="txt">
                            <h4>1天可退</h4>
                        </div>
                    </li>
                    <li>
                        <div class="circle radius"> <i class="lc-04"></i> </div>
                        <div class="txt">
                            <h4>100%全新车源</h4>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>


<script type="text/javascript">
    $(document).ready(function () {
        $('.flexslider').flexslider({
            directionNav: true,
            pauseOnAction: false,
            touch:true
        });
        $('.flexslider').hover(function () {
            $('.flex-direction-nav').fadeIn();
        }, function () {
            $('.flex-direction-nav').fadeOut();
        })
    });
</script>
<%@ include file="common/homemore.jsp"%>
<%@ include file="common/footer.jsp"%>
</body>
</html>
