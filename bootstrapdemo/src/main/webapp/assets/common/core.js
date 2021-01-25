var console=console||{log:function(){return;}}//ie下没有控制台日志功能，防止因调试代码报错而中断js代码
/**
 * 每个页面常用的不好归类的一些封装
 */
var Core = {
		/**
		 * 获取web跟路径
		 */
		getBasePath : function(){
			return  $("base").attr("href") || "";
		},
		/**
		 * 页面跳转
		 * @param url
		 */
		locationTo : function(url){
			var basepath = this.getBasePath();//解决低版本IE（IE8以下）的js不识别base标签的问题
			window.location = basepath + url;
		}
		
};
