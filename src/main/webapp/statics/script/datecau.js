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
    var iss = document.getElementById('curtime').value;

    var time1 = new Date(iss);
    var serverTime = new Date().getTime();
    var result = "";
    if(time1.getTime() < serverTime){
        layer.msg("开始日期小于当前日期，请重新选择");
    }

    return time3;
});



function getDaysBetween(startDate, enDate) {
    const sDate = Date.parse(startDate);
    const eDate = Date.parse(enDate);
    if (sDate > eDate) {
        return 0
    }
    if (sDate === eDate) {
        return 1
    }
    const days = (eDate - sDate) / (1 * 24 * 60 * 60 * 1000)
    return days
}