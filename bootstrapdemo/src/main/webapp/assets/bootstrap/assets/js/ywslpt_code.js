/**
 * 描述:
 * @author huangshengwen
 * @since 2021/01/12
 */

(function (window, $) {
    var codes = [
        {"code": "0", "value": "提交成功"}, {"code": "-1", "value": "预受理失败"}, {"code": "1", "value": "预受理成功"},
        {"code": "LCB000", "value": "信息录入"}, {"code": "LCB001", "value": "已受理"}, {
            "code": "LCB002",
            "value": "已扫描"
        }, {"code": "LCB003", "value": "已初审，待复审"}, {"code": "LCB004", "value": "已分配，待初审"}, {
            "code": "LCB005",
            "value": "已初审"
        }, {"code": "LCB006", "value": "已复审"}, {"code": "LCB007", "value": "已办结"}, {
            "code": "LCB009",
            "value": "已作废"
        }, {"code": "LCB112", "value": "二级审批不通过"}, {"code": "LCB113", "value": "业务已回退"}, {
            "code": "LCB016",
            "value": "二级审批通过,待办结"
        }, {"code": "LCB017", "value": "三级通过待办结"}, {"code": "LCB014", "value": "已补扫"}, {
            "code": "LCB013",
            "value": "已终止"
        }, {"code": "LCB015", "value": "待审核"}, {"code": "LCB010", "value": "三级已审批"}, {
            "code": "LCB008",
            "value": "二级已审批"
        }, {"code": "LCB115", "value": "已办结,未扫描"}, {"code": "LCB116", "value": "审核不通过"}, {
            "code": "LCB117",
            "value": "不予受理"
        }, {"code": "LCB118", "value": "后台扭转"}, {"code": "LCB119", "value": "已扫描,待获取"}, {
            "code": "LCB120",
            "value": "已分配,待录入"
        }, {"code": "LCB121", "value": "已录入,待初审"}, {"code": "LCB018", "value": "四级已审批,待办结"}, {
            "code": "LCB011",
            "value": "四级已审批"
        }, {"code": "LCB019", "value": "五级已审批,待办结"}];

    function getCode(code) {
        var resultItem;
        $.each(codes, function (index, item) {
            if (item.code == code) {
                resultItem = item;
                return false;
            }
        });
        return resultItem.value;
    }

    window.ywslpt_code = {
        getCode: getCode
    };
})(window, jQuery);