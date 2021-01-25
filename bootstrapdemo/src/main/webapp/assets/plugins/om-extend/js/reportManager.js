(function($) {
	var reportSize = 0;// report容量
	var reportContent = new Array();
	var pageIndex = 0;// 页面的索引
	var webPath = "";
	var _doc;
	var zoomInFlag = false;
	var ie8Flag = false;
	$.reportConfig = {};

	$.reportManager = {// 对外开放接口
		buttonBind : function(subBtn) {// 用来绑按钮
			$(subBtn).bind("click", function() {
				initReport();
			});
		},
		buildReport : function() {
			initReport();
		},
		config : function(options) {
			config = {
				params : {},
				initFlag : false,
				onClose : function() {
				}
			};
			$.reportConfig = $.extend(config, options || {});
			webPath = getReportWebPath();

			_doc = getDocument();
			if ($.reportConfig.initFlag) {
				initReport();
			}
		}
	};

	function initReport() {
		buildReport();
	}

	function buildReport() {
		reportSize = 0;
		reportContent = new Array();
		pageIndex = 0;
		zoomInFlag = false;
		ie8Flag = false;
		$("body").append('<div id="dialog-modal" ><div id="buttonbar"></div><div id="panel" ></div></div>');
		$("#dialog-modal").omDialog({
			width : $(window).width() - 5,
			height : $(window).height() - 5,
			title : "报表浏览",
			modal : true
		});
		$('#buttonbar').omButtonbar({
			width : '100%',
			btns : [ {
				label : "打印报表",
				id : "printBtn",
				icons : {
					left : webPath + '/assets/plugins/om-extend/js/images/printer.png'
				},
				onClick : function() {
					window.open(webPath + '/service/' + $.reportConfig.serviceId + '/reportVPdf.shtml?' + encodeURIComponent($.param($.reportConfig.params)));
				}
			}, {
				label : "导出pdf",
				id : "exportBtn",
				icons : {
					left : webPath + '/assets/plugins/om-extend/js/images/print_pdf.png'
				},
				onClick : function() {
					window.open(webPath + '/service/' + $.reportConfig.serviceId + '/reportDPdf.shtml?' + encodeURIComponent($.param($.reportConfig.params)));
				}
			}, {
				label : "上一页",
				id : "previousBtn",
				icons : {
					left : webPath + '/assets/plugins/om-extend/js/images/print_previous.png'
				},
				onClick : function() {
					btnPrevious();
				}
			}, {
				label : "下一页",
				id : "nextBtn",
				icons : {
					left : webPath + '/assets/plugins/om-extend/js/images/print_next.png'
				},
				onClick : function() {
					btnNext();
				}
			}, {
				label : "放大",
				id : "zoominBtn",
				icons : {
					left : webPath + '/assets/plugins/om-extend/js/images/print_zoom_in.png'
				},
				onClick : function() {
					Zoom(2);
				}
			}, {
				label : "缩小",
				id : "zoomoutBtn",
				icons : {
					left : webPath + '/assets/plugins/om-extend/js/images/print_zoom_out.png'
				},
				onClick : function() {
					Zoom(1);
				}
			}, ]
		});
		$("#buttonbar").find("button").each(function() {
			enabled(this, 'disable');
		});// 加载数据前设置工具条不可用
		$("#panel").omPanel({
			width : '100%',
			height : '100%',
			header : false,
			preProcess : function(data, textStatus) {

				var tempData = data.replace(/jquery/ig, "<span>$&</span>");
				var index = tempData.indexOf('<a name="JR_PAGE_ANCHOR');
				var tempIndex = 0;
				while (index != -1) {
					reportSize++;
					tempIndex = index;// 363

					index = tempData.substring(tempIndex + 23).indexOf('<a name="JR_PAGE_ANCHOR');

					if (index != -1) {
						index = index + tempIndex + 23;
						var centerStr = tempData.substring(tempIndex, index);

						var centerIndex = centerStr.lastIndexOf("</table>");
						reportContent[reportSize - 1] = centerStr.substring(0, centerIndex + 8);
					} else {
						var footStr = tempData.substring(tempIndex);
						var footIndex = footStr.indexOf("</table>");

						reportContent[reportSize - 1] = footStr.substring(0, footIndex + 8);
					}
				}
				if (reportSize > 0) {
					$("#buttonbar").find("button").each(function() {
						enabled(this, 'enable');
					});
					enabled("#previousBtn", 'disable');
					if (reportSize == 1) {
						enabled("#nextBtn", 'disable');
					}
					return loadFresh(reportContent[pageIndex]);
				} else {
					return loadFresh("找不到相关数据！");
				}

			},
			url : webPath + '/service/' + $.reportConfig.serviceId + '/reportVHtml.shtml?' + encodeURIComponent($.param($.reportConfig.params)),

			loadingMessage : "default",
			onError : function(xmlHttpRequest, textStatus, errorThrown) {
				$(this).html("加载数据失败，请稍后重试。");
			}
		});
		$("#dialog-modal").omDialog({
			onClose : function(event) {
				$("div").remove("#dialog-modal");
				$.reportConfig.onClose();
			}
		});
	}

	function enabled(caller, flag) {
		$(caller).omButton(flag);
	}

	function StringBuffer(str) {
		var sb = [];
		str = str || "";
		sb.push(str);
		this.append = function(para) {
			sb.push(para);
			return this;
		};
		this.clear = function() {
			sb.splice(0, sb.length);
			return this;
		};
		this.toString = function() {
			return sb.join("");
		};
	}
	function getVParams(varibales, params) {
		var pars = new Object();
		for ( var key in params) {
			if (key.toUpperCase() == "INDEXOF") {
				continue;
			}
			pars[key] = params[key];
		}
		varibales.parameter = pars;
	}
	function btnPrevious() {
		pageIndex--;
		/*
		 * var pageid=pageIndex+1; commonObject.page=pageid.toString();
		 */
		if (pageIndex > -1) {
			if (pageIndex == 0) {
				enabled("#previousBtn", 'disable');
			}
			enabled("#nextBtn", 'enable');
			if (zoomInFlag && ie8Flag) {
				dataFilter();
				return;
			}
			$("#panel table tr").children().eq(1).html(reportContent[pageIndex]);
		}
	}
	function getRUrl(reportUrl) {
		// var k = "method=crud&serviceid=" + $.reportConfig.serviceid
		// + "&sessionid=" + CRUD.sessionid + "&" + reportUrl;
		// var portUrl = CRUD.webpath + CRUD.zreport_url + "?" + k;
		var portUrl = getReportWebPath() + "/" + $.reportConfig.serviceurl + "?" + reportUrl;
		return portUrl;
	}
	function btnNext() {
		pageIndex++;
		/*
		 * var pageid=pageIndex+1; commonObject.page=pageid.toString();
		 */

		if (pageIndex <= reportSize - 1) {
			if (pageIndex == reportSize - 1) {
				enabled("#nextBtn", 'disable');
			}
			enabled("#previousBtn", 'enable');
			if (zoomInFlag && ie8Flag) {
				dataFilter();
				return;
			}
			$("#panel table tr").children().eq(1).html(reportContent[pageIndex]);
		}
	}

	function loadFresh(data) {
		return "<table width='100%' cellpadding='0' cellspacing='0' border='0'>" + "<tr><td width='10%'>&nbsp;</td><td align='center'>" + data + "</td><td width='10%'>" + "&nbsp;</td></tr>" + "</table>";
	}

	function getReportWebPath() {
		// 获取当前网址，如： http://localhost:8083/uimcardprj/share/meun.jsp
		var curWwwPath = window.document.location.href;
		// 获取主机地址之后的目录，如： uimcardprj/share/meun.jsp
		var pathName = window.document.location.pathname;
		var pos = curWwwPath.indexOf(pathName);
		// 获取主机地址，如： http://localhost:8083
		var localhostPath = curWwwPath.substring(0, pos);
		// 获取带"/"的项目名，如：/uimcardprj
		var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
		return (localhostPath + projectName);

	}

	function Zoom(zoomNum) {
		var userAgent = getUserAgent();
		if (userAgent == "Firefox") {
			var obj = _doc.getElementById("panel").getElementsByTagName("table")[0];
			var heightVal;
			var widthVal;
			var mozTrans = "scale(" + zoomNum + "," + zoomNum + ")";
			var mozTransTop;
			var mozTransLeft;
			if (!zoomInFlag && zoomNum == 2) {
				heightVal = _doc.getElementById("panel").scrollHeight;
				widthVal = _doc.getElementById("panel").scrollWidth;
				obj.style.MozTransform = mozTrans;
				mozTransTop = (heightVal * 2 - _doc.getElementById("panel").scrollHeight) / 2;
				mozTransLeft = (_doc.getElementById("panel").scrollWidth - widthVal) / 2;
				obj.style.MozTransform = mozTrans + " translate(" + mozTransLeft + "px," + mozTransTop + "px)";
				_doc.getElementById("panel").scrollLeft = _doc.getElementById("panel").scrollWidth / 4;
				zoomInFlag = true;
			} else if (zoomInFlag && zoomNum == 1) {
				obj.style.MozTransform = mozTrans;
				zoomInFlag = false;
			}
			return;
		} else if ((userAgent.indexOf("IE") != -1 || userAgent == "Chrome") && userAgent != "IE8.0") {
			_doc.getElementById("panel").getElementsByTagName("table")[0].style.zoom = zoomNum;
			if (zoomNum == 2) {
				_doc.getElementById("panel").scrollLeft = (_doc.getElementById("panel").scrollWidth - _doc.getElementById("panel").clientWidth) / 2;
			}
			return;
		} else {
			ie8Flag = true;
			if (!zoomInFlag && zoomNum == 2) {
				dataFilter();
				zoomInFlag = true;
				_doc.getElementById("panel").scrollLeft = (_doc.getElementById("panel").scrollWidth - _doc.getElementById("panel").clientWidth) / 2;
			} else if (zoomInFlag && zoomNum == 1) {
				var data = reportContent[pageIndex];
				$("#panel table tr").children().eq(1).html(data);
				zoomInFlag = false;
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

	// for ie8or other
	function dataFilter() {
		var data = reportContent[pageIndex];
		var result = data.replace(/font\-size.*px/gi, "");
		result = result.replace(/1px/gi, "2px");
		$("#panel table tr").children().eq(1).html(result);
		var widthT = _doc.getElementById("panel").getElementsByTagName("table")[1].style.width;
		_doc.getElementById("panel").getElementsByTagName("table")[1].style.width = widthT.substr(0, widthT.length - 2) * 2 + "px";
		_doc.getElementById("panel").getElementsByTagName("table")[1].style.fontSize = "24px";
	}

	function getDocument() {
		var doc;
		if (document.all) {// ie
			doc = document;// window.parent.frames["index_main"].document;
		} else {
			doc = document;// window.parent.document.getElementById("index_main").contentDocument;
		}
		return doc;
	}

	// 窗口大小改变
	$(window).resize(function() {
		var width = $(window).width() - 10;
		var height = $(window).height() - 10;
		$("#dialog-modal").omDialog({
			width : width,
			height : height
		});
		$("#panel").omPanel("resize", {
			width : $("#dialog-modal").width(),
			height : $("#dialog-modal").height()
		});
	});
})(jQuery);