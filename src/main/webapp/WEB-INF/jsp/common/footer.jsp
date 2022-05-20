<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="footer">
    <div class="footer-box clear_float">
        <div class="footer-left">
            <p>
                <a href="https://news.1hai.cn/News/About/" rel="nofollow" target="_blank">关于风车</a>
                |
                <a href="https://www.1hai.cn/activity/mobile.aspx" target="_blank">移动客户端</a>
                |
                <a href="https://www.1hai.cn/NewHelp/Index" rel="nofollow" target="_blank">帮助中心</a>
                |
                <a href="https://www.1hai.cn/help/advice.aspx" rel="nofollow" target="_blank">建议专区</a>
                |
                <a href="https://www.1hai.cn/NewHelp/HelpContent?menuId=28&amp;isLimitRules=False" rel="nofollow" target="_blank">联系我们</a>
                |
                <a href="https://www.1hai.cn/more/link.aspx" rel="nofollow" target="_blank">友情链接</a>
                | &nbsp;投诉通道：400-821-1608 &nbsp;
            </p>
            <p>
                Copyright © 2022 - 2023 成都风车车信息技术服务有限公司
                <a href="http://www.beian.gov.cn/" target="_blank" rel="nofollow">ICP证：川A1-20140130</a>
            </p>
        </div>
        <div class="footer-right">

        </div>
    </div>
</div>
<script type="text/javascript">
    $(function () {
        $('.navmenu li').hover(function () {
            $('span', this).stop().css('height', '2px');
            $('span', this).animate({
                left: '0',
                width: '100%',
                right: '0'
            }, 200);
        }, function () {
            $('span', this).stop().animate({
                left: '50%',
                width: '0'
            }, 200);
        });
    });
</script>
<!-- 下拉导航栏 -->
<script type="text/javascript">
    $(function () {
        var scroll_heitht = $('body').offset().top;
        var isShow = true;
        $(window).scroll(function () {
            if ($(window).scrollTop() > scroll_heitht && isShow) {
                $('.stress-search-box').slideDown(200);
            } else {
                $('.stress-search-box').slideUp(200);
            }
        });
        $('.stress-close a').click(function () {
            isShow = false;
            $('.stress-search-box').slideUp(200).unbind(window, aa);
        });
    });
</script>
<%-- 全部品牌--%>
<script>
    $(function () {
        var t = null,
            $this, i = 0;
        //品牌
        $(".brand-all").bind({
            mouseenter: function () {
                $(this).find(".otherbrand").show();
            },
            mouseleave: function () {
                $(this).find(".otherbrand").hide();
            }
        });

    });
</script>
<%--<%@ include file="/common/header.jsp"%>--%>