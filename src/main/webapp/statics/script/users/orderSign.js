$("#verform").click(function () {
    $(".bg110").show();
    $(".verifyformBg").fadeOut();

    $("#someelement").click(function () {
        $(".bg110").hide();
        $(".signpanel").fadeOut();
        layer.msg("合同签字已保存",{icon: 1,time:400},function(index){
        });
    });
    layer.open({
        type: 1,
        title: ' 电子签名 ',
        skin: 'layui-layer-demo', //样式类名
        closeBtn: 0, //不显示关闭按钮
        anim: 2,
        shadeClose: false, //开启遮罩关闭
        btn: ['确定'],
        yes:function(index){
            layer.msg('请稍候...', {
                icon: 6,
                shade: [0.5, '#f5f5f5'],
                time:800},function (index) {
                $(".signpanel").show();
                layer.close(index);
            });
            layer.close(index)
        },
        content: '<b>电子签名在法律条款有效范围内等</b>'
    });
});

$(".cs-q1").click(function () {

    //在这里面输入任何合法的js语句
    layer.msg('获取信息中...',{icon: 6,
        shade: [0.5, '#f5f5f5'],
        time:800},function () {
        layer.open({
            type: 1,
            title: ' 身份验证 ',
            skin: 'layui-layer-demo', //样式类名
            closeBtn: 0, //不显示关闭按钮
            anim: 2,
            shadeClose: true, //开启遮罩关闭
            btn: ['确定'],
            yes:function(index){
                layer.msg('请稍候...', {
                    icon: 6,
                    shade: [0.5, '#f5f5f5'],
                    time:800},function (index) {
                    layer.msg("身份认证成功，请您签订合同",{icon: 1,time:400},function(index){
                        $(".bg110").show();
                        $(".verifyformBg").fadeIn();
                    });
                });
                layer.close(index)
            },
            content: '<div class="layui-form-item"><label class="layui-form-label">真实姓名</label><div class="layui-input-block"><input type="text" name="title" autocomplete="off" placeholder="请输入真实姓名" class="layui-input" style="width:150px;margin:20px;"></div></div><div class="layui-form-item"><label class="layui-form-label">身份证号</label><div class="layui-input-block"><input type="text" name="title" autocomplete="off" placeholder="请输入驾照" class="layui-input" style="width:300px;margin:20px;"></div></div>'
        });
    });

});
$(".closeBg").click(function () {
    $(".bg110").hide();
    $(".verifyformBg").fadeOut();
});


$(function() {
    var param= {
        width: '400px',//签名区域的宽
        height: '500px',//签名区域的高
        cssclass: 'signature',//画布的类 可以写自定义的样式
        UndoButton:false,//撤销按钮的状态 这个按钮的样式修改要去jSignature.js文件中去找
        signatureLine: true,//去除默认画布上那条横线
        lineWidth: '3' //画笔的大小
    };

    var $sigdiv = $(".signature");
    $sigdiv.jSignature(param); // 初始化jSignature插件.

    $("#yes").click(function(){
        //将画布内容转换为图片
        var datapair = $sigdiv.jSignature("getData", "image");
        var i = new Image();
        i.src = "data:" + datapair[0] + "," + datapair[1];
        $(i).appendTo($("#someelement")); // append the image (SVG) to DOM.

        //var data = $sigdiv.jSignature('getData', 'default')
        //console.log(data);  这个和上面得到的结果一样

    });
    //datapair = $sigdiv.jSignature("getData","base30");
    //$sigdiv.jSignature("setData", "data:" + datapair.join(","));
    $("#download").click(function(){
        downloadFile("a.png", convertBase64UrlToBlob($("img").attr("src")));
    });
    $("#reset").click(function(){
        $sigdiv.jSignature("reset"); //重置画布，可以进行重新作画.
        $("#someelement").html("");
    });
    // });
    function downloadFile(fileName, blob){
        var aLink = document.createElement('a');
        var evt = document.createEvent("HTMLEvents");
        evt.initEvent("click", false, false);//initEvent 不加后两个参数在FF下会报错, 感谢 Barret Lee 的反馈
        aLink.download = fileName;
        aLink.href = URL.createObjectURL(blob);
        aLink.dispatchEvent(evt);
    }
    /**
     * 将以base64的图片url数据转换为Blob
     * @param urlData
     *            用url方式表示的base64图片数据
     */
    function convertBase64UrlToBlob(urlData){

        var bytes=window.atob(urlData.split(',')[1]);        //去掉url的头，并转换为byte

        //处理异常,将ascii码小于0的转换为大于0
        var ab = new ArrayBuffer(bytes.length);
        var ia = new Uint8Array(ab);
        for (var i = 0; i < bytes.length; i++) {
            ia[i] = bytes.charCodeAt(i);
        }

        return new Blob( [ab] , {type : 'image/png'})};
});