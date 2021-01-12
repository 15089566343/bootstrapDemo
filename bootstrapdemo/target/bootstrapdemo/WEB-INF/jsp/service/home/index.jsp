<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.hsw.util.PathUtil" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE HTML>
<html>
<head>
    <%
        String basePath = PathUtil.getBaseUrl() + "/";
        String path = request.getContextPath();
    %>
    <base href="<%=basePath%>"/>
    <meta charset="utf-8">
    <script type="text/javascript" src="assets/home/js/html5.js"></script>
    <script type="text/javascript" src="assets/home/js/respond.min.js"></script>
    <link href="assets/home/css/H-ui.min.css" rel="stylesheet" type="text/css"/>
    <link href="assets/home/css/H-ui.admin.css" rel="stylesheet" type="text/css"/>
    <link href="assets/home/skin/default/skin.css" rel="stylesheet" type="text/css"/>
    <link href="assets/home/js/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet" type="text/css"/>
    <title>Bootstrap</title>
</head>
<body>
<header class="Hui-header cl"><a class="Hui-logo l" title="H-ui.home v2.3" href="/">Bootstrap</a>
    <a aria-hidden="false" class="Hui-nav-toggle" href="#"></a>
</header>

<%--左侧菜单--%>
<aside class="Hui-aside">
    <div class="menu_dropdown bk_2">
        <dl id="menu-article">
            <dt><i class="Hui-iconfont">&#xe616;</i> 表单<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul>
                    <li><a _href="upload_download.html" href="javascript:void(0)">上传下载</a></li>
                </ul>
            </dd>
        </dl>
        <dl id="menu-picture">
            <dt><i class="Hui-iconfont">&#xe613;</i> 图片管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul>
                    <li><a _href="picture-list.html" href="javascript:void(0)">图片管理</a></li>
                </ul>
            </dd>
        </dl>
        <dl id="menu-product">
            <dt><i class="Hui-iconfont">&#xe620;</i> 产品管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul>
                    <li><a _href="product-brand.html" href="javascript:void(0)">品牌管理</a></li>
                    <li><a _href="product-category.html" href="javascript:void(0)">分类管理</a></li>
                    <li><a _href="product-list.html" href="javascript:void(0)">产品管理</a></li>
                </ul>
            </dd>
        </dl>
        <dl id="menu-page">
            <dt><i class="Hui-iconfont">&#xe626;</i> 页面管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul>
                    <li><a _href="page-home.html" href="javascript:void(0)">首页管理</a></li>
                    <li><a _href="page-flinks.html" href="javascript:void(0)">友情链接</a></li>
                </ul>
            </dd>
        </dl>
        <dl id="menu-comments">
            <dt><i class="Hui-iconfont">&#xe622;</i> 评论管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul>
                    <li><a _href="http://h-ui.duoshuo.com/home/" href="javascript:;">评论列表</a></li>
                    <li><a _href="feedback-list.html" href="javascript:void(0)">意见反馈</a></li>
                </ul>
            </dd>
        </dl>
        <dl id="menu-order">
            <dt><i class="Hui-iconfont">&#xe63a;</i> 财务管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul>
                    <li><a _href="order-list.html" href="javascript:void(0)">订单列表</a></li>
                    <li><a _href="recharge-list.html" href="javascript:void(0)">充值管理</a></li>
                    <li><a _href="invoice-list.html" href="javascript:void(0)">发票管理</a></li>
                </ul>
            </dd>
        </dl>
        <dl id="menu-member">
            <dt><i class="Hui-iconfont">&#xe60d;</i> 会员管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul>
                    <li><a _href="member-list.html" href="javascript:;">会员列表</a></li>
                    <li><a _href="member-del.html" href="javascript:;">删除的会员</a></li>
                    <li><a _href="member-level.html" href="javascript:;">等级管理</a></li>
                    <li><a _href="member-scoreoperation.html" href="javascript:;">积分管理</a></li>
                    <li><a _href="member-record-browse.html" href="javascript:void(0)">浏览记录</a></li>
                    <li><a _href="member-record-download.html" href="javascript:void(0)">下载记录</a></li>
                    <li><a _href="member-record-share.html" href="javascript:void(0)">分享记录</a></li>
                </ul>
            </dd>
        </dl>
        <dl id="menu-home">
            <dt><i class="Hui-iconfont">&#xe62d;</i> 管理员管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul>
                    <li><a _href="home-role.html" href="javascript:void(0)">角色管理</a></li>
                    <li><a _href="home-permission.html" href="javascript:void(0)">权限管理</a></li>
                    <li><a _href="home-list.html" href="javascript:void(0)">管理员列表</a></li>
                </ul>
            </dd>
        </dl>
        <dl id="menu-tongji">
            <dt><i class="Hui-iconfont">&#xe61a;</i> 系统统计<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul>
                    <li><a _href="charts-1.html" href="javascript:void(0)">折线图</a></li>
                    <li><a _href="<%=basePath%>home/charts-2.html" href="javascript:void(0)">时间轴折线图</a></li>
                    <li><a _href="charts-3.html" href="javascript:void(0)">区域图</a></li>
                    <li><a _href="charts-4.html" href="javascript:void(0)">柱状图</a></li>
                    <li><a _href="charts-5.html" href="javascript:void(0)">饼状图</a></li>
                    <li><a _href="charts-6.html" href="javascript:void(0)">3D柱状图</a></li>
                    <li><a _href="charts-7.html" href="javascript:void(0)">3D饼状图</a></li>
                </ul>
            </dd>
        </dl>
        <dl id="menu-system">
            <dt><i class="Hui-iconfont">&#xe62e;</i> 系统管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul>
                    <li><a _href="system-base.html" href="javascript:void(0)">系统设置</a></li>
                    <li><a _href="system-category.html" href="javascript:void(0)">栏目管理</a></li>
                    <li><a _href="system-data.html" href="javascript:void(0)">数据字典</a></li>
                    <li><a _href="system-shielding.html" href="javascript:void(0)">屏蔽词</a></li>
                    <li><a _href="system-log.html" href="javascript:void(0)">系统日志</a></li>
                </ul>
            </dd>
        </dl>
<%--        <dl id="menu-Bootstrap">--%>
<%--            <dt><i class="Hui-iconfont">&#xe625;</i> Bootstrap模板<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>--%>
<%--            <dd>--%>
<%--                <ul>--%>
<%--                    <li><a _href="<%=basePath%>bootstrapdemo/listTable" href="javascript:void(0)">表格</a></li>--%>
<%--                    <li><a _href="<%=basePath%>bootstrapdemo/tablePrint" href="javascript:void(0)">表格打印</a></li>--%>
<%--                </ul>--%>
<%--            </dd>--%>
<%--        </dl>--%>
    </div>
</aside>

<%--隐藏左侧菜单--%>
<div class="dislpayArrow"><a class="pngfix" href="javascript:void(0);" onClick="displaynavbar(this)"></a></div>

<section class="Hui-article-box">
    <div id="Hui-tabNav" class="Hui-tabNav">
        <div class="Hui-tabNav-wp">
            <ul id="min_title_list" class="acrossTab cl">
                <li class="active"><span title="首页" data-href="welcome.html">首页</span><em></em></li>
            </ul>
        </div>
        <div class="Hui-tabNav-more btn-group">
            <a id="js-tabNav-prev" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont">&#xe6d4;</i></a>
            <a id="js-tabNav-next" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont">&#xe6d7;</i></a>
        </div>
    </div>
    <div id="iframe_box" class="Hui-article">
        <div class="show_iframe">
            <div style="display:none" class="loading"></div>
            <iframe scrolling="yes" frameborder="0" src="<%=basePath%>home/welcome"></iframe>
        </div>
    </div>
</section>
<script type="text/javascript" src="assets/home/js/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="assets/home/js/layer/1.9.3/layer.js"></script>
<script type="text/javascript" src="assets/home/js/H-ui.js"></script>
<script type="text/javascript" src="assets/home/js/H-ui.admin.js"></script>
<script type="text/javascript">
    /*资讯-添加*/
    function article_add(title, url) {
        var index = layer.open({
            type: 2,
            title: title,
            content: url
        });
        layer.full(index);
    }

    /*图片-添加*/
    function picture_add(title, url) {
        var index = layer.open({
            type: 2,
            title: title,
            content: url
        });
        layer.full(index);
    }

    /*产品-添加*/
    function product_add(title, url) {
        var index = layer.open({
            type: 2,
            title: title,
            content: url
        });
        layer.full(index);
    }

    /*用户-添加*/
    function member_add(title, url, w, h) {
        layer_show(title, url, w, h);
    }
</script>
</body>
</html>