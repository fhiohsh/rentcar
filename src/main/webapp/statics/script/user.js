$("#verform").click(function () {
    $(".bg110").hide();
    $(".logindemoBg").fadeOut();
    $("#verform").submit();
});

$(".cs-q1").click(function () {
    $(".bg110").show();
    $(".logindemoBg").fadeIn();
});
$(".closeBg").click(function () {
    $(".bg110").hide();
    $(".logindemoBg").fadeOut();
});

//倒计时
var iptVa = document.getElementById('test1').value
layui.use('util', function () {

    console.log("获取结束时间:" + iptVa);
    var util = layui.util;
    //示例

    var serverTime = new Date().getTime(); //假设为当前服务器时间
    var endTime1 = new Date(iptVa).getTime();
    var stime = endTime1 - serverTime;
    var endTime = serverTime + stime;
    console.log(stime);
    console.log(serverTime);
    console.log(endTime)
    util.countdown(endTime, serverTime, function (date, serverTime, timer) {
        var str = date[0] + '天' + date[1] + '时';

        console.log('1::' + serverTime);
        console.log('2::' + endTime);
        layui.$('#test2').html('距离还车时间还有：' + str);
        if (serverTime == endTime || serverTime > endTime) {
            console.log('123');
            layer.open({
                title: '<div style="color:#000">完成</div>',
                content: '您的租期已到，请您及时还车！'
            });

        }
    });
});


$("#adform").click(function () {
    $(".logindemoBg2").fadeOut();
    $("#adform").submit();
});
$(".cs-q3").click(function () {
    $(".logindemoBg2").fadeIn();
});

// curtime

$("#curtime").change(function () {
    $("#curtime").attr("value", $(this).val()); //赋值
    var iss = document.getElementById('curtime').value
    var y1 = iss.split("-")[0];
    var m1 = iss.split("-")[1];
    var m2 = iss.split("-")[2];
    console.log(y1 + ',' + m1 + ',' + m2);
    var time1 = new Date(y1, m1, m2);
    console.log(time1);
});

$('.mr2 li').each(function (index) {
    $(this).click(function () {
        $(this).addClass('on').siblings().removeClass('on');
    })
});

$('.mr-tab a').each(function (index) {
    $(this).click(function () {
        $(this).addClass('on').siblings().removeClass('on');
        $('.me-dl').eq(index).show().siblings().hide();
    })
});

$('.cs_ding a').mouseover(function () {
    this.style.color = 'blue';
})
$('.cs_ding a').mouseout(function () {
    this.style.color = '#4573af';
})