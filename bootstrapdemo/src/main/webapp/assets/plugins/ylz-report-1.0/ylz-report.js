function Report(sid, params) {
	this.sid = sid;
	this.pages = 0;
	this.cpage = 0;
	this.reportContent = new Array();
	this.params = params;
	this.url = {
		previewHTML : Core.getBasePath() + 'service/' + sid + '/reportVHtml.shtml',
		previewPDF : Core.getBasePath() + 'service/' + sid + '/reportVPdf.shtml',
		downloadPDF : Core.getBasePath() + 'service/' + sid + '/reportDPdf.shtml'
	}
}
Report.prototype.getReportObject = function(data) {
	this.cpage = 0;
	this.pages = 0;
	this.reportContent = new Array();
	var tempIndex = 0;
	var index = data.indexOf('<a name="JR_PAGE_ANCHOR');
	while (index != -1) {
		this.pages++;
		tempIndex = index;
		index = data.substring(tempIndex + 23).indexOf('<a name="JR_PAGE_ANCHOR');
		if (index != -1) {
			index = index + tempIndex + 23;
			var centerStr = data.substring(tempIndex, index);
			var centerIndex = centerStr.lastIndexOf("</table>");
			this.reportContent[this.pages - 1] = centerStr.substring(0, centerIndex + 8);
		} else {
			var footStr = data.substring(tempIndex);
			var footIndex = footStr.indexOf("</table>");
			this.reportContent[this.pages - 1] = footStr.substring(0, footIndex + 8);
		}
	}
}
Report.prototype.buildPreviewDom = function() {
	var content = '<div><div class="report"><div class="report-op"><span class="current-page">0</span>';
	if (getUserAgent() == "Chrome") {
		content += '<button type="buttton" class="btn btn-sm btn-default r-print"><img src="' + Core.getBasePath() + 'assets/plugins/ylz-report-1.0/img/print.png">打印</button>';
	}
	content += '<button type="buttton" class="btn btn-sm btn-default r-output"><img src="' + Core.getBasePath() + 'assets/plugins/ylz-report-1.0/img/pdf.png">导出</button>'
			+ '<button type="buttton" class="btn btn-sm btn-default r-prev"><img src="' + Core.getBasePath() + 'assets/plugins/ylz-report-1.0/img/prev.png">上一页</button>'
			+ '<button type="buttton" class="btn btn-sm btn-default r-next"><img src="' + Core.getBasePath() + 'assets/plugins/ylz-report-1.0/img/next.png">下一页</button>'
			+ '<button type="buttton" class="btn btn-sm btn-default r-zoomin"><img src="' + Core.getBasePath() + 'assets/plugins/ylz-report-1.0/img/zoomin.png">放大</button>'
			+ '<button type="buttton" class="btn btn-sm btn-default r-zoomout" disabled><img src="' + Core.getBasePath() + 'assets/plugins/ylz-report-1.0/img/zoomout.png">缩小</button>'
			+ '</div><div class="report-content"></div></div></div>';
	var that = this;
	layer.open({
		type : 1,
		title : '预览报表',
		shadeClose : true,
		shade : false,
		area : [ '100%', '100%' ],
		content : content,
		success : function(layero) {
			that.layer = layero;
			that.contentContainer = layero.find('.report-content');
			that.pagerContainer = layero.find('.current-page')
			that.btnPrint = layero.find('.r-print');
			layero.find('.r-print').on("click", function() {
				that.previewPDF();
			});
			that.btnPrev = layero.find('.r-output');
			layero.find('.r-output').on("click", function() {
				that.downloadPDF();
			});
			that.btnPrev = layero.find('.r-prev');
			layero.find('.r-prev').on("click", function() {
				that.pageUp();
			});
			that.btnNext = layero.find('.r-next');
			layero.find('.r-next').on("click", function() {
				that.pageDown();
			});
			that.btnZoomIn = layero.find('.r-zoomin');
			that.btnZoomIn.on("click", function() {
				that.pageZoom(2);
			});
			that.btnZoomOut = layero.find('.r-zoomout');
			that.btnZoomOut.on("click", function() {
				that.pageZoom(1);
			});
		}
	});
}
Report.prototype.preview = function() {
	this.buildPreviewDom();

	var that = this;
	$.get(this.url.previewHTML, this.params, function(data) {
		that.getReportObject(data);
		that.pageDown();
	});
}
Report.prototype.previewPDF = function() {
	var url = this.url.previewPDF + '?' + encodeURIComponent($.param(this.params));
	window.open(url);
};
Report.prototype.downloadPDF = function() {
	var url = this.url.downloadPDF + '?' + encodeURIComponent($.param(this.params));
	window.open(url);
};
Report.prototype.pageUp = function() {
	if (this.cpage > 1) {
		this.btnNext.removeAttr("disabled");
		this.contentContainer.html(this.reportContent[--this.cpage - 1]);
	}
	if (this.cpage == 1) {
		this.btnPrev.attr({
			"disabled" : "disabled"
		});
	}
	this.pagerContainer.text(this.cpage + '/' + this.pages);
};
Report.prototype.pageDown = function() {
	if (this.cpage < this.pages) {
		this.btnPrev.removeAttr("disabled");
		this.contentContainer.html(this.reportContent[++this.cpage - 1]);
	}
	if (this.cpage == this.pages) {
		this.btnNext.attr({
			"disabled" : "disabled"
		});
	}
	this.pagerContainer.text(this.cpage + '/' + this.pages);
};
Report.prototype.pageZoom = function(zoomNum) {
	var userAgent = getUserAgent();
	var obj = this.contentContainer.get(0);
	if (userAgent == "Firefox") {
		var heightVal;
		var widthVal;
		var mozTrans = "scale(" + zoomNum + "," + zoomNum + ")";
		var mozTransTop;
		var mozTransLeft;
		this.btnZoomOut.removeAttr("disabled");
		if (!zoomInFlag && zoomNum == 2) {
			heightVal = obj.scrollHeight;
			widthVal = obj.scrollWidth;
			obj.getElementsByTagName("table")[0].style.MozTransform = mozTrans;
			mozTransTop = (heightVal * 2 - obj.scrollHeight) / 2;
			mozTransLeft = (obj.scrollWidth - widthVal) / 2;
			obj.getElementsByTagName("table")[0].style.MozTransform = mozTrans + " translate(" + mozTransLeft + "px," + mozTransTop + "px)";
			obj.scrollLeft = obj.scrollWidth / 4;
			zoomInFlag = true;
		} else if (zoomInFlag && zoomNum == 1) {
			obj.getElementsByTagName("table")[0].style.MozTransform = mozTrans;
			zoomInFlag = false;
		}
		return;
	} else if ((userAgent.indexOf("IE") != -1 || userAgent == "Chrome") && userAgent != "IE8.0") {
		obj.style.zoom = zoomNum;
		if (zoomNum == 2) {
			this.btnZoomOut.removeAttr("disabled");
			this.btnZoomIn.attr({
				"disabled" : "disabled"
			});
		} else if (zoomNum == 1) {
			this.btnZoomIn.removeAttr("disabled");
			this.btnZoomOut.attr({
				"disabled" : "disabled"
			});
		}
		return;
	} else {
		this.btnZoomOut.removeAttr("disabled");
		if (zoomNum == 2) {
			zoomIn2X(this.contentContainer, this.reportContent[this.cpage - 1]);
		} else if (zoomNum == 1) {
			this.contentContainer.html(this.reportContent[this.cpage - 1]);
		}
	}
}
function getUserAgent() {
	if (navigator.userAgent.indexOf("IE") > 0) {
		var version = navigator.appVersion.split(";");
		var result = version[1].replace(/[ ]/g, "").substr(2);
		return result;
	}
	if (isFirefox = navigator.userAgent.indexOf("Firefox") > 0) {
		return "Firefox";
	}
	if (isSafari = navigator.userAgent.indexOf("Chrome") > 0) {
		return "Chrome";
	}
	return "other";
}
function zoomIn2X(container, content) {
	var result = content.replace(/font\-size.*px/gi, "");
	result = result.replace(/1px/gi, "2px");
	container.html(result);
	var $table = container.find('table:eq(0)');
	$table.width($table.width() * 2);
	$table.css('fontSize', '24px');
}