<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <link href="assets/home/css/H-ui.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/home/css/H-ui.admin.css" rel="stylesheet" type="text/css" />

    <link href="assets/home/js/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet" type="text/css" />
    <title>首页</title>
</head>
<body>
<div class="pd-20" style="padding-top:20px;">
    <p class="f-20 text-success">Bootstrap Table 中文文档（完整版）</p>
    <table class="table table-border table-bordered table-bg">
        <thead>
        <tr>
            <th colspan="6" scope="col">表格参数</th>
        </tr>
        <tr class="text-c">
            <th>名称</th>
            <th>标签</th>
            <th>类型</th>
            <th>默认</th>
            <th>描述</th>
        </tr>
        </thead>
        <tbody>
        <tr class="text-c">
            <td>-</td>
            <td>data-toggle</td>
            <td>String</td>
            <td>‘table’</td>
            <td>不用写 JavaScript 直接启用表格。</td>
        </tr>
        <tr class="text-c">
            <td>classes</td>
            <td>data-classes</td>
            <td>String</td>
            <td>‘table table-hover’</td>
            <td>表格的类名称。默认情况下，表格是有边框的，你可以添加 ‘table-no-bordered’ 来删除表格的边框样式。</td>
        </tr>
        <tr class="text-c">
            <td>sortClass</td>
            <td>data-sort-class</td>
            <td>String</td>
            <td>undefined</td>
            <td>被排序的td标签的class名</td>
        </tr>
        <tr class="text-c">
            <td>height</td>
            <td>data-height</td>
            <td>Number</td>
            <td>undefinedtd>
            <td>定义表格的高度。</td>
        </tr>
        <tr class="text-c">
            <td>undefinedText</td>
            <td>data-undefined-text</td>
            <td>String</td>
            <td>‘-‘</td>
            <td>当数据为 undefined 时显示的字符</td>
        </tr>

        <tr class="text-c">
            <td>striped</td>
            <td>data-striped</td>
            <td>Boolean</td>
            <td>false</td>
            <td>设置为 true 会有隔行变色效果</td>
        </tr>
        <tr class="text-c">
            <td>sortName</td>
            <td>data-sort-name</td>
            <td>String</td>
            <td>undefined</td>
            <td>定义排序列,通过url方式获取数据填写字段名，否则填写下标</td>
        </tr>
        <tr class="text-c">
            <td>sortOrder</td>
            <td>data-sort-order</td>
            <td>String</td>
            <td>‘asc’</td>
            <td>定义排序方式 ‘asc’ 或者 ‘desc’</td>
        </tr>
        <tr class="text-c">
            <td>sortStable</td>
            <td>data-sort-stable</td>
            <td>Boolean</td>
            <td>false</td>
            <td>设置为 true 将获得稳定的排序，我们会添加_position属性到 row 数据中。</td>
        </tr>
        <tr class="text-c">
            <td>iconsPrefix</td>
            <td>data-icons-prefix</td>
            <td>String</td>
            <td>‘glyphicon’</td>
            <td>定义字体库 (‘Glyphicon’ or ‘fa’ for FontAwesome),使用”fa”时需引用 FontAwesome，并且配合 icons 属性实现效果
                Glyphicon 集成于Bootstrap可免费使用 参考：http://glyphicons.com/
                FontAwesome 参考：http://fortawesome.github.io/
            </td>
        </tr>
        <tr class="text-c">
            <td>icons</td>
            <td>data-icons</td>
            <td>Object</td>
            <td>{
                paginationSwitchDown: ‘glyphicon-collapse-down icon-chevron-down’,
                paginationSwitchUp: ‘glyphicon-collapse-up icon-chevron-up’,
                refresh: ‘glyphicon-refresh icon-refresh’
                toggle: ‘glyphicon-list-alt icon-list-alt’
                columns: ‘glyphicon-th icon-th’
                detailOpen: ‘glyphicon-plus icon-plus’
                detailClose: ‘glyphicon-minus icon-minus’
                }
            </td>
            <td>自定义图标</td>
        </tr>
        <tr class="text-c">
            <td>columns</td>
            <td>-</td>
            <td>Array</td>
            <td>[]</td>
            <td>列配置项,详情请查看 列参数 表格.</td>
        </tr>
        <tr class="text-c">
            <td>data</td>
            <td>-</td>
            <td>Array</td>
            <td>[]</td>
            <td>加载json格式的数据</td>
        </tr>
        <tr class="text-c">
            <td>ajax</td>
            <td>data-ajax</td>
            <td>Function</td>
            <td>undefined</td>
            <td>自定义 AJAX 方法,须实现 jQuery AJAX API</td>
        </tr>
        <tr class="text-c">
            <td>method</td>
            <td>data-method</td>
            <td>String</td>
            <td>‘get’</td>
            <td>服务器数据的请求方式 ‘get’ or ‘post’</td>
        </tr>
        <tr class="text-c">
            <td>url</td>
            <td>data-url</td>
            <td>String</td>
            <td>undefined</td>
            <td>服务器数据的加载地址</td>
        </tr>
        <tr class="text-c">
            <td>cache</td>
            <td>data-cache</td>
            <td>Boolean</td>
            <td>true</td>
            <td>设置为 true 禁用 AJAX 数据缓存</td>
        </tr>
        <tr class="text-c">
            <td>contentType</td>
            <td>data-content-type</td>
            <td>String</td>
            <td>‘application/json’</td>
            <td>发送到服务器的数据编码类型</td>
        </tr>
        <tr class="text-c">
            <td>dataType</td>
            <td>data-data-type</td>
            <td>String</td>
            <td>‘json’</td>
            <td>服务器返回的数据类型</td>
        </tr>
        <tr class="text-c">
            <td>ajaxOptions</td>
            <td>data-ajax-options</td>
            <td>Object</td>
            <td>{}</td>
            <td>提交ajax请求时的附加参数，可用参数列请查看http://api.jquery.com/jQuery.ajax.</td>
        </tr>
        <tr class="text-c">
            <td>queryParams</td>
            <td>data-query-params</td>
            <td>Function</td>
            <td>function(params) {
                return params;
                }
            </td>
            <td>请求服务器数据时，你可以通过重写参数的方式添加一些额外的参数，例如 toolbar 中的参数 如果 queryParamsType = ‘limit’ ,返回参数必须包含
                limit, offset, search, sort, order 否则, 需要包含:
                pageSize, pageNumber, searchText, sortName, sortOrder.
                返回false将会终止请求
            </td>
        </tr>
        <tr class="text-c">
            <td>queryParamsType</td>
            <td>data-query-params-type</td>
            <td>String</td>
            <td>‘limit’</td>
            <td>设置为 ‘limit’ 则会发送符合 RESTFul 格式的参数.</td>
        </tr>
        <tr class="text-c">
            <td>responseHandler</td>
            <td>data-response-handler</td>
            <td>Function</td>
            <td>function(res) {
                return res;
                }
            </td>
            <td>加载服务器数据之前的处理程序，可以用来格式化数据。
                参数：res为从服务器请求到的数据。
            </td>
        </tr>
        <tr class="text-c">
            <td>pagination</td>
            <td>data-pagination</td>
            <td>Boolean</td>
            <td>false</td>
            <td>设置为 true 会在表格底部显示分页条</td>
        </tr>
        <tr class="text-c">
            <td>paginationLoop</td>
            <td>data-pagination-loop</td>
            <td>Boolean</td>
            <td>true</td>
            <td>设置为 true 启用分页条无限循环的功能。</td>
        </tr>
        <tr class="text-c">
            <td>onlyInfoPagination</td>
            <td>data-only-info-pagination</td>
            <td>Boolean</td>
            <td>false</td>
            <td>设置为 true 只显示总数据数，而不显示分页按钮。需要 pagination=’True’</td>
        </tr>
        <tr class="text-c">
            <td>sidePagination</td>
            <td>data-side-pagination</td>
            <td>String</td>
            <td>‘client’</td>
            <td>设置在哪里进行分页，可选值为 ‘client’ 或者 ‘server’。设置 ‘server’时，必须设置 服务器数据地址（url）或者重写ajax方法</td>
        </tr>
        <tr class="text-c">
            <td>pageNumber</td>
            <td>data-page-number</td>
            <td>Number</td>
            <td>1</td>
            <td>如果设置了分页，首页页码</td>
        </tr>
        <tr class="text-c">
            <td>pageSize</td>
            <td>data-page-size</td>
            <td>Number</td>
            <td>10</td>
            <td>如果设置了分页，页面数据条数</td>
        </tr>
        <tr class="text-c">
            <td>pageList</td>
            <td>data-page-list</td>
            <td>Array</td>
            <td>[10, 25, 50, 100, All]</td>
            <td>如果设置了分页，设置可供选择的页面数据条数。设置为All 则显示所有记录。</td>
        </tr>
        <tr class="text-c">
            <td>selectItemName</td>
            <td>data-select-item-name</td>
            <td>String</td>
            <td>‘btSelectItem’</td>
            <td>radio or checkbox 的字段名</td>
        </tr>
        <tr class="text-c">
            <td>smartDisplay</td>
            <td>data-smart-display</td>
            <td>Boolean</td>
            <td>true</td>
            <td>设置为 true可以在分页和卡片视图快速切换</td>
        </tr>
        <tr class="text-c">
            <td>escape</td>
            <td>data-escape</td>
            <td>Boolean</td>
            <td>false</td>
            <td>转义HTML字符串，替换 &, <, >, ", `, 和 '字符.</td>
        </tr>
        <tr class="text-c">
            <td>search</td>
            <td>data-search</td>
            <td>Boolean</td>
            <td>false</td>
            <td>是否启用搜索框</td>
        </tr>
        <tr class="text-c">
            <td>searchOnEnterKey</td>
            <td>data-search-on-enter-key</td>
            <td>Boolean</td>
            <td>false</td>
            <td>设置为 true时，按回车触发搜索方法，否则自动触发搜索方法</td>
        </tr>
        <tr class="text-c">
            <td>strictSearch</td>
            <td>data-strict-search</td>
            <td>Boolean</td>
            <td>false</td>
            <td>设置为 true启用 全匹配搜索，否则为模糊搜索</td>
        </tr>
        <tr class="text-c">
            <td>searchText</td>
            <td>data-search-text</td>
            <td>String</td>
            <td>”</td>
            <td>初始化搜索文字</td>
        </tr>
        <tr class="text-c">
            <td>searchTimeOut</td>
            <td>data-search-time-out</td>
            <td>Number</td>
            <td>500</td>
            <td>设置搜索超时时间</td>
        </tr>
        <tr class="text-c">
            <td>trimOnSearch</td>
            <td>data-trim-on-search</td>
            <td>Boolean</td>
            <td>true</td>
            <td>设置为 true 将允许空字符搜索</td>
        </tr>
        <tr class="text-c">
            <td>showHeader</td>
            <td>data-show-header</td>
            <td>Boolean</td>
            <td>true</td>
            <td>是否显示列头</td>
        </tr>
        <tr class="text-c">
            <td>showFooter</td>
            <td>data-show-footer</td>
            <td>Boolean</td>
            <td>false</td>
            <td>是否显示列脚</td>
        </tr>
        <tr class="text-c">
            <td>showColumns</td>
            <td>data-show-columns</td>
            <td>Boolean</td>
            <td>false</td>
            <td>是否显示 内容列下拉框</td>
        </tr>
        <tr class="text-c">
            <td>showRefresh</td>
            <td>data-show-refresh</td>
            <td>Boolean</td>
            <td>false</td>
            <td>是否显示 刷新按钮</td>
        </tr>
        <tr class="text-c">
            <td>showToggle</td>
            <td>data-show-toggle</td>
            <td>Boolean</td>
            <td>false</td>
            <td>是否显示 切换试图（table/card）按钮</td>
        </tr>
        <tr class="text-c">
            <td>showPaginationSwitch</td>
            <td>data-show-pagination-switch</td>
            <td>Boolean</td>
            <td>false</td>
            <td>是否显示 数据条数选择框</td>
        </tr>
        <tr class="text-c">
            <td>minimumCountColumns</td>
            <td>data-minimum-count-columns</td>
            <td>Number</td>
            <td>1</td>
            <td>当列数小于此值时，将隐藏内容列下拉框。</td>
        </tr>
        <tr class="text-c">
            <td>idField</td>
            <td>data-id-field</td>
            <td>String</td>
            <td>undefined</td>
            <td>指定主键列</td>
        </tr>
        <tr class="text-c">
            <td>uniqueId</td>
            <td>data-unique-id</td>
            <td>String</td>
            <td>undefined</td>
            <td>为每一行指定唯一的标识符</td>
        </tr>
        <tr class="text-c">
            <td>cardView</td>
            <td>data-card-view</td>
            <td>Boolean</td>
            <td>false</td>
            <td>设置为 true将显示card视图，适用于移动设备。否则为table试图，适用于pc</td>
        </tr>
        <tr class="text-c">
            <td>detailView</td>
            <td>data-detail-view</td>
            <td>Boolean</td>
            <td>false</td>
            <td>设置为 true 可以显示详细页面模式。</td>
        </tr>
        <tr class="text-c">
            <td>detailFormatter</td>
            <td>data-detail-formatter</td>
            <td>Function</td>
            <td> function(index, row) {
                return ”;
                }
            </td>
            <td>格式化详细页面模式的视图。</td>
        </tr>
        <tr class="text-c">
            <td>searchAlign</td>
            <td>data-search-align</td>
            <td>String</td>
            <td>‘right’</td>
            <td>指定 搜索框 水平方向的位置。’left’ or ‘right’</td>
        </tr>
        <tr class="text-c">
            <td>buttonsAlign</td>
            <td>data-buttons-align</td>
            <td>String</td>
            <td>‘right’</td>
            <td>指定 按钮 水平方向的位置。’left’ or ‘right’</td>
        </tr>
        <tr class="text-c">
            <td>toolbarAlign</td>
            <td>data-toolbar-align</td>
            <td>String</td>
            <td>‘left’</td>
            <td>指定 toolbar 水平方向的位置。’left’ or ‘right’</td>
        </tr>
        <tr class="text-c">
            <td>paginationVAlign</td>
            <td>data-pagination-v-align</td>
            <td>String</td>
            <td>‘bottom’</td>
            <td>指定 分页条 在垂直方向的位置。’top’ or ‘bottom’ or ‘bonth’</td>
        </tr>
        <tr class="text-c">
            <td>paginationHAlign</td>
            <td>data-pagination-h-align</td>
            <td>String</td>
            <td>‘right’</td>
            <td>指定 分页条 在水平方向的位置。’left’ or ‘right’</td>
        </tr>
        <tr class="text-c">
            <td>paginationDetailHAlign</td>
            <td>data-pagination-detail-h-align</td>
            <td>String</td>
            <td>‘left’</td>
            <td>指定 分页详细信息 在水平方向的位置。’left’ or ‘right’</td>
        </tr>
        <tr class="text-c">
            <td>paginationPreText</td>
            <td>data-pagination-pre-text</td>
            <td>String</td>
            <td>‘<’</td>
            <td>指定分页条中上一页按钮的图标或文字</td>
        </tr>
        <tr class="text-c">
            <td>paginationNextText</td>
            <td>data-pagination-next-text</td>
            <td>String</td>
            <td>‘>’</td>
            <td>指定分页条中下一页按钮的图标或文字</td>
        </tr>
        <tr class="text-c">
            <td>clickToSelect</td>
            <td>data-click-to-select</td>
            <td>Boolean</td>
            <td>false</td>
            <td>设置true 将在点击行时，自动选择rediobox 和 checkbox</td>
        </tr>
        <tr class="text-c">
            <td>singleSelect</td>
            <td>data-single-select</td>
            <td>Boolean</td>
            <td>false</td>
            <td>设置True 将禁止多选</td>
        </tr>
        <tr class="text-c">
            <td>toolbar</td>
            <td>data-toolbar</td>
            <td>String</td>
            <td>undefined</td>
            <td>一个jQuery 选择器，指明自定义的toolbar 例如:
                #toolbar, .toolbar.
            </td>
        </tr>
        <tr class="text-c">
            <td>checkboxHeader</td>
            <td>data-checkbox-header</td>
            <td>Boolean</td>
            <td>true</td>
            <td>设置false 将在列头隐藏check-all checkbox .</td>
        </tr>
        <tr class="text-c">
            <td>maintainSelected</td>
            <td>data-maintain-selected</td>
            <td>Boolean</td>
            <td>false</td>
            <td>设置为 true 在点击分页按钮或搜索按钮时，将记住checkbox的选择项</td>
        </tr>
        <tr class="text-c">
            <td>sortable</td>
            <td>data-sortable</td>
            <td>Boolean</td>
            <td>true</td>
            <td>设置为false 将禁止所有列的排序</td>
        </tr>
        <tr class="text-c">
            <td>silentSort</td>
            <td>data-silent-sort</td>
            <td>Boolean</td>
            <td>true</td>
            <td>设置为 false 将在点击分页按钮时，自动记住排序项。仅在 sidePagination设置为 server时生效.</td>
        </tr>
        <tr class="text-c">
            <td>rowStyle</td>
            <td>data-row-style</td>
            <td>Function</td>
            <td>function(row,index) {
                return class;
                }
            </td>
            <td>自定义行样式 参数为：
                row: 行数据
                index: 行下标
                返回值可以为class或者css
            </td>
        </tr>
        <tr class="text-c">
            <td>rowAttributes</td>
            <td>data-row-attributes</td>
            <td>Function</td>
            <td>function(row,index) {
                return attributes;
                }
            </td>
            <td>自定义行属性 参数为：
                row: 行数据
                index: 行下标
                返回值可以为class或者css 支持所有自定义属性
            </td>
        </tr>
        <tr class="text-c">
            <td>customSearch</td>
            <td>data-custom-search</td>
            <td>Function</td>
            <td>$.noop</td>
            <td>执行自定义搜索功能而不是内置搜索功能，需要一个参数：
                text: 搜索文本
                如：
                function customSearch(text) {
                //Search logic here.
                //You must use `this.data` array in order to filter the data. NO use `this.options.data`.
                }
            </td>
        </tr>
        <tr class="text-c">
            <td>customSort</td>
            <td>data-custom-sort</td>
            <td>Function</td>
            <td>$.noop</td>
            <td> 执行自定义排序函数而不是内置排序函数，需要两个参数：
                sortName: 排序名称
                sortOrder: 排序顺序
                如:
                function customSort(sortName, sortOrder) {
                //Sort logic here.
                //You must use `this.data` array in order to sort the data. NO use `this.options.data`.
                }
            </td>
        </tr>
        </tbody>
    </table>

    <table class="table table-border table-bordered table-bg mt-20">
        <thead>
        <tr>
            <th colspan="6" scope="col">列参数</th>
        </tr>
        <tr class="text-c">
            <th>名称</th>
            <th>标签</th>
            <th>类型</th>
            <th>默认</th>
            <th>描述</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>radio</td>
            <td>data-radio</td>
            <td>Boolean</td>
            <td>false</td>
            <td>是否显示单选radio</td>
        </tr>
        <tr>
            <td>checkbox</td>
            <td>data-checkbox</td>
            <td>Boolean</td>
            <td>false</td>
            <td>是否显示多选checkbox</td>
        </tr>
        <tr>
            <td>field</td>
            <td>data-field</td>
            <td>String</td>
            <td>undefined</td>
            <td>该列映射的data的参数名</td>
        </tr>
        <tr>
            <td>title</td>
            <td>data-title</td>
            <td>String</td>
            <td>undefined</td>
            <td>该列的表头名</td>
        </tr>
        <tr>
            <td>titleTooltip</td>
            <td>data-title-tooltip</td>
            <td>String</td>
            <td>undefined</td>
            <td>该列表头的title提示文本</td>
        </tr>
        <tr>
            <td>class</td>
            <td>class / data-class</td>
            <td>String</td>
            <td>undefined</td>
            <td>该列的class</td>
        </tr>
        <tr>
            <td>rowspan</td>
            <td>rowspan / data-rowspan</td>
            <td>Number</td>
            <td>undefined</td>
            <td>合并单元格时定义合并多少行</td>
        </tr>
        <tr>
            <td>colspan</td>
            <td>colspan / data-colspan</td>
            <td>Number</td>
            <td>undefined</td>
            <td>合并单元格时定义合并多少列</td>
        </tr>
        <tr>
            <td>align</td>
            <td>data-align</td>
            <td>String</td>
            <td>undefined</td>
            <td>设置该列数据如何对齐，’left’, ‘right’, ‘center’</td>
        </tr>
        <tr>
            <td>halign</td>
            <td>data-halign</td>
            <td>String</td>
            <td>undefined</td>
            <td>table header对齐方式， ‘left’, ‘right’, ‘center’</td>
        </tr>
        <tr>
            <td>falign</td>
            <td>data-falign</td>
            <td>String</td>
            <td>undefined</td>
            <td>table footer对齐方式， ‘left’, ‘right’, ‘center’</td>
        </tr>
        <tr>
            <td>valign</td>
            <td>data-valign</td>
            <td>String</td>
            <td>undefined</td>
            <td>单元格（cell）对齐方式. ‘top’, ‘middle’, ‘bottom’</td>
        </tr>
        <tr>
            <td>width</td>
            <td>data-width</td>
            <td>Number {Pixels or Percentage}</td>
            <td>undefined</td>
            <td>列的宽度，可以使用像素或者百分比，不带单位则默认为px</td>
        </tr>
        <tr>
            <td>sortable</td>
            <td>data-sortable</td>
            <td>Boolean</td>
            <td>false</td>
            <td>该列是否排序（表头显示双箭头）</td>
        </tr>
        <tr>
            <td>order</td>
            <td>data-order</td>
            <td>String</td>
            <td>‘asc’</td>
            <td>该列默认的排序方式， ‘asc’ or ‘desc’.</td>
        </tr>
        <tr>
            <td>visible</td>
            <td>data-visible</td>
            <td>Boolean</td>
            <td>true</td>
            <td>该列是否可见</td>
        </tr>
        <tr>
            <td>cardVisible</td>
            <td>data-card-visible</td>
            <td>Boolean</td>
            <td>true</td>
            <td>在card视图里是否可见</td>
        </tr>
        <tr>
            <td>switchable</td>
            <td>data-switchable</td>
            <td>Boolean</td>
            <td>true</td>
            <td>列切换是否可见.</td>
        </tr>
        <tr>
            <td>clickToSelect</td>
            <td>data-click-to-select</td>
            <td>Boolean</td>
            <td>true</td>
            <td>是否选中checkbox或者radio，当该列被选择时</td>
        </tr>
        <tr>
            <td>formatter</td>
            <td>data-formatter</td>
            <td>Function</td>
            <td>undefined</td>
            <td>格式化单元格内容，function(value, row, index), value：该cell本来的值，row：该行数据，index：该行序号（从0开始）</td>
        </tr>
        <tr>
            <td>footerFormatter</td>
            <td>data-footer-formatter</td>
            <td>Function</td>
            <td>undefined</td>
            <td>格式化footer内容，function(rows)，rows：所有行数据</td>
        </tr>
        <tr>
            <td>events</td>
            <td>data-events</td>
            <td>Object</td>
            <td>undefined</td>
            <td>The cell 的事件监听，当你使用formatter function的时候,有三个参数: event: the jQuery event. value: 该cell的值 row: 该行的数据 index: 该行的序号</td>
        </tr>
        <tr>
            <td>sorter</td>
            <td>data-sorter</td>
            <td>Function</td>
            <td>undefined</td>
            <td>自定义字段排序函数，function(a, b)</td>
        </tr>
        <tr>
            <td>sortName</td>
            <td>data-sort-name</td>
            <td>String</td>
            <td>undefined</td>
            <td>当列中有html等标签时，只排序实际内容（忽略标签和样式），例如字段为：”abc“，则sortName=abc</td>
        </tr>
        <tr>
            <td>cellStyle</td>
            <td>data-cell-style</td>
            <td>Function</td>
            <td>undefined</td>
            <td>单元格样式，支持css和classes，function(value, row, index) value: 该cell的值 row: 该行的数据 index: 该行的序号</td>
        </tr>
        <tr>
            <td>searchable</td>
            <td>data-searchable</td>
            <td>Boolean</td>
            <td>true</td>
            <td>搜索时是否搜索此列</td>
        </tr>
        <tr>
            <td>searchFormatter</td>
            <td>data-search-formatter</td>
            <td>Boolean</td>
            <td>true</td>
            <td>搜索是否使用格式化后的数据（即显示在页面上的数据）</td>
        </tr>
        </tbody>
    </table>

    <table class="table table-border table-bordered table-bg mt-20">
        <thead>
        <tr>
            <th colspan="5" scope="col">事件</th>
        </tr>
        <tr class="text-c">
            <th>Option 事件</th>
            <th>jQuery 事件</th>
            <th>参数</th>
            <th>描述</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>onAll</td>
            <td>all.bs.table</td>
            <td>name, args</td>
            <td>所有的事件都会触发该事件，参数包括：
                name：事件名，
                args：事件的参数。</td>
        </tr>
        <tr>
            <td>onClickRow</td>
            <td>click-row.bs.table</td>
            <td>row, $element</td>
            <td>当用户点击某一行的时候触发，参数包括：
                row：点击行的数据，
                $element：tr 元素，
                field：点击列的 field 名称。</td>
        </tr>
        <tr>
            <td>onDblClickRow</td>
            <td>dbl-click-row.bs.table</td>
            <td>row, $element</td>
            <td>当用户双击某一行的时候触发，参数包括：
                row：点击行的数据，
                $element：tr 元素，
                field：点击列的 field 名称。</td>
        </tr>
        <tr>
            <td>onClickCell</td>
            <td>click-cell.bs.table</td>
            <td>field, value, row, $element</td>
            <td>当用户点击某一列的时候触发，参数包括：
                field：点击列的 field 名称，
                value：点击列的 value 值，
                row：点击列的整行数据，
                $element：td 元素。</td>
        </tr>
        <tr>
            <td>onDblClickCell</td>
            <td>dbl-click-cell.bs.table</td>
            <td>field, value, row, $element</td>
            <td>当用户双击某一列的时候触发，参数包括：
                field：点击列的 field 名称，
                value：点击列的 value 值，
                row：点击列的整行数据，
                $element：td 元素。</td>
        </tr>
        <tr>
            <td>onSort</td>
            <td>sort.bs.table</td>
            <td>name, order</td>
            <td>当用户对列进行排序时触发，参数包含：
                name: 排序列字段名
                order: 排序列的顺序</td>
        </tr>
        <tr>
            <td>onCheck</td>
            <td>check.bs.table</td>
            <td>row</td>
            <td>当用户检查行时触发，参数包含：
                row: 与单击的行对应的记录. $element: 选中DOM元素.</td>
        </tr>
        <tr>
            <td>onUncheck</td>
            <td>uncheck.bs.table</td>
            <td>row</td>
            <td>在用户取消选中行时触发，参数包含：
                row: 与单击的行对应的记录. $element: 取消选中DOM元素.</td>
        </tr>
        <tr>
            <td>onCheckAll</td>
            <td>check-all.bs.table</td>
            <td>rows</td>
            <td>当用户检查所有行时触发，参数包含：
                rows: 与新检查的行对应的记录数组</td>
        </tr>
        <tr>
            <td>onUncheckAll</td>
            <td>uncheck-all.bs.table</td>
            <td>rows</td>
            <td>当用户取消选中所有行时触发，参数包含：
                rows:与先前检查的行对应的记录数组</td>
        </tr>
        <tr>
            <td>onCheckSome</td>
            <td>check-some.bs.table</td>
            <td>rows</td>
            <td>当用户检查某些行时触发，参数包含：
                rows: 与先前检查的行对应的记录数组.</td>
        </tr>
        <tr>
            <td>onUncheckSome</td>
            <td>uncheck-some.bs.table</td>
            <td>rows</td>
            <td>当用户取消选中某些行时触发，参数包含：
                rows: 与先前检查的行对应的记录数组.</td>
        </tr>
        <tr>
            <td>onLoadSuccess</td>
            <td>load-success.bs.table</td>
            <td>data</td>
            <td>在成功加载远程数据时触发</td>
        </tr>
        <tr>
            <td>onLoadError</td>
            <td>load-error.bs.table</td>
            <td>status</td>
            <td>在加载远程数据时发生某些错误时触发.</td>
        </tr>
        <tr>
            <td>onColumnSwitch</td>
            <td>column-switch.bs.table</td>
            <td>field, checked</td>
            <td>切换列可见时触发.</td>
        </tr>
        <tr>
            <td>onColumnSearch</td>
            <td>column-search.bs.table</td>
            <td>field, text</td>
            <td>在按列搜索时触发</td>
        </tr>
        <tr>
            <td>onPageChange</td>
            <td>page-change.bs.table</td>
            <td>number, size</td>
            <td>更改页码或页面大小时触发.</td>
        </tr>
        <tr>
            <td>onSearch</td>
            <td>search.bs.table</td>
            <td>text</td>
            <td>在搜索表时触发.</td>
        </tr>
        <tr>
            <td>onToggle</td>
            <td>toggle.bs.table</td>
            <td>cardView</td>
            <td>切换表视图时触发.</td>
        </tr>
        <tr>
            <td>onPreBody</td>
            <td>pre-body.bs.table</td>
            <td>data</td>
            <td>在呈现表体之前触发</td>
        </tr>
        <tr>
            <td>onPostBody</td>
            <td>post-body.bs.table</td>
            <td>none</td>
            <td>在表体表示并在DOM中可用之后触发</td>
        </tr>
        <tr>
            <td>onPostHeader</td>
            <td>post-header.bs.table</td>
            <td>none</td>
            <td>在表头之后触发，并在DOM中可用</td>
        </tr>
        <tr>
            <td>onExpandRow</td>
            <td>expand-row.bs.table</td>
            <td>index, row, $detail</td>
            <td>当点击详细图标展开详细页面的时候触发。</td>
        </tr>
        <tr>
            <td>onCollapseRow</td>
            <td>collapse-row.bs.table</td>
            <td>index, row</td>
            <td>当点击详细图片收起详细页面的时候触发。</td>
        </tr>
        <tr>
            <td>onRefreshOptions</td>
            <td>refresh-options.bs.table</td>
            <td>options</td>
            <td>在刷新选项之后和在销毁和初始化表之前触发.</td>
        </tr>
        <tr>
            <td>onRefresh</td>
            <td>refresh.bs.table</td>
            <td>params</td>
            <td>单击刷新按钮后触发.</td>
        </tr>
        </tbody>
    </table>

    <table class="table table-border table-bordered table-bg mt-20">
        <thead>
        <tr>
            <th colspan="4" scope="col">方法</th>
        </tr>
        <tr class="text-c">
            <th>名称</th>
            <th>参数</th>
            <th>描述</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>getOptions</td>
            <td>none</td>
            <td>返回表格的 Options。</td>
        </tr>
        <tr>
            <td>getSelections</td>
            <td>none</td>
            <td>返回所选的行，当没有选择任何行的时候返回一个空数组。</td>
        </tr>
        <tr>
            <td>getAllSelections</td>
            <td>none</td>
            <td>返回所有选择的行，包括搜索过滤前的，当没有选择任何行的时候返回一个空数组。</td>
        </tr>
        <tr>
            <td>getData</td>
            <td>useCurrentPage</td>
            <td>或者当前加载的数据。假如设置 useCurrentPage 为 true，则返回当前页的数据。</td>
        </tr>
        <tr>
            <td>getRowByUniqueId</td>
            <td>id</td>
            <td>根据 uniqueId 获取行数据。</td>
        </tr>
        <tr>
            <td>load</td>
            <td>data</td>
            <td>加载数据到表格中，旧数据会被替换。</td>
        </tr>
        <tr>
            <td>showAllColumns</td>
            <td>none</td>
            <td>显示所有列.</td>
        </tr>
        <tr>
            <td>hideAllColumns</td>
            <td>none</td>
            <td>隐藏所有列.</td>
        </tr>
        <tr>
            <td>append</td>
            <td>data</td>
            <td>添加数据到表格在现有数据之后。</td>
        </tr>
        <tr>
            <td>prepend</td>
            <td>data</td>
            <td>插入数据到表格在现有数据之前。</td>
        </tr>
        <tr>
            <td>remove</td>
            <td>params</td>
            <td>从表格中删除数据，包括两个参数： field: 需要删除的行的 field 名称。
                values: 需要删除的行的值，类型为数组。</td>
        </tr>
        <tr>
            <td>removeAll</td>
            <td>-</td>
            <td>删除表格所有数据。</td>
        </tr>
        <tr>
            <td>removeByUniqueId</td>
            <td>id</td>
            <td>根据 uniqueId 删除指定的行。</td>
        </tr>
        <tr>
            <td>insertRow</td>
            <td>params</td>
            <td>插入新行，参数包括：
                index: 要插入的行的 index。
                row: 行的数据，Object 对象。</td>
        </tr>
        <tr>
            <td>updateRow</td>
            <td>params</td>
            <td>更新指定的行，参数包括：
                index: 要更新的行的 index。
                row: 行的数据，Object 对象。</td>
        </tr>
        <tr>
            <td>showRow</td>
            <td>params</td>
            <td>显示指定的行，参数包括：
                index: 要更新的行的 index 或者 uniqueId。
                isIdField: 指定 index 是否为 uniqueid。</td>
        </tr>
        <tr>
            <td>hideRow</td>
            <td>params</td>
            <td>显示指定的行，参数包括：
                index: 要更新的行的 index。
                uniqueId: 或者要更新的行的 uniqueid。</td>
        </tr>
        <tr>
            <td>getRowsHidden</td>
            <td>show</td>
            <td>获取所有行隐藏，如果show参数为true，行将再次显示，否则，方法 只返回隐藏的行.</td>
        </tr>
        <tr>
            <td>mergeCells</td>
            <td>options</td>
            <td>将某些单元格合并到一个单元格，选项包含以下属性：
                index：行索引
                field：字段名称
                rowspan：要合并的rowspan数量
                colspan：要合并的colspan数量</td>
        </tr>
        <tr>
            <td>updateCell</td>
            <td>params</td>
            <td>更新一个单元格，params包含以下属性：
                index：行索引
                field：字段名称
                value：新字段值</td>
        </tr>
        <tr>
            <td>refresh</td>
            <td>params</td>
            <td>刷新远程服务器数据，可以设置 {silent：true} 以静默方式刷新数据，并设置 {url：newUrl} 更改URL。 要提供特定于此请求的查询参数，请设置 {query：{foo：’bar’}}</td>
        </tr>
        <tr>
            <td>refreshOptions</td>
            <td>options</td>
            <td>刷新选项</td>
        </tr>
        <tr>
            <td>resetSearch</td>
            <td>text</td>
            <td>设置搜索文本</td>
        </tr>
        <tr>
            <td>showLoading</td>
            <td>none</td>
            <td>显示加载状态.</td>
        </tr>
        <tr>
            <td>hideLoading</td>
            <td>none</td>
            <td>隐藏加载状态</td>
        </tr>
        <tr>
            <td>checkAll</td>
            <td>none</td>
            <td>检查所有当前页面行.</td>
        </tr>
        <tr>
            <td>check</td>
            <td>index</td>
            <td>检查一行，行索引从0开始.</td>
        </tr>
        <tr>
            <td>uncheck</td>
            <td>index</td>
            <td>取消选中一行，行索引从0开始.</td>
        </tr>
        <tr>
            <td>checkBy</td>
            <td>params</td>
            <td>按值数组检查一行，参数包含：
                field：用于查找记录的字段的名称
                values：要检查的行的值数组
                例:
                $(“#table”).bootstrapTable(“checkBy”, {field:”field_name”, values:[“value1”,”value2”,”value3”]})</td>
        </tr>
        <tr>
            <td>uncheckBy</td>
            <td>params</td>
            <td>按值数组取消选中一行，参数包含：
                field：用于查找记录的字段的名称
                values：要取消选中的行的值的数组
                例:
                $(“#table”).bootstrapTable(“uncheckBy”, {field:”field_name”, values:[“value1”,”value2”,”value3”]})</td>
        </tr>
        <tr>
            <td>resetView</td>
            <td>params</td>
            <td>重置引导表视图，例如重置表高度.</td>
        </tr>
        <tr>
            <td>resetWidth</td>
            <td>none</td>
            <td>调整页眉和页脚的大小以适合当前列宽度</td>
        </tr>
        <tr>
            <td>destroy</td>
            <td>none</td>
            <td>销毁引导表.</td>
        </tr>
        <tr>
            <td>showColumn</td>
            <td>field</td>
            <td>显示指定的列.</td>
        </tr>
        <tr>
            <td>hideColumn</td>
            <td>field</td>
            <td>隐藏指定的列.</td>
        </tr>
        <tr>
            <td>getHiddenColumns</td>
            <td>-</td>
            <td>获取隐藏的列。</td>
        </tr>
        <tr>
            <td>getVisibleColumns</td>
            <td>-</td>
            <td>获取可见列。</td>
        </tr>
        <tr>
            <td>scrollTo</td>
            <td>value</td>
            <td>滚动到指定位置，单位为 px，设置 ‘bottom’ 表示跳到最后。</td>
        </tr>
        <tr>
            <td>getScrollPosition</td>
            <td>none</td>
            <td>获取当前滚动条的位置，单位为 px。</td>
        </tr>
        <tr>
            <td>filterBy</td>
            <td>params</td>
            <td>（只能用于 client 端）过滤表格数据， 你可以通过过滤{age: 10}来显示 age 等于 10 的数据。</td>
        </tr>
        <tr>
            <td>selectPage</td>
            <td>page</td>
            <td>跳到指定的页。</td>
        </tr>
        <tr>
            <td>prevPage</td>
            <td>none</td>
            <td>跳到上一页。</td>
        </tr>
        <tr>
            <td>nextPage</td>
            <td>none</td>
            <td>跳到下一页。</td>
        </tr>
        <tr>
            <td>togglePagination</td>
            <td>none</td>
            <td>切换分页选项。</td>
        </tr>
        <tr>
            <td>toggleView</td>
            <td>none</td>
            <td>切换 card/table 视图</td>
        </tr>
        <tr>
            <td>expandRow</td>
            <td>index</td>
            <td>如果详细视图选项设置为True，请展开具有通过参数传递的索引的行.</td>
        </tr>
        <tr>
            <td>collapseRow</td>
            <td>index</td>
            <td>如果详细视图选项设置为True，则折叠具有通过参数传递的索引的行.</td>
        </tr>
        <tr>
            <td>expandAllRows</td>
            <td>is subtable</td>
            <td>如果详细视图选项设置为True，请展开所有行.</td>
        </tr>
        <tr>
            <td>collapseAllRows</td>
            <td>is subtable</td>
            <td>如果详细信息视图选项设置为True，则折叠所有行.</td>
        </tr>
        </tbody>
    </table>
</div>
<script type="text/javascript" src="assets/home/js/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="assets/home/js/H-ui.js"></script>
</body>
</html>