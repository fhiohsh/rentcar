
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="city clearcity"> <em></em>
    <span id="DY_site_name" class="red city-name Left cl" style="font-size: 20px;">${citys.name}</span>
    <div id="JS_hide_city_menu_11" class="city-select cut_handdler Left">
        <a href="javascript:void(0);" class="common-bg selector selector2">切换城市</a>
        <div id="JS_header_city_bar_box" class="hide_city_group">
            <div class="hideMap">
                <div class="showPanel clearfix">
                    <div class="Left mycity">

                        <div id="JS_current_city_box">
                            当前城市：<strong id="JS_city_current_city">${citys.name}</strong> </div>
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