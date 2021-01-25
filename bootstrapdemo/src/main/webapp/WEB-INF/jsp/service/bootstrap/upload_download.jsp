<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.hsw.util.PathUtil" %>
<!DOCTYPE HTML>
<html>
<head>
    <%
        String basePath = PathUtil.getBaseUrl() + "/";
        String path = request.getContextPath();
    %>
    <base href="<%=basePath%>"/>
    <meta charset="utf-8">
    <title>首页</title>
    <link rel="stylesheet" href="assets/bootstrap/assets/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/bootstrap/assets/plugins/bootstrap-table/dist/bootstrap-table.css">
    <link rel="stylesheet" href="assets/bootstrap/assets/plugins/bootstrap3-editable/css/bootstrap-editable.css">
    <link rel="stylesheet" href="assets/bootstrap/assets/plugins/bootstrap-datepicker/css/bootstrap-datepicker.css">
    <link rel="stylesheet"  href="assets/bootstrap/assets/plugins/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css">

    <link rel="stylesheet" href="assets/bootstrap/assets/plugins/bootstrap-select/dist/css/bootstrap-select.css">
    <link rel="stylesheet" href="assets/bootstrap/assets/plugins/webuploader/dist/webuploader.css">
    <link rel="stylesheet" href="assets/bootstrap/assets/plugins/webuploader/image-upload/style.css">
    <%--viewer--%>
    <link rel="stylesheet" href="assets/bootstrap/assets/plugins/viewerjs/dist/viewer.min.css">
    <%--easyui tree--%>
    <link rel="stylesheet" href="assets/bootstrap/assets/plugins/jquery-easyui-1.7.5/themes/bootstrap/easyui.css">
    <link rel="stylesheet" href="assets/bootstrap/assets/css/common.css">

    <style rel="stylesheet">
        /*表格重写*/
        #auxiliaryTable thead {
            background-color: #3498db;
        }
    </style>
</head>
<body>
<div class="pd-20" style="padding-top:20px;">
    <div class="box-header with-border materialTable">
        <h3 class="box-title dec_1">材料表格</h3>
    </div>
    <table id="auxiliaryTable"></table>
    <div class="modal fade" id="uploadModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         style="top: 10%">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">文件材料上传</h4>
                </div>
                <div class="modal-body">
                    <div id="uploader">
                        <div class="queueList">
                            <div id="dndArea" class="placeholder">
                                <div id="filePicker"></div>
                                <p>上传图片支持 jpg、jpeg、png 格式，每张图片大小应小于 8 MB，单次可选择多个文件格式</p>
                            </div>
                        </div>
                        <div class="statusBar" style="display:none;">
                            <div class="progress">
                                <span class="text">0%</span>
                                <span class="percentage"></span>
                            </div>
                            <div class="info"></div>
                            <div class="btns">
                                <div id="filePicker2"></div>
                                <div class="uploadBtn">开始上传</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="assets/bootstrap/assets/plugins/jquery/dist/jquery.min.js"></script>
<script type="text/javascript" src="assets/bootstrap/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
<%--validata--%>
<script type="text/javascript" src="assets/bootstrap/assets/plugins/jquery-validation/dist/jquery.validate.js"></script>
<script type="text/javascript" src="assets/bootstrap/assets/plugins/jquery-validation/dist/additional-methods.js"></script>
<script type="text/javascript" src="assets/bootstrap/assets/plugins/jquery-validation/dist/localization/messages_zh.js"></script>
<%--bootstrap table--%>
<script type="text/javascript" src="assets/bootstrap/assets/plugins/bootstrap-table/dist/bootstrap-table.min.js"></script>
<script type="text/javascript" src="assets/bootstrap/assets/plugins/bootstrap-table/dist/extensions/editable/bootstrap-table-editable.js"></script>
<script type="text/javascript" src="assets/bootstrap/assets/plugins/bootstrap3-editable/js/bootstrap-editable.js"></script>
<script type="text/javascript" src="assets/bootstrap/assets/plugins/bootstrap-table/dist/locale/bootstrap-table-zh-CN.js"></script>
<%--bootstrap select--%>
<script type="text/javascript"  src="assets/bootstrap/assets/plugins/bootstrap-select/dist/js/bootstrap-select.min.js"></script>
<%--bootstrap datepicker--%>
<script type="text/javascript" src="assets/bootstrap/assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="assets/bootstrap/assets/plugins/bootstrap-datepicker/locales/bootstrap-datepicker.zh-CN.min.js"></script>
<script type="text/javascript" src="assets/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" src="assets/bootstrap/assets/plugins/bootstrap-datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
<%--webuploader--%>
<script type="text/javascript" src="assets/bootstrap/assets/plugins/webuploader/dist/webuploader.min.js"></script>
<%--viewerjs--%>
<script type="text/javascript" src="assets/bootstrap/assets/plugins/viewerjs/dist/viewer.min.js"></script>
<%--easyui tree--%>
<script type="text/javascript" src="assets/bootstrap/assets/plugins/jquery-easyui-1.7.5/jquery.easyui.min.js"></script>

<%--layer--%>
<script type="text/javascript" src="assets/plugins/layer-v2.4/layer.js"></script>

<%--form-jqeury--%>
<script type="text/javascript" src="assets/common/jquery-form.js"></script>
<script type="text/javascript" src="assets/common/core.js"></script>
<script type="text/javascript" src="assets/bootstrap/assets/js/index.js"></script>
<script type="text/javascript" src="assets/bootstrap/assets/js/upload.js"></script>
<script type="text/javascript">
    $(function () {
        ywslptUtil.reset();
        $('#uploadModel').on('shown.bs.modal', function (e) {
            $(window).resize();
        });
        $('#uploadModel').on('hidden.bs.modal', function (e) {
            var tempFiles = uploader.getFiles();
            $.each(tempFiles, function (index, item) {
                uploader.removeFile(item);
            });
            uploader.reset();
        });
        var data = '${queryMaterialList}';
        var $auxiliaryTable = $('#auxiliaryTable');
        if (data.length == 0) {
            $auxiliaryTable.prev('.materialTable').remove();
            $auxiliaryTable.remove();
        } else {
            $auxiliaryTable.AuxiliaryPart({data: ${queryMaterialList}});
        }
    });

    function virtualFormSubmit(url, params, target) {
        var form = document.createElement('form'); // 创建一个form表单
        form.name = 'tempForm1';
        form.method = 'post'; // 制定发送请求的方式为post
        form.action = url; // 此为window.open的url，通过表单的action来实现
        form.target = target;  // target=_self 表示提交后仍在当前页面      target=_blank表示提交跳转到新页面
        form.enctype = 'multipart/form-data';

        $.each(params, function (name, value) {
            var element = document.createElement('input');
            element.type = 'hidden';
            element.name = name;
            element.value = value;
            form.appendChild(element);
        });
        document.body.appendChild(form); // 将此form表单添加到页面主体body中
        form.submit(); // 手动触发，提交表单
        document.body.removeChild(form); // 从body中移除form表单
    }

</script>
</body>
</html>