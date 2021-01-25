(function ($, window) {
    'use strict';
    /**
     * 页面的所有jq对象
     * @type {{count: number}}
     */
    var pageObj = {
        $auxiliaryPart: null,
        $caterialPart: null
    };

    /**
     * 辅助项材料
     * @param options 入参
     * @returns {AuxiliaryPart}
     * @constructor
     */
    function AuxiliaryPart(options) {
        this.data = options.data;
        this.render = _auxiliaryPartRender;
        this.render();
        pageObj.$auxiliaryPart = this;
        return this;
    }

    /**
     * 附件材料列表
     * @param options 入参
     * @returns {MaterialPart}
     * @constructor
     */
    function _auxiliaryPartRender() {
        if ($.isEmptyObject(this.data)) {
            this.data = [];
        }
        var cols = [{
            field: 'material_name',
            title: '材料名称',
            align: 'center',
            width: '30%'
        }, {
            field: 'is_need',
            title: '是否必要',
            align: 'center',
            width: '10%',
            formatter: function (value) {
                var data = "";
                switch (value) {
                    case "1":
                        data = "是";
                        break;
                    case "0":
                        data = "否";
                        break;
                }
                return data;
            }
        }, {
            field: 'status',
            align: 'center',
            title: '上传情况',
            width: '10%',
            events: materialOperateEvents,
            formatter: function _materialTableFormatter(value, row, index) {
                if (value == undefined || value == null) {
                    return "暂无文件上传";
                } else {
                    return value;
                }
            }
        }, {
            field: 'operate',
            align: 'center',
            title: '操作',
            width: '20%',
            events: materialOperateEvents,
            formatter: _materialTableFormatter
        }];
        _commonTableGenerator(this, 'auxiliaryTable', cols);
    }

    /**
     * 通用的表格生成器
     * @param $targetTable 目标表格
     * @param type 当前渲染目标对象[auxiliaryTable,materialTable]
     * @param cols 目标列
     * @private
     */
    function _commonTableGenerator($targetTable, type, cols) {
        var baseOptions = {
            pageList: [3, 5, 10, 15],
            pageSize: 5,
            data: $targetTable.data,
            clickToSelect: true,
            columns: cols
        };
        baseOptions.onCheck = function (row) {
            _commonRowAddGenerator(new Array(row));
            return true;
        };
        baseOptions.onCheckAll = function (rows) {
            //须要清除旧的选中状态
            _commonRowRemoveGenerator(rows);
            _commonRowAddGenerator(rows);
            return true;
        };
        baseOptions.onUncheck = function (row) {
            //处理辅助项取消事件
            _commonRowRemoveGenerator(new Array(row));
            return true;
        };
        baseOptions.onUncheckAll = function (rows) {
            _commonRowRemoveGenerator(rows);
            return true;
        };
        $targetTable.bootstrapTable('destroy');
        $targetTable.bootstrapTable(baseOptions);
    }


    /**
     * 表格移除材料的方法
     * @param deletedRows 需要移出的材料对象
     * @private
     */
    function _commonRowRemoveGenerator(deletedRows) {
        var ids = new Array();
        $.each(deletedRows, function (index, row) {
            var auxiliaryItem = row.auxiliaryItemMaterial;
            if (auxiliaryItem.length > 0) {
                $.each(auxiliaryItem, function (index, item) {
                    ids.push(item.material_code);
                });
            }
        });
        pageObj.$materialPart.bootstrapTable('remove', {field: 'base_guid', values: ids});
    }

    /**
     * 表格添加材料方法
     * @param addRows 需要添加的材料对象
     * @private
     */
    function _commonRowAddGenerator(addRows) {
        var allAuxiliaryItem = new Array();
        $.each(addRows, function (index, row) {
            var auxiliaryItem = row.auxiliaryItemMaterial;
            if (auxiliaryItem.length > 0) {
                allAuxiliaryItem = allAuxiliaryItem.concat(auxiliaryItem);
            }
        });
        //修改属性
        $.each(allAuxiliaryItem, function (index, item) {
            item.clname = item.name;
        });
        if (allAuxiliaryItem.length > 0) {
            pageObj.$materialPart.bootstrapTable('append', allAuxiliaryItem);
        }
    }

    /**
     *  材料表格操作formatter
     * @param value
     * @param row
     * @param index
     * @returns {string}
     * @private
     */
    function _materialTableFormatter(value, row, index) {
        return [
            '<a class="materialUpload" href="javascript:void(0)" title="材料上传">',
            '<i class="glyphicon glyphicon-cloud-upload">材料上传</i>',
            '</a>',
            '<a class="materialPreview" href="javascript:void(0)" title="材料预览" >',
            '<i class="glyphicon glyphicon-eye-open" style="margin-left: 10px;">材料预览</i>',
            '</a>',
            '<a class="caMaterialDelete" href="javascript:void(0)"  title="材料删除">',
            '<i  class="glyphicon glyphicon-trash"  style="margin-left: 10px;">材料删除</i>',
            '</a>',
            // '<a class="materialPrint" href="javascript:void(0)"  title="材料打印">',
            // '<i  class="glyphicon glyphicon-print"  style="margin-left: 10px;">材料打印</i>',
            // '</a>'
        ].join('');
    }

    // 3）操作工具类
    // ======================
    window.ywslptUtil = {
        /**
         * 已上传文件，元素结构：
         *      [
         *          {base_guid: null,fileid: null},
         *          {base_guid: null,fileid: null},
         *      ]
         */
        uploadedFiles: [],
        /**
         * 当前用户上传材料对象
         */
        selectedRow: null,
        /**
         * 设置选中记录
         * @param row
         */
        setSelectedRow: function (row) {
            this.selectedRow = row;
        },
        /**
         * 获取选中记录
         * @returns {*}
         */
        getSelectedRow: function () {
            return this.selectedRow;
        },
        sessionStore: function (key, workflowInfo) {
            sessionStorage.setItem(key, JSON.stringify(workflowInfo));
        },
        sessionGet: function (key) {
            return JSON.parse(sessionStorage.getItem(key));
        },
        /**
         * 设置上传文件信息
         * @param uploadFiles
         */
        addUploadFile: function (file) {
            var selected = ywslptUtil.getSelectedRow();//材料编号
            var obj = new Object();
            obj.base_guid = selected.base_guid;
            obj.is_need = selected.is_need;
            obj.fileId = file;
            obj.material_name = selected.material_name;
            obj.material_type = selected.material_type;
            this.uploadedFiles.push(obj);
        },
        /**
         * 获取已上传文件
         * @returns
         */
        getUploadedFiles: function (base_guid) {
            var resultFiles;
            if (base_guid == null) {
                resultFiles = this.uploadedFiles;
            } else {
                resultFiles = new Array();
                $.each(this.uploadedFiles, function (index, item) {
                    if (base_guid == item.base_guid) {
                        resultFiles.push(item);
                    }
                });
            }
            return resultFiles;
        },
        /**
         * 清除材料上传状态
         * @param base_guid 材料编号
         */
        removeUploadFiles: function (fileId) {
            var uploadFiles = this.getUploadedFiles(null);
            var returnFlag = false;
            $.each(uploadFiles, function (index, item) {
                if (fileId == item.fileId) {
                    uploadFiles.splice(index, 1);
                    returnFlag = true;
                    return false;
                }
            });
            return returnFlag;
        },
        /**
         * 重置状态
         */
        reset: function () {
            this.uploadedFiles = [];
            this.selectedRow = null;
        },
        /**
         * 预览当前已成功上传的文件对象
         * @param row
         */
        preview: function (row) {
            var galleyContainer = document.createElement("div");
            galleyContainer.id = "galley";
            var ul = document.createElement("ul");
            var previewFiles = this.getUploadedFiles(row.material_code);
            if (previewFiles.length == 0) {
                layer.msg("暂无上传文件信息");
            } else {
                $.each(previewFiles, function (index, item) {
                    var li = document.createElement("li");
                    var image = new Image();
                    image.src = Core.getBasePath() + 'bootstrap/downloadFile.shtml?fileId=' + item.fileId;
                    li.appendChild(image);
                    ul.appendChild(li);
                });
                galleyContainer.appendChild(ul);
                var viewer = new Viewer(galleyContainer, {
                    hidden: function () {
                        viewer.destroy();
                    }
                });
                viewer.view();
            }
        },
        printView: function(row) {
            var printViewFiles = this.getUploadedFiles(row.material_code);
            // if (printViewFiles.length == 0) {
            //     layer.msg("暂无打印文件");
            // } else {
            //     $.each(printViewFiles, function (index, item) {
            //         var fileId = item.fileId;
                    $.ajax({
                        url: 'bootstrap/printFile.json',
                        type: 'POST',
                        data: {
                            // fileId: fileId
                        },
                        success: function (response) {
                            if (response.flag) {
                                var pdfData = {
                                    pdfObject : response.pdfObject,
                                    pdfName : response.fileName
                                };
                                virtualFormSubmit('bootstrap/printPdf.shtml?fileId=' + "b6a41664aee741188ffac6baf9e5b754", pdfData, '_blank');
                            }
                        }
                    });
                // });
            // }
        },
        /**
         * 重置UI组件，解决部分浏览器无法正常显示easyui下拉框问题
         */
        resizeUI: function () {
            setTimeout(function () {
                $(window).resize();
            }, 100);
        }
    };
    window.ywslptUtil.reset();


    // 4）方法暴露
    $.fn.AuxiliaryPart = AuxiliaryPart;

    /**
     * 用户已经成功上传的材料
     * @type {*[]}
     */
    window.materialOperateEvents = {
        'click .materialUpload': function (e, value, row, index) {
            ywslptUtil.setSelectedRow(row);
            //动态生成图片上传插件
            $('#uploadModel').modal('show');
        },
        'click .materialPreview': function (e, value, row, index) {
            ywslptUtil.preview(row);
        },
        'click .caMaterialDelete': function (e, value, row, index) {
            var base_guid = row.base_guid;
            var uploadedFiles = ywslptUtil.getUploadedFiles(base_guid);
            var fileId = uploadedFiles[0].fileId;
            if (uploadedFiles.length == 0) {
                layer.msg("已暂无文件上传信息");
            } else {
                console.log(ywslptUtil.removeUploadFiles(base_guid));
                if (ywslptUtil.removeUploadFiles(fileId)) {
                    var uploadedFiles = ywslptUtil.getUploadedFiles(base_guid);
                    if (uploadedFiles.length == 0) {
                        row.status = "暂无文件上传";
                    } else {
                        row.status = "已上传" + uploadedFiles.length + "个文件";
                    }
                    row.acceptedId = "";
                    $('#auxiliaryTable').bootstrapTable('updateByUniqueId', {base_guid: base_guid, row: row});
                }
            }
        },
        'click .materialPrint': function (e, velue, row, index) {
            ywslptUtil.printView(row);
        }
    }

})(jQuery, window);
