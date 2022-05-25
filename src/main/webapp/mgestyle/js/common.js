var num = 1;
$(function() {

    $(".tabs").slide({
        trigger: "click"
    });

});

var btn_save = function() {
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
        success: function(data) {
            if (data > 0) {
                $.jq_Alert({
                    message: "添加成功",
                    btnOktext: "确认",
                    dialogModal: true,
                    btnOkClick: function() {
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
};

var btn_edit = function(id) {
    $.jq_Panel({
        url: "/RawMaterialsType/EditRawMaterialsType?id=" + id,
        title: "编辑分类",
        dialogModal: true,
        iframeWidth: 500,
        iframeHeight: 400
    });
};
var btn_delete = function(id) {
    $.jq_Confirm({
        message: "您确定要删除吗?",
        btnOkClick: function() {
            $.ajax({
                type: "post",
                url: "/RawMaterialsType/DeleteRawMaterialsType",
                data: {
                    id: id
                },
                success: function(data) {
                    if (data > 0) {
                        $.jq_Alert({
                            message: "删除成功",
                            btnOkClick: function() {
                                page1();
                            }
                        });
                    }
                }
            });
        }
    });
};