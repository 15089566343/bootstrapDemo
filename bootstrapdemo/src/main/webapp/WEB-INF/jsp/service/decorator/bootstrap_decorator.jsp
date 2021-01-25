<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@page import="com.hsw.util.PathUtil" %>
<!DOCTYPE html>
<html>
<head>
    <%
        String basePath = PathUtil.getBaseUrl() + "/";
    %>
    <base href="<%=basePath%>"/>
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
    <sitemesh:write property='head'/>
</head>
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

<sitemesh:write property='body'/>
</html>