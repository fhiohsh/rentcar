$(".pp-login").click(function () {
    $(".bg110").show();
    $(".loginpop").fadeIn();
});
$(".loginclose").click(function () {
    $(".bg110").hide();
    $(".loginpop").fadeOut();
});

$('.messagegg a').click(function() {
    $('.loginpop .form div').animate({ height: "toggle", opacity: "toggle" }, "slow");
});

$(".contact-us").hover(
    function () {$(".contact-popup").show();}
    ,function () {
    $(".contact-popup").css('display','none');
});

//注册
$("#regbtn").on('click',function () {
    var regaccount = document.getElementById('regaccount').value;
    var regpassword = document.getElementById('regpassword').value;
    var regphone = document.getElementById('regphone').value;
    var regemail = document.getElementById('regemail').value;
    var conemail = document.getElementById('conemail').value;//验证码

    //去除空格;
    var regaccounts = regaccount.replace(/(^\s*)|(\s*$)/g, '');
    var pwds = regpassword.replace(/(^\s*)|(\s*$)/g, '');
    var regphones = regphone.replace(/(^\s*)|(\s*$)/g, '');
    var regemails = regemail.replace(/(^\s*)|(\s*$)/g, '');

    var reg1=/^[a-zA-Z_$]\w{3,9}$/;//用户名:至少4位到10位
    var reg2=/^\w{6,13}$/;//密码至少6位,最多10位。
    // var reg3=/^(1[6-9])|([2-9][0-9])$/;//16-99年龄必须16-99岁。
    var reg5 = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;
    var reg3=/^[a-zA-Z\d]{3,}\w*@([a-z]|\d)\w*\.[a-z]{3}(\.[a-z]{2})?$/;//邮箱验证
    var reg4=/^1\d{10}$/;//:以1开头，必须是11位致字

    if(regaccounts === '' || regaccounts === undefined || regaccounts === null){
        layer.msg("账号为空");
        return false;
    }
    if(!reg1.test(regaccounts)){
        layer.msg("用户名至少4位到10位以字母、下划线、$开头");
        return false;
    }
    if(pwds === '' || pwds === undefined || pwds === null){
        layer.msg("密码为空");
        return false;
    }
    if(!reg2.test(pwds)){
        layer.msg("密码至少6~14位");
        return false;
    }
    if(regphones === '' || regphones === undefined || regphones === null){
        layer.msg("手机号为空");
        return false;
    }
    if(!reg4.test(regphones)){
        layer.msg("手机格式不正确~");
        return false;
    }
    if(regemails === '' || regemails === undefined || regemails === null){
        layer.msg("邮箱为空");
        return false;
    }
    if(!reg5.test(regemails)){
        layer.msg("邮箱格式不合法~");
        return false;
    }
    $.ajax({
        type:"POST",
        url:"/user/register",
        data:{username:regaccount,password:regpassword,phone:regphone,email:regemail},
        success:function(data){
            if (data.result === 'oks'){
                layer.msg("注册成功，请重新登录");
                console.log("注册成功，现在登录ok?");
                location.replace(href);
                // setTimeout(junmp,1000);
            }else if(data.result === 'RepeatUserName'){
                layer.msg("用户名已经被注册了~");
                console.log("用户名已经被注册了");
            }else if(data.result === 'RepeatNumber'){
                layer.msg("手机号已经被注册了~");
                console.log("手机号已经被注册了");
            }else if(data.result === 'RepeatEmail'){
                layer.msg("邮箱已经被注册了~");
                console.log("邮箱已经被注册了");
            }else{
                layer.msg("信息异常");
                console.log("信息异常");
            }
        }
    });


});
//注销
$(".ulogout").on('click',function () {
    $.ajax({
        type:"POST",
        url:"/user/logout",
        data:{},
        success:function(data){
            if (data.result == 'logout'){
                layer.msg("注销成功");
                location.replace("/a");
            }
        }
    });
});
//登录时 ajax验证
$("#loginbtns").on('click',function () {
    var uname = document.getElementById('username').value;
    var pwd = document.getElementById('password').value;
    //去除空格;
    var unames = uname.replace(/(^\s*)|(\s*$)/g, '');
    var pwds = pwd.replace(/(^\s*)|(\s*$)/g, '');
    var fg = 0;
    if(unames === '' || unames === undefined || unames === null){
        layer.msg("账号为空");
        fg = 1;
    }else if(pwds === '' || pwds === undefined || pwds === null){
        layer.msg("密码为空");
        fg = 1;
    }
    console.log(fg);
    if(fg === 0){
        $.ajax({
            type:"POST",
            url:"/user/login",
            data:{'username':uname,'password':pwd},
            success:function(data){
                if (data.result == 'oks'){
                    layer.msg("登录成功");
                    // location.reload();
                    location.replace(href);
                }else if(data.result == 'noPhone'){
                    layer.msg("手机号或密码错误");
                }else if(data.result == 'noEmail'){
                    layer.msg("邮箱或密码错误");
                }else if(data.result == 'noUsername'){
                    layer.msg("用户名或密码错误");
                }else{
                    layer.msg("信息异常");
                }
            }
        });
    }else{
        layer.msg("账户或密码为空");
    }
});




$(function () {
    $(".selecter").each(function () {
        var s = $(this);
        var z = parseInt(s.css("z-index"));
        var dt = $(this).children("dt");
        var dd = $(this).children("dd");
        var _show = function () {
            dd.slideDown(200);
            dt.addClass("cur");
            s.css("z-index", z + 1);
        }; //展开效果
        var _hide = function () {
            dd.slideUp(200);
            dt.removeClass("cur");
            s.css("z-index", z);
        }; //关闭效果
        dt.click(function () {
            dd.is(":hidden") ? _show() : _hide();
        });
        dd.find("a").click(function () {
            dt.html($(this).html());
            _hide();
        }); //选择效果（如需要传值，可自定义参数，在此处返回对应的“value”值 ）
        $("body").click(function (i) {
            !$(i.target).parents(".selecter").first().is(s) ? _hide() : "";
        });
    })
});