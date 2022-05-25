/*
    自定义工具
    I am liangzhenyu
    2018-07-05
*/

/*
插件-弹框提示-v1.3.5(可以展示大内容，也可以是确认框)
使用方法说明：
    1.此插件基于jQuery编写，使用时需要先导入jQuery
    2.获取对象
        var myPop = $.initPopop(cfg);
        cfg:配置文件如果不设置将使用默认设置
    3.设置配置
        myPop.setStyle(cfg, status);
        cfg:配置文件如果不设置将使用默认设置
        status:配置文件的状态（false:在原配置上追加，重复的将覆盖；true:全新覆盖，未配置的将使用默认值），默认值为false
    4.显示提示框
        myPop.showPopup(content,title);
        content:任意内容（可选），若无则使用 cfg 配置中的内容设置，若cfg配置中也没有设置将为空白，强制水平和垂直居中
        title:标题(可选)，若无则使用 cfg 配置中的标题设置，若cfg配置中也没有设置将使用默认值：“消息”
    5.关闭提示框
        myPop.closePopup();
    6.添加框低按钮
        myPop.addButton(btnName,callback); //需要注意的是添加的按键过多（弹框的宽不足容纳所有按键）时，将自动适应设置弹框的宽来容纳所有按键
        btnName:按键的名称,注：添加的名称含有“关闭，取消”等的将带有点击关闭弹框的事件，
        callback:回调函数(按键点击事件在这里，就是说每添加一个按键都自动绑定了一个点击事件)，函数中的 this->当前弹框对象
    7.移除框低按钮
        myPop.removeButton(nameOrIndex);
        nameOrIndex:按键的名称或者按键所在的下标
    8.获取本弹框状态
        myPop.getStatus();
        返回值:{
            status: true/false，弹框的状态，true为开启状态，false为关闭状态，
            rect:{top,left,bottom,right,width,height}，弹框绝对位置相关值,
            version:版本
        }
    9.弹框开启关闭回调事件
        myPop.on(type,callback);
        type:"open"开启，"close"关闭两种类型，按照jquery的on方法使用习惯配置便可
        callback:回调函数
 参数说明：
    cfg:{
        content:任意内容,可以是节点，可以是ID，可以是类。使用建议：弹框作为模态框时建议在这里配置选择器，作为提示框时这里不要配置，直接在showPopup方法配置；
            简而言之就是不常改变的内容（一般都是配置了样式的节点）放在这，经常改变的内容（一般都是一句疑问句）就放在showPopup方法中。
        title:弹框标题,
        width:弹框的长,
        height:弹框的高,
        vertical:内容是否垂直居中，默认：true,
        border:弹框边框设置,
        borderRadius:边框的圆角大小,
        themeColor:弹框的主题颜色,
        animation:弹框弹出风格动画，1、弹出；2、收缩；3、旋转；4、下滑；5、上滑；6、抖动
        showShadow:是否显示边框阴影,默认为true,
        shadowSize:阴影的长度，如果 showShadow为false则该值无效，默认长度为12px，
        showIcon:是否显示左上图标,默认:true,
        icon:图标的图片（可以是路径；也可以是图片base64编码；也可以直接是字符，比如：'!','?'）,
        allowedFullscreen:是否允许全屏，即是否添加全屏按键，默认值：false,
        allowedKeyboard:是否允许键盘操作，目前暂时只要Esc按键点击退出事件，默认允许，true
        buttonAlign:按键对齐方式，left,center和right三种方式,
        showBackground:是否显示背景,默认：false,
        clickBgToClose:是否点击背景关闭弹框，默认：false，
        allowedMove:是否允许移动,默认：false,
        targetSelector:参照目标，用于弹框设置位置的相对节点，默认：'window'，相对于屏幕设置位置（这样能保证绝对定位），强调：这个'window'不是选择器，这个只是标识绝对定位的意思；
            其他比如：body，div，#myId，.myClass等节点或选择器，这些是用于设置相对位置（必须是真实的节点或选择器）
        insideOrFollow:弹框类型设置，“inside”和“follow”两种类型(内嵌和跟随)，默认“inside”，内嵌或跟随(targetSelector)显示,
        relativePosition:弹框相对目标选择器的位置，
            当'insideOrFollow' 值为“inside”时默认中间：center，可选值：top，bottom,left，right及组合方位词，也可以是"x,y"的绝对定位；
            当'insideOrFollow' 值为“follow”时默认右下：right bottom，可选值：top，bottom,left，right及组合方位词
        relativeOffset: 弹框与目标相对偏差位置（就是弹框和targetSelector的距离有多远），默认偏移10px
    }
    注：参数配置里没有 z-index 配置项，如果需要配置请自行直接修改css文件 .lzy_custom_bg 和 .lzy_custom_popup 两个类


  另：作者我没有按照 打开弹框时便插入节点，关闭弹框时移除节点 的流程。是因为弹框的按钮以及弹框内容部分可能开发者需要对里面的控件添加事件，如果移除节点将导致事件失效。
    但为了保持美观，编写一个弹框使用一个大 DIV 包括
 */
;
(function($, window, document, undefined) {
    $.extend({
        initPopup: function(cfg) {
            /**
             * 将颜色值转为 rgb 类型的值（不支持rgba）
             * @param color 颜色值，rgb,16进制值，英文名称
             * @returns {*} rgb值
             */
            var toRGB = function(color) {
                color = color.toLowerCase();
                var _EN_COLOR = function() {
                    var placeholder = "N,O,P,Q,R,S,T,U,V,W,X,Y,Z,M,L,K,J".split(",");
                    var replace = "dark,deep,light,medium,white,red,black,aqua,green,blue,yellow,orange,pink,00,ff,80,ee".split(",");
                    var strEnColor = '{"aliceW":"f0f8L","antiqueR":"faebd7","U":"MLL","Umarine":"7Lfd4","azure":"f0LL","beige":"f5f5dc","bisque":"Le4c4","T":"MMM","blanchedalmond":"Lebcd","W":"MML","Wviolet":"8a2be2","brown":"a52a2a","burlywood":"deb887","cadetW":"5f9ea0","chartreuse":"7LfM","chocolate":"d2691e","coral":"L7f50","cornflowerW":"6495ed","cornsilk":"Lf8dc","crimson":"dc143c","cyan":"MLL","NW":"MM8b","Ncyan":"M8b8b","Ngoldenrod":"b886b","Ngray":"a9a9a9","NV":"M64M","Nkhaki":"bdb76b","Nmagenta":"8bM8b","NoliveV":"556b2f","NY":"L8cM","Norchid":"9932cc","NS":"8bMM","Nsalmon":"e9967a","NseaV":"8fbc8f","NslateW":"483d8b","Nslategray":"2f4f4f","Nturquoise":"Mced1","Nviolet":"94Md3","OZ":"L1493","OskyW":"MbLf","dimgray":"696969","dodgerW":"1e90L","feldspar":"d19275","firebrick":"b22222","floralR":"Lfaf0","forestV":"228b22","fuchsia":"LML","gainsboro":"dcdcdc","ghostR":"f8f8L","gold":"Ld7M","goldenrod":"daa520","gray":"KKK","V":"M8M0","VX":"adL2f","honeydew":"f0Lf0","hotZ":"L69b4","indianS":"cd5c5c","indigo":"4bM82","ivory":"LLf0","khaki":"f0e68c","lavender":"e6e6fa","lavenderblush":"Lf0f5","lawnV":"7cfcM","lemonchiLon":"Lfacd","PW":"add8e6","Pcoral":"f0KK","Pcyan":"e0LL","PgoldenrodX":"fafad2","Pgrey":"d3d3d3","PV":"90K90","PZ":"Lb6c1","Psalmon":"La07a","PseaV":"20b2aa","PskyW":"87cefa","PslateW":"8470L","Pslategray":"778899","PstKlW":"b0c4de","PX":"LLe0","lime":"MLM","limeV":"32cd32","linen":"faf0e6","magenta":"LML","maroon":"8MM0","QUmarine":"66cdaa","QW":"MMcd","Qorchid":"ba55d3","Qpurple":"9370d8","QseaV":"3cb371","QslateW":"7b68K","QspringV":"Mfa9a","Qturquoise":"48d1cc","QvioletS":"c71585","midnightW":"191970","mintcream":"f5Lfa","mistyrose":"Le4e1","moccasin":"Le4b5","navajoR":"Ldead","navy":"MMK","oldlace":"fdf5e6","olive":"K8M0","olivedrab":"6b8e23","Y":"La5M","YS":"L45M","orchid":"da70d6","palegoldenrod":"Ke8aa","paleV":"98fb98","paleturquoise":"afKK","palevioletS":"d87093","papayawhip":"Lefd5","peachpuL":"Ldab9","peru":"cd853f","Z":"Lc0cb","plum":"dda0dd","powderW":"b0e0e6","purple":"8M0K","S":"LMM","rosybrown":"bc8f8f","royalW":"4169e1","saddlebrown":"8b4513","salmon":"faK72","sandybrown":"f4a460","seaV":"2e8b57","seashell":"Lf5K","sienna":"a0522d","silver":"c0c0c0","skyW":"87cKb","slateW":"6a5acd","slategray":"70K90","snow":"Lfafa","springV":"ML7f","stKlW":"4682b4","tan":"d2b48c","teal":"MKK","thistle":"d8bfd8","tomato":"L6347","turquoise":"40e0d0","violet":"K82K","violetS":"d02090","wheat":"f5deb3","R":"LLL","Rsmoke":"f5f5f5","X":"LLM","XV":"9acd32"}';
                    for (var i = 0; i < placeholder.length; i++) strEnColor = strEnColor.replace(new RegExp(placeholder[i], "g"), replace[i]);
                    return strEnColor;
                };
                var _Hex2RGB = function(color) {
                    var i = 0,
                        arrColor = [];
                    if (color.length === 4) {
                        var nColor = "#";
                        for (i = 1; i < 4; i += 1) nColor += color.slice(i, i + 1).concat(color.slice(i, i + 1));
                        color = nColor;
                    }
                    for (i = 1; i < 7; i += 2) arrColor.push(parseInt("0x" + color.slice(i, i + 2)));
                    return "rgb(" + arrColor[0] + "," + arrColor[1] + "," + arrColor[2] + ")";
                };
                if (color.indexOf("rgba") >= 0) {
                    return color;
                } else if (color && /^#([0-9a-f]{3}|[0-9a-f]{6})$/.test(color)) {
                    return _Hex2RGB(color);
                } else if (color.indexOf("rgb") >= 0) {
                    if (color.indexOf("%") >= 0) {
                        var arrRgb = color.replace("rgb(", "").replace(")", "").replace(/%/g, "").split(",");
                        return "rgb(" + parseInt(arrRgb[0] / 100 * 255) + "," + parseInt(arrRgb[1] / 100 * 255) + "," + parseInt(arrRgb[2] / 100 * 255) + ")";
                    }
                    return color;
                } else {
                    var hexColor = JSON.parse(_EN_COLOR())[color];
                    if (!hexColor) {
                        console.error("抱歉！无该英文颜色");
                        return color;
                    }
                    return _Hex2RGB(hexColor);
                }
            };
            /**
             * 转化为淡颜色
             * @param color rgba值或rgb值
             * @param opacity 透明度
             * @returns {string} rgba值
             */
            var dimColor = function(color, opacity) {
                var opa = opacity || 0.5;
                if (color.indexOf("rgba") >= 0) return color.substr(0, color.lastIndexOf(",")) + "," + parseFloat(color.substr(color.lastIndexOf(",") + 1, color.lastIndexOf(")") - 1)) * opa + ")";
                var arrRgb = toRGB(color).replace("rgb(", "").replace(")", "").split(",");
                return "rgba(" + arrRgb[0] + "," + arrRgb[1] + "," + arrRgb[2] + "," + opa + ")";
            };
            /**
             * 转化为暗颜色
             * @param color rgb值
             * @param oft
             * @returns {string}
             */
            var darkColor = function(color, oft) {
                oft = oft || 0.5;
                var arrRgb = toRGB(color).replace("rgb(", "").replace(")", "").split(",");
                return "rgb(" + parseInt(arrRgb[0] * oft) + "," + parseInt(arrRgb[1] * oft) + "," + parseInt(arrRgb[2] * oft) + ")";
            };
            /**
             * 判断是否是IE家族的浏览器
             * @returns {*}
             */
            var isIE = function() {
                var userAgent = navigator.userAgent;
                var isIE = userAgent.indexOf("compatible") > -1 && userAgent.indexOf("MSIE") > -1; //判断是否IE<11浏览器
                var isEdge = userAgent.indexOf("Edge") > -1 && !isIE; //判断是否IE的Edge浏览器
                var isIE11 = userAgent.indexOf('Trident') > -1 && userAgent.indexOf("rv:11.0") > -1;
                if (isIE) {
                    new RegExp("MSIE (\\d+\\.\\d+);").test(userAgent);
                    var ieV = parseInt(RegExp["$1"]);
                    if (ieV === 7) return 7;
                    if (ieV === 8) return 8;
                    if (ieV === 9) return 9;
                    if (ieV === 10) return 10;
                    return 1;
                }
                if (isEdge) return "edge";
                if (isIE11) return 11;
                return false;
            };
            /**
             * 判断是否是火狐浏览器
             * @returns {boolean}
             */
            var isFire = function() {
                return navigator.userAgent.indexOf("Firefox") > -1;
            };
            /**
             * 用来给弹框判断是否使用屏幕作参照对象
             * @param ele 节点
             * @returns {boolean}
             */
            var isReferScreen = function(ele) {
                return !ele || ele === "window" || ele === "document" || ele === "screen" || ele === window || ele === document;
            };
            /**
             * 获取body下的所有子节点中最大的zIndex值
             */
            var getMaxZIndex = function() {
                var arr = [],
                    $objs = $("body>*");
                for (var i = 0; i < $objs.length; i++) {
                    var z = $($objs[i]).css("zIndex");
                    arr.push(isNaN(z) ? 0 : z);
                }
                var maxZIndex = arr.length ? Math.max.apply(null, arr) : 0;
                return maxZIndex > 999999 ? maxZIndex + 1 : 1000000;
            };
            var isEmpty = function(val) {
                //该方法的作用主要是避免传入参数为 0  时的判断却为false
                return val === null || typeof(val) === "undefined";
            };
            /**
             * 获取2倍边框宽
             * @param obj 对象
             * @returns {number} 宽长
             */
            var getDouBW = function(obj) {
                return obj.css("border-left-width").replace("px", "") * 2;
            };
            /**
             * 设置配置标记
             * @param iof insideOrFollow 内嵌或跟随
             * @param pos 位置：1，2，4，8，16，代表 中，上，下，左，右
             * @returns {number} 标识码
             */
            var setPosTag = function(iof, pos) {
                if (iof && iof === 'follow' && !pos) return 20;
                if (!pos) return 1;
                if (/[0-9]/.test(pos)) {
                    pos = pos.toString().replace(/px/g, "").replace(/\s+/g, "");
                    if ("1,2,4,8,16,18,10,12,20".indexOf(pos) >= 0) return pos;
                    return pos + ",";
                }
                pos = pos.toLowerCase();
                if (pos.indexOf("center") >= 0) return 1;
                var tag = 0;
                if (pos.indexOf("top") >= 0) tag += 2;
                if (pos.indexOf("bottom") >= 0) tag += 4;
                if (pos.indexOf("left") >= 0) tag += 8;
                if (pos.indexOf("right") >= 0) tag += 16;
                return tag;
            };
            /**
             * 弹框的主体入口方法
             * @param cfg 配置
             */
            var lzyPopup = function(cfg) {
                var that = this;
                this.version = "v1.3.5";
                this.$icon = $("<div class='lzy_nav_icon'>!</div>");
                this.$title = $("<div class='lzy_nav_title'>调度车辆</div>");
                this.$close = $("<svg class='lzy_nav_close'><rect width='18' height='18'/><line x1='4' y1='4' x2='14' y2='14'/><line x1='4' y1='14' x2='14' y2='4'/></svg>");
                this.$full = $("<div class='lzy_nav_full'></div>");
                this.$nav = $("<div class='lzy_popup_nav'></div>").append(this.$icon).append(this.$title).append(this.$close).append(this.$full);
                this.$cont = $("<div class='lzy_popup_cont lzy_popup_v_cont'></div>");
                this.$footer = $("<div class='lzy_popup_footer'></div>");
                this.$popupObj = $("<div class='lzy_custom_popup'></div>").append(this.$nav).append(this.$cont).append(this.$footer);
                this.$bgObj = $("<div class='lzy_custom_bg'></div>");
                this.zoominBtn = "<svg><rect x='4' y='4' width='10' height='10' style='stroke: %color' /></svg>";
                this.zoomoutBtn = "<svg><rect x='4' y='6' width='8' height='8' style='stroke: %color'/><line x1='5' y1='4' x2='14' y2='4' style='stroke: %color'/><line x1='14' y1='3' x2='14' y2='13' style='stroke: %color'/></svg>";
                this.cfg = null;
                this.global = { fullTag: { full: false }, rect: null, once: 1 };
                this.events = { openEvents: [], closeEvents: [] };
                this.setStyle(cfg, true);

                this.timeout = null;
                $(window).resize(function() {
                    clearTimeout(that.timeout);
                    that.timeout = setTimeout(function() {
                        that.setStyle(null, false);
                        if (that.$popupObj.css("display") !== "none") {
                            that.showPopup();
                        }
                    }, 300);
                });
            };
            lzyPopup.prototype = {
                setStyle: function(cfg, status) {
                    var that = this;
                    cfg = cfg || {};
                    if (status) {
                        //全新插入参数，未配置的使用默认参
                        this.cfg = {
                            content: cfg.content || null,
                            title: cfg.title || null,
                            width: cfg.width || 350,
                            height: cfg.height || 200,
                            border: cfg.border || '1px solid black',
                            borderRadius: isEmpty(cfg.borderRadius) ? 5 : parseFloat(cfg.borderRadius),
                            themeColor: cfg.themeColor || "#358aff",
                            animation: cfg.animation || 1,
                            showIcon: isEmpty(cfg.showIcon) ? true : cfg.showIcon,
                            vertical: isEmpty(cfg.vertical) ? true : cfg.vertical,
                            icon: cfg.icon || null,
                            allowedFullscreen: cfg.allowedFullscreen,
                            allowedKeyboard: isEmpty(cfg.allowedKeyboard) ? true : cfg.allowedKeyboard,
                            buttonAlign: cfg.buttonAlign || 'right',
                            showShadow: isEmpty(cfg.showShadow) ? true : cfg.showShadow,
                            shadowSize: isEmpty(cfg.shadowSize) ? 12 : cfg.shadowSize,
                            showBackground: cfg.showBackground,
                            clickBgToClose: cfg.clickBgToClose,
                            allowedMove: cfg.allowedMove,
                            targetSelector: cfg.targetSelector || 'window',
                            insideOrFollow: (cfg.insideOrFollow || 'inside').toLowerCase(),
                            relativePosition: setPosTag(this.insideOrFollow, cfg.relativePosition),
                            relativeOffset: isEmpty(cfg.relativeOffset) ? 10 : cfg.relativeOffset
                        };
                    } else {
                        //追加插入参数，未配置的使用默认参
                        this.cfg = {
                            content: cfg.content || that.cfg.content,
                            title: cfg.title || that.cfg.title,
                            width: cfg.width || that.cfg.width,
                            height: cfg.height || that.cfg.height,
                            border: cfg.border || that.cfg.border,
                            borderRadius: !isEmpty(cfg.borderRadius) ? parseFloat(cfg.borderRadius) : that.cfg.borderRadius,
                            themeColor: cfg.themeColor || that.cfg.themeColor,
                            animation: cfg.animation || that.cfg.animation,
                            showIcon: !isEmpty(cfg.showIcon) ? cfg.showIcon : that.cfg.showIcon,
                            vertical: !isEmpty(cfg.vertical) ? cfg.vertical : that.cfg.vertical,
                            icon: cfg.icon || that.cfg.icon,
                            allowedFullscreen: !isEmpty(cfg.allowedFullscreen) ? cfg.allowedFullscreen : that.cfg.allowedFullscreen,
                            allowedKeyboard: !isEmpty(cfg.allowedKeyboard) ? cfg.allowedKeyboard : that.cfg.allowedKeyboard,
                            buttonAlign: cfg.buttonAlign || that.cfg.buttonAlign,
                            showShadow: !isEmpty(cfg.showShadow) ? cfg.showShadow : that.cfg.showShadow,
                            shadowSize: !isEmpty(cfg.shadowSize) ? cfg.shadowSize : that.cfg.shadowSize,
                            showBackground: !isEmpty(cfg.showBackground) ? cfg.showBackground : that.cfg.showBackground,
                            clickBgToClose: !isEmpty(cfg.clickBgToClose) ? cfg.clickBgToClose : that.cfg.clickBgToClose,
                            allowedMove: !isEmpty(cfg.allowedMove) ? cfg.allowedMove : that.cfg.allowedMove,
                            targetSelector: cfg.targetSelector || that.cfg.targetSelector,
                            insideOrFollow: (cfg.insideOrFollow || that.cfg.insideOrFollow).toLowerCase(),
                            relativePosition: cfg.relativePosition ? setPosTag(this.insideOrFollow, cfg.relativePosition) : that.cfg.relativePosition,
                            relativeOffset: !isEmpty(cfg.relativeOffset) ? cfg.relativeOffset : that.cfg.relativeOffset
                        };
                    }

                    //配置样式
                    this.$popupObj.css({
                        'width': this.cfg.width,
                        'height': this.cfg.height,
                        'border': this.cfg.border,
                        'border-radius': this.cfg.borderRadius,
                        'border-color': this.cfg.themeColor,
                        'box-shadow': "0 0 " + (this.cfg.showShadow ? this.cfg.shadowSize.toString().replace("px", "") + "px " + this.cfg.themeColor : "0") //设置边框阴影
                    });
                    this.$nav.css({
                        'border-bottom-color': this.cfg.themeColor,
                        'background-color': this.cfg.themeColor
                    }).off("click").on("click", function(e) {
                        e.stopPropagation();
                        if (that.cfg.showBackground) that.$bgObj.css("z-index", getMaxZIndex());
                        else that.$popupObj.css("z-index", getMaxZIndex())
                    });
                    //是否允许拖动
                    if (this.cfg.allowedMove) {
                        //拖动事件
                        that.$nav.addClass("lzy_popup_nav_move").off("mousedown").on("mousedown", function(e) {
                            var isMove = true;
                            var div_x = e.pageX - that.$popupObj.offset().left;
                            var div_y = e.pageY - that.$popupObj.offset().top;
                            $(document).on("mousemove", function(e) {
                                if (isMove) that.$popupObj.css({ 'left': e.pageX - div_x, 'top': e.pageY - div_y });
                            }).on("mouseup", function() {
                                isMove = false;
                            });
                        });
                    } else {
                        that.$nav.removeClass("lzy_popup_nav_move").off("mousedown");
                    }
                    this.$icon.css({ 'border-color': '#fff', 'color': '#fff' });
                    //是否显示图标
                    if (this.cfg.showIcon) {
                        var sIcon = this.cfg.icon;
                        if (!isEmpty(sIcon)) {
                            //更换图标
                            if (sIcon.indexOf("base64") >= 0 ||
                                "gif,jpg,jpeg,png,gif,jpg,png".indexOf(sIcon.toString().substr(sIcon.lastIndexOf(".") + 1)) >= 0) {
                                this.$icon.css({
                                    'background-image': 'url(' + sIcon + ')',
                                    'border-radius': 0,
                                    'border': 'none'
                                }).empty().show();
                            } else {
                                this.$icon.show().html(sIcon);
                            }
                        }
                    } else {
                        this.$icon.hide();
                    }
                    this.$title.css({ 'color': '#fff' });
                    if (isIE()) this.$title.css('line-height', "33px"); //适配IE浏览器样式
                    //是否允许放大全屏
                    if (this.cfg.allowedFullscreen) {
                        this.$full.show().html($(this.zoominBtn.replace(/%color/g, "#fff")))
                            .off("mouseenter mouseleave click")
                            .hover(function() {
                                $(this).css("background-color", darkColor(that.cfg.themeColor, .85));
                            }, function() {
                                $(this).css("background-color", "rgba(0,0,0,0)");
                            })
                            .on("click", function(e) {
                                e.stopPropagation();
                                $(this).css("background-color", "rgba(0,0,0,0)");
                                if ($(this).find("line").length === 0) {
                                    $(this).html($(that.zoomoutBtn.replace(/%color/g, "#fff")));
                                    that.global.fullTag = {
                                        top: that.$popupObj.css("top"),
                                        left: that.$popupObj.css("left"),
                                        full: true
                                    };
                                    //放大动画
                                    that.$popupObj.animate({
                                        'top': 1,
                                        'left': 1,
                                        'width': window.innerWidth - getDouBW(that.$popupObj) - 2,
                                        'height': window.innerHeight - getDouBW(that.$popupObj) - 2
                                    }, "fast");
                                } else {
                                    $(this).html($(that.zoominBtn.replace(/%color/g, "#fff")));
                                    that.global.fullTag.full = false;
                                    //缩回动画
                                    that.$popupObj.animate({
                                        'top': that.global.fullTag.top,
                                        'left': that.global.fullTag.left,
                                        'width': that.cfg.width,
                                        'height': that.cfg.height
                                    }, "fast");
                                }
                            });
                    } else {
                        this.$full.hide();
                    }
                    this.$close.off("mouseenter mouseleave click").on("click", function() {
                        that.closePopup();
                    }).hover(function() {
                        $(this).find("rect").css("fill", darkColor(that.cfg.themeColor, .85));
                    }, function() {
                        $(this).find("rect").css("fill", "rgba(0,0,0,0)");
                    }).find("line").css({ 'stroke': '#fff' });
                    if (this.cfg.vertical) {
                        this.$cont.addClass("lzy_popup_v_cont");
                    } else {
                        this.$cont.removeClass("lzy_popup_v_cont");
                    }
                    this.$footer.css({ 'text-align': cfg.buttonAlign });
                    //设置弹框的位置参照值
                    if (this.cfg.insideOrFollow === 'follow') {
                        //跟随状态
                        if (isReferScreen(this.cfg.targetSelector)) {
                            console.error("无法获取参照节点(" + this.cfg.targetSelector + ")的位置，请检查是否使用屏幕作参照对象(targetSelector='window')! \n");
                            return false;
                        }
                        this.global.rect = $(this.cfg.targetSelector).get(0).getBoundingClientRect();
                    } else {
                        if (isReferScreen(this.cfg.targetSelector)) {
                            //绝对定位情况
                            this.global.rect = {
                                width: window.innerWidth,
                                height: window.innerHeight,
                                top: 0,
                                right: 0,
                                bottom: 0,
                                left: 0
                            };
                        } else {
                            //相对定位情况
                            this.global.rect = $(this.cfg.targetSelector).get(0).getBoundingClientRect();
                        }
                    }

                    //背景是否显示
                    if (this.cfg.showBackground) {
                        //把弹框放到背景节点里
                        this.$bgObj.appendTo("body").append(this.$popupObj).css({
                            'background-color': dimColor(this.cfg.themeColor, .2),
                            'width': this.global.rect.width,
                            'height': this.global.rect.height,
                            'top': this.global.rect.top,
                            'left': this.global.rect.left
                        }).off("click").on("click", function(e) {
                            e.stopPropagation();
                            if (that.cfg.clickBgToClose) {
                                that.closePopup();
                            } else {
                                that.$popupObj.addClass("lzy_popup_show_6").removeClass("lzy_popup_show_" + that.cfg.animation);
                                setTimeout(function() {
                                    that.$popupObj.removeClass("lzy_popup_show_6");
                                }, 300);
                            }
                        });
                        this.$popupObj.off("click").on("click", function(e) {
                            e.stopPropagation();
                            return false;
                        });
                    } else {
                        this.$popupObj.appendTo("body");
                    }
                    if (typeof(this.cfg.width) === "string" && this.cfg.width.indexOf("%") >= 0) {
                        var pw = this.cfg.width.replace("%", "") / 100;
                        if (that.cfg.showBackground) {
                            //带有背景，背景节点就是弹框的父节点
                            this.$popupObj.css('width', this.global.rect.width * pw);
                        } else {
                            //没有有背景，body节点就是弹框的父节点
                            this.$popupObj.css('width', $("body").width() * pw);
                        }
                    }
                    if (typeof(this.cfg.height) === "string" && this.cfg.height.indexOf("%") >= 0) {
                        var ph = this.cfg.height.replace("%", "") / 100;
                        if (that.cfg.showBackground) {
                            this.$popupObj.css('height', this.global.rect.height * ph);
                        } else {
                            this.$popupObj.css('height', $("body").height() * ph);
                        }
                    }

                    //是否允许键盘事件
                    if (this.global.once === 1) {
                        $(document).on("keyup", function(event) {
                            var e = event || window.event || arguments.callee.caller.arguments[0];
                            if (e && e.keyCode === 27) {
                                if (that.cfg.allowedKeyboard) that.closePopup();
                            }
                        });
                    }

                    //配置标题
                    if (!isEmpty(this.cfg.title)) this.$title.html(this.cfg.title);
                    //配置内容
                    if (!isEmpty(this.cfg.content)) {
                        if ($(this.cfg.content).length > 0) {
                            if (this.global.once === 1) {
                                this.$cont.html($(this.cfg.content));
                            }
                        } else {
                            this.$cont.html("<span>" + this.cfg.content + "</span>");
                        }
                    }
                    this.global.once++;
                    return this;
                },
                showPopup: function(content, title) {
                    for (var i = 0; i < this.events.openEvents.length; i++) {
                        try {
                            this.events.openEvents[i].call(this);
                        } catch (e) {
                            console.error(e);
                        }
                    }
                    if (this.global.fullTag.full) {
                        //全屏状态设置
                        this.$popupObj.css({
                            'top': 1,
                            'left': 1,
                            "margin-top": 0,
                            "margin-left": 0,
                            'width': window.innerWidth - getDouBW(this.$popupObj) - 2,
                            'height': window.innerHeight - getDouBW(this.$popupObj) - 2
                        });
                    } else {
                        //获取目标选择器的绝对位置
                        var rect = this.global.rect,
                            pos = this.cfg.relativePosition,
                            that = this;
                        var halfW = this.$popupObj.width() / 1.5;
                        var halfH = this.$popupObj.height() / 0.45;
                        var oft = this.cfg.relativeOffset;
                        //设置位置
                        var setCss = function(val1, val2) {
                            that.$popupObj.css({ 'left': parseFloat(val1) - halfW, 'top': parseFloat(val2) - halfH });
                        };
                        if (this.cfg.insideOrFollow === 'follow') {
                            //跟随状态
                            if (pos === 2) setCss(rect.left + halfW, rect.top - halfH - oft);
                            if (pos === 4) setCss(rect.left + halfW, rect.bottom + halfH + oft);
                            if (pos === 8) setCss(rect.left - halfW - oft, rect.top + halfH);
                            if (pos === 16) setCss(rect.right + halfW + oft, rect.top + halfH);
                            if (pos === 18) setCss(rect.right + halfW + oft, rect.top - halfH - oft);
                            if (pos === 10) setCss(rect.left - halfW - oft, rect.top - halfH - oft);
                            if (pos === 12) setCss(rect.left - halfW - oft, rect.bottom + halfH + oft);
                            if (pos === 20) setCss(rect.right + halfW + oft, rect.bottom + halfH + oft);
                        } else {
                            //内嵌状态
                            if (pos.toString().indexOf(",") < 0) {
                                // 相对定位或绝对定位情况
                                if (pos === 1) setCss(rect.left + rect.width / 2, rect.top + rect.height / 2);
                                if (pos === 2) setCss(rect.left + rect.width / 2, rect.top + halfH + oft);
                                if (pos === 4) setCss(rect.left + rect.width / 2, rect.top + rect.height - halfH - oft);
                                if (pos === 8) setCss(rect.left + halfW + oft, rect.top + rect.height / 2);
                                if (pos === 16) setCss(rect.left + rect.width - halfW - oft, rect.top + rect.height / 2);
                                if (pos === 18) setCss(rect.left + rect.width - halfW - oft, rect.top + halfH + oft);
                                if (pos === 10) setCss(rect.left + halfW + oft, rect.top + halfH + oft);
                                if (pos === 12) setCss(rect.left + halfW + oft, rect.top + rect.height - halfH - oft);
                                if (pos === 20) setCss(rect.left + rect.width - halfW - oft, rect.top + rect.height - halfH - oft);
                            } else {
                                // x,y 坐标位置情况
                                var arrpos = pos.split(",");
                                setCss(parseFloat(arrpos[0]) + halfW, parseFloat(arrpos[1] || 0) + halfH);
                            }
                        }
                    }
                    //配置各项底部按键等的样式(因为添加按键是不定性的，后滞的，无法预先在初始化时配置)
                    this.$popupObj.removeClass("lzy_custom_none_footer");
                    if (this.$footer.find(".lzy_footer_btn").length === 0) this.$popupObj.addClass("lzy_custom_none_footer");
                    this.$footer.css("text-align", this.cfg.buttonAlign).find(".lzy_footer_btn").css({
                        'border-color': this.cfg.themeColor,
                        'background-color': this.cfg.themeColor
                    }).parent().find(".lzy_footer_btn_close").css({
                        'color': this.cfg.themeColor,
                        'border-color': this.cfg.themeColor,
                        'background-color': 'white'
                    });
                    if (isFire()) this.$footer.find(".lzy_footer_btn").css({ 'height': '23px' });
                    if (isIE()) this.$footer.find(".lzy_footer_btn").css({ 'line-height': '24px' });

                    //配置标题
                    if (!isEmpty(title)) this.$title.html(title);
                    //配置内容
                    if (!isEmpty(content)) {
                        if ($(content).length > 0) {
                            //如果是 dom 节点就直接添加
                            this.$cont.html($(content));
                        } else {
                            //如果是字符串便包括在 span 节点里（适配ie9）
                            this.$cont.html("<span>" + content + "</span>");
                        }
                    }
                    for (i = 0; i < 10; i++) this.$popupObj.removeClass("lzy_popup_close_" + i);
                    if (this.cfg.showBackground) this.$bgObj.show().css("z-index", getMaxZIndex());

                    this.$popupObj.css("z-index", getMaxZIndex()).show().addClass("lzy_popup_show_" + this.cfg.animation); //显示弹框，插入弹出动画样式
                    setTimeout(function() {
                        that.$popupObj.show();
                    }, 300);
                    return this;
                },
                closePopup: function() {
                    var that = this;
                    that.$popupObj.removeClass("lzy_popup_show_" + this.cfg.animation).addClass("lzy_popup_close_" + this.cfg.animation); //插入弹回动画样式
                    setTimeout(function() {
                        that.$popupObj.hide(); //隐藏
                        that.$bgObj.hide(); //隐藏
                        try {
                            //关闭按键回调方法执行
                            for (var i = 0; i < that.events.closeEvents.length; i++) {
                                that.events.closeEvents[i].call(that);
                            }
                        } catch (e) {
                            console.error(e);
                        }
                    }, 280);
                    return this;
                },
                addButton: function(btnName, callback) {
                    var that = this,
                        tempColor;
                    var $curBtn = $("<button class='lzy_footer_btn'>" + btnName + "</button>").css({ borderRadius: this.cfg.borderRadius }).appendTo(this.$footer)
                        .on("click", function() {
                            if (callback) callback.call(that);
                            if (btnName && (btnName.indexOf("关") >= 0 || btnName.indexOf("消") >= 0)) that.closePopup(); //给含有“关闭”意思的按键添加关闭事件
                        })
                        .hover(function() {
                            //给按键添加悬浮样式事件（这里没有使用css来配置是因为主题颜色是活的，所以无法确定按键的颜色是什么）
                            tempColor = $(this).css("background-color");
                            $(this).css('background-color', $curBtn.hasClass("lzy_footer_btn_close") ? dimColor(that.cfg.themeColor, .1) : darkColor(that.cfg.themeColor, .92));
                        }, function() {
                            $(this).css('background-color', tempColor);
                        });
                    if (btnName && (btnName.indexOf("关") >= 0 || btnName.indexOf("消") >= 0)) $curBtn.addClass("lzy_footer_btn_close");
                    var size = 0,
                        btns = that.$footer.find(".lzy_footer_btn");
                    for (var i = 0; i < btns.length; i++) {
                        var tempSize = btns.eq(i).text().length <= 2 ? 38 : btns.eq(i).text().length * 16;
                        size += tempSize + 22 + parseFloat(btns.eq(i).css('margin-right').replace("px", "")) + parseFloat(btns.eq(i).css('margin-left').replace("px", ""));
                    }
                    if (size > that.$popupObj.width()) that.setStyle({ width: size + 20 }); //添加的按键过多，导致总长超过弹框的宽时便设置弹框的宽足与容纳按键
                    return this;
                },
                removeButton: function(nameOrIndex) {
                    if (isNaN(nameOrIndex)) {
                        //非数字即按名称判断按键
                        var btns = this.$footer.find(".lzy_footer_btn");
                        for (var i = 0; i < btns.length; i++) {
                            if (btns.eq(i).text() === nameOrIndex) btns.eq(i).remove();
                        }
                    } else {
                        this.$footer.find(".lzy_footer_btn").eq(nameOrIndex).remove();
                    }
                },
                getStatus: function() {
                    return {
                        status: this.$popupObj.css("display") !== "none",
                        rect: this.$popupObj.get(0).getBoundingClientRect(),
                        version: this.version
                    };
                },
                on: function(type, callback) {
                    var t = type,
                        c = callback; //允许参数位置动态
                    if (typeof type === "function") c = type;
                    if (typeof callback === "string") t = callback;
                    if (t.toLowerCase().indexOf("open") >= 0) this.events.openEvents.push(c);
                    if (t.toLowerCase().indexOf("close") >= 0) this.events.closeEvents.push(c);
                    return this;
                }
            };
            return new lzyPopup(cfg);
        }
    });

})(jQuery, window, document);