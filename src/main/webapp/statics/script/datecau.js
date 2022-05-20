var getcar = document.getElementById("yhu");
var time1;
var time2;
// 点击按钮
var button = document.getElementById("button");
var modal = document.getElementById("modal");


function formatDate(date) {
    var d = new Date(date),
        month = '' + (d.getMonth() + 1),
        day = '' + d.getDate(),
        year = d.getFullYear();

    if (month.length < 2) month = '0' + month;
    if (day.length < 2) day = '0' + day;

    return [year, month, day].join('-');
}

$("#curtime").change(function () {
    var a = document.getElementById('curtime').value;
    var time3 = formatDate(a);
    console.log("当前时间" + time3);
    $("#curtime").attr("value", $(this).val()); //赋值
    var iss = document.getElementById('curtime').value
    var y1 = iss.split("-")[0];
    var m1 = iss.split("-")[1];
    var d1 = iss.split("-")[2];
    // console.log(y1 + ',' + m1 + ',' + d1);
    var time1 = new Date(iss);
    console.log("当前时间" + time1);
    return time3;
});
$("#backtime").change(function () {
    var b = document.getElementById('backtime').value;
    var time4 = formatDate(b);
    console.log("当前时间哦" + time4);
    $("#backtime").attr("value", $(this).val()); //赋值
    var ins = document.getElementById('backtime').value
    // var y2=ins.split("-")[0];
    // var m2=ins.split("-")[1];
    // var d2=ins.split("-")[2];
    // console.log(y2+','+m2+','+d2);
    var time2 = new Date(ins);
    console.log(time2);
    return time4;
});
$("#qued").on('click', function (time3, time4) {
    var start = document.getElementById('curtime').value;
    var time5 = formatDate(start);
    console.log("开始时间" + time5);

    var end = document.getElementById('backtime').value;
    var time6 = formatDate(end);
    console.log("结束时间" + time6);

    var startDate = Date.parse(time5);
    var endDate = Date.parse(time6);
    console.log("开始" + time5);
    console.log("结束" + time6);

    var result = "预定天数" + getDaysBetween(time5, time6) + "天";

    var r = getDaysBetween(time5, time6);
    console.log(result);
    // alert("租期为" + r + "天");
    $("#orderday").html(result);
    $("#orderday").css("color", "green");
    // sessionStorage.setItem('rentdate', r);
    document.getElementById('newtime').value=r;
    // var OneMonth = time1.substring(5, time1.lastIndexOf('-'));
    // var OneDay = time1.substring(time1.length, time1.lastIndexOf('-') + 1);
    // var OneYear = time1.substring(0, time1.indexOf('-'));
    // console.log(OneMonth + ',' + OneMonth + ',' + OneMonth);

});

function getDaysBetween(startDate, enDate) {
    const sDate = Date.parse(startDate)
    const eDate = Date.parse(enDate)
    if (sDate > eDate) {
        return 0
    }
    if (sDate === eDate) {
        return 1
    }
    const days = (eDate - sDate) / (1 * 24 * 60 * 60 * 1000)
    return days
}