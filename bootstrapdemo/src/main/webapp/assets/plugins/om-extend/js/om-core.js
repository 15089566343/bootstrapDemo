(function( $, undefined ) {
	var	escapeable = /["\\\x00-\x1f\x7f-\x9f]/g,
	meta = {
		'\b': '\\b',
		'\t': '\\t',
		'\n': '\\n',
		'\f': '\\f',
		'\r': '\\r',
		'"' : '\\"',
		'\\': '\\\\'
	};

/**
 * jQuery.toJSON
 * Converts the given argument into a JSON respresentation.
 *
 * @param o {Mixed} The json-serializble *thing* to be converted
 *
 * If an object has a toJSON prototype, that will be used to get the representation.
 * Non-integer/string keys are skipped in the object, as are keys that point to a
 * function.
 *
 */
$.toJSON = typeof JSON === 'object' && JSON.stringify
	? JSON.stringify
	: function( o ) {

	if ( o === null ) {
		return 'null';
	}

	var type = typeof o;

	if ( type === 'undefined' ) {
		return undefined;
	}
	if ( type === 'number' || type === 'boolean' ) {
		return '' + o;
	}
	if ( type === 'string') {
		return $.quoteString( o );
	}
	if ( type === 'object' ) {
		if ( typeof o.toJSON === 'function' ) {
			return $.toJSON( o.toJSON() );
		}
		if ( o.constructor === Date ) {
			 
			var	month = o.getUTCMonth() + 1,
				day = o.getUTCDate(),
				year = o.getUTCFullYear(),
				hours = o.getUTCHours(),
				minutes = o.getUTCMinutes(),
				seconds = o.getUTCSeconds(),
				milli = o.getUTCMilliseconds();
			 

			if ( month < 10 ) {
				month = '0' + month;
			}
			if ( day < 10 ) {
				day = '0' + day;
			}
			if ( hours < 10 ) {
				hours = '0' + hours;
			}
			if ( minutes < 10 ) {
				minutes = '0' + minutes;
			}
			if ( seconds < 10 ) {
				seconds = '0' + seconds;
			}
			if ( milli < 100 ) {
				milli = '0' + milli;
			}
			if ( milli < 10 ) {
				milli = '0' + milli;
			}
			return '"' + year + '-' + month + '-' + day + 'T' +
				hours + ':' + minutes + ':' + seconds +
				'.' + milli + 'Z"';
		}
		if ( o.constructor === Array ) {
			var ret = [];
			for ( var i = 0; i < o.length; i++ ) {
				ret.push( $.toJSON( o[i] ) || 'null' );
			}
			return '[' + ret.join(',') + ']';
		}
		var	name,
			val,
			pairs = [];
		for ( var k in o ) {
			type = typeof k;
			if ( type === 'number' ) {
				name = '"' + k + '"';
			} else if (type === 'string') {
				name = $.quoteString(k);
			} else {
				// Keys must be numerical or string. Skip others
				continue;
			}
			type = typeof o[k];

			if ( type === 'function' || type === 'undefined' ) {
				// Invalid values like these return undefined
				// from toJSON, however those object members
				// shouldn't be included in the JSON string at all.
				continue;
			}
			val = $.toJSON( o[k] );
			pairs.push( name + ':' + val );
		}
		return '{' + pairs.join( ',' ) + '}';
	}
};
$.extend( $.expr[ ":" ], {
    data: $.expr.createPseudo ?
        $.expr.createPseudo(function( dataName ) {
            return function( elem ) {
                return !!$.data( elem, dataName );
            };
        }) :
        // support: jQuery <1.8
        function( elem, i, match ) {
            return !!$.data( elem, match[ 3 ] );
        }
        
        
});
/**
 * jQuery.evalJSON
 * Evaluates a given piece of json source.
 *
 * @param src {String}
 */
$.evalJSON = typeof JSON === 'object' && JSON.parse
	? JSON.parse
	: function( src ) {
	return eval('(' + src + ')');
};

/**
 * jQuery.secureEvalJSON
 * Evals JSON in a way that is *more* secure.
 *
 * @param src {String}
 */
$.secureEvalJSON = typeof JSON === 'object' && JSON.parse
	? JSON.parse
	: function( src ) {

	var filtered = 
		src
		.replace( /\\["\\\/bfnrtu]/g, '@' )
		.replace( /"[^"\\\n\r]*"|true|false|null|-?\d+(?:\.\d*)?(?:[eE][+\-]?\d+)?/g, ']')
		.replace( /(?:^|:|,)(?:\s*\[)+/g, '');

	if ( /^[\],:{}\s]*$/.test( filtered ) ) {
		return eval( '(' + src + ')' );
	} else {
		throw new SyntaxError( 'Error parsing JSON, source is not valid.' );
	}
};

/**
 * jQuery.quoteString
 * Returns a string-repr of a string, escaping quotes intelligently.
 * Mostly a support function for toJSON.
 * Examples:
 * >>> jQuery.quoteString('apple')
 * "apple"
 *
 * >>> jQuery.quoteString('"Where are we going?", she asked.')
 * "\"Where are we going?\", she asked."
 */

$.curCSS= function( elem, name, force ) {
    var ret, style = elem.style;
    doc = elem.ownerDocument;
    defaultView = doc.defaultView;
    // We need to handle opacity special in IE
    if ( name == "opacity" && !jQuery.support.opacity ) {
        ret = jQuery.attr( style, "opacity" );

        return ret == "" ?
            "1" :
            ret;
    }

    // Make sure we're using the right name for getting the float value
    if ( name.match( /float/i ) )
        name = styleFloat;

    if ( !force && style && style[ name ] )
        ret = style[ name ];

    else if ( defaultView.getComputedStyle ) {

        // Only "float" is needed here
        if ( name.match( /float/i ) )
            name = "float";

        name = name.replace( /([A-Z])/g, "-$1" ).toLowerCase();

        var computedStyle = defaultView.getComputedStyle( elem, null );

        if ( computedStyle )
            ret = computedStyle.getPropertyValue( name );

        // We should always get a number back from opacity
        if ( name == "opacity" && ret == "" )
            ret = "1";

    } 
 };
$.quoteString = function( string ) {
	if ( string.match( escapeable ) ) {
		return '"' + string.replace( escapeable, function( a ) {
			var c = meta[a];
			if ( typeof c === 'string' ) {
				return c;
			}
			c = a.charCodeAt();
			return '\\u00' + Math.floor(c / 16).toString(16) + (c % 16).toString(16);
		}) + '"';
	}
	return '"' + string + '"';
};

	// plugins
	$.fn.extend({
		propAttr: $.fn.prop || $.fn.attr,
		_oldFocus: $.fn.focus,//为避免与jQuery ui冲突导致死循环，这里不要取名为'_focus'
		//设置元素焦点（delay：延迟时间）
		focus: function( delay, fn ) {
			return typeof delay === "number" ?
				this.each(function() {
					var elem = this;
					setTimeout(function() {
						$( elem ).focus();
						if ( fn ) {
							fn.call( elem );
						}
					}, delay );
				}) :
				this._oldFocus.apply( this, arguments );
		},
		//获取设置滚动属性的 父元素
		scrollParent: function() {
			var scrollParent;
			if (($.browser.msie && (/(static|relative)/).test(this.css('position'))) || (/absolute/).test(this.css('position'))) {
				scrollParent = this.parents().filter(function() {
					return (/(relative|absolute|fixed)/).test($.curCSS(this,'position',1)) && (/(auto|scroll)/).test($.curCSS(this,'overflow',1)+$.curCSS(this,'overflow-y',1)+$.curCSS(this,'overflow-x',1));
				}).eq(0);
			} else {
				scrollParent = this.parents().filter(function() {
					return (/(auto|scroll)/).test($.curCSS(this,'overflow',1)+$.curCSS(this,'overflow-y',1)+$.curCSS(this,'overflow-x',1));
				}).eq(0);
			}
			return (/fixed/).test(this.css('position')) || !scrollParent.length ? $(document) : scrollParent;
		},
		//设置或获取元素的垂直坐标
		zIndex: function( zIndex ) {
			if ( zIndex !== undefined ) {
				return this.css( "zIndex", zIndex );
			}
			if ( this.length ) {
				var elem = $( this[ 0 ] ), position, value;
				while ( elem.length && elem[ 0 ] !== document ) {
					// Ignore z-index if position is set to a value where z-index is ignored by the browser
					// This makes behavior of this function consistent across browsers
					// WebKit always returns auto if the element is positioned
					position = elem.css( "position" );
					if ( position === "absolute" || position === "relative" || position === "fixed" ) {
						// IE returns 0 when zIndex is not specified
						// other browsers return a string
						// we ignore the case of nested elements with an explicit value of 0
						// <div style="z-index: -10;"><div style="z-index: 0;"></div></div>
						value = parseInt( elem.css( "zIndex" ), 10 );
						if ( !isNaN( value ) && value !== 0 ) {
							return value;
						}
					}
					elem = elem.parent();
				}
			}
			return 0;
		},
		//设置元素不支持被选择
		disableSelection: function() {
			return this.bind( ( $.support.selectstart ? "selectstart" : "mousedown" ) +
				".om-disableSelection", function( event ) {
					event.preventDefault();
				});
		},
		//设置元素支持被选择
		enableSelection: function() {
			return this.unbind( ".om-disableSelection" );
		}
	});
$.omWidget = function( name, base, prototype ) {
	var namespace = name.split( "." )[ 0 ],
		fullName;
	name = name.split( "." )[ 1 ];
	fullName = namespace + "-" + name;
	// 例如参数name='om.tabs'，变成namespace='om',name='tabs',fullName='om-tabs' 
	// base默认为Widget类，组件默认会继承base类的所有方法  
	if ( !prototype ) {
		prototype = base;
		base = $.OMWidget;
	}
	// create selector for plugin
	$.expr[ ":" ][ fullName ] = function( elem ) {
		return !!$.data( elem, name );
	};
	// 创建命名空间$.om.tabs  
	$[ namespace ] = $[ namespace ] || {};
	// 组件的构造函数
	$[ namespace ][ name ] = function( options, element ) {
		// allow instantiation without initializing for simple inheritance
		if ( arguments.length ) {
			this._createWidget( options, element );
		}
	};
	// 初始化父类，一般调用了$.Widget  
	var basePrototype = new base();
	// we need to make the options hash a property directly on the new instance
	// otherwise we'll modify the options hash on the prototype that we're
	// inheriting from
//		$.each( basePrototype, function( key, val ) {
//			if ( $.isPlainObject(val) ) {
//				basePrototype[ key ] = $.extend( {}, val );
//			}
//		});
	basePrototype.options = $.extend( true, {}, basePrototype.options );
	// 给om.tabs继承父类的所有原型方法和参数  
	$[ namespace ][ name ].prototype = $.extend( true, basePrototype, {
		namespace: namespace,
		widgetName: name,
		// 组件的事件名前缀，调用_trigger的时候会默认给trigger的事件加上前缀  
        // 例如_trigger('create')实际会触发'tabscreate'事件  
		widgetEventPrefix: $[ namespace ][ name ].prototype.widgetEventPrefix || name,
		widgetBaseClass: fullName
	}, prototype );
	// 把tabs方法挂到jquery对象上，也就是$('#tab1').tabs();  
	$.omWidget.bridge( name, $[ namespace ][ name ] );
};

$.omWidget.bridge = function( name, object ) {
	$.fn[ name ] = function( options ) {
		// 如果tabs方法第一个参数是string类型，则认为是调用组件的方法，否则调用options方法  
		var isMethodCall = typeof options === "string",
			args = Array.prototype.slice.call( arguments, 1 ),
			returnValue = this;
		// allow multiple hashes to be passed on init
		options = !isMethodCall && args.length ?
			$.extend.apply( null, [ true, options ].concat(args) ) :
			options;
		// '_'开头的方法被认为是内部方法，不会被执行，如$('#tab1').tabs('_init')  
		if ( isMethodCall && options.charAt( 0 ) === "_" ) {
			return returnValue;
		}
		if ( isMethodCall ) {
			this.each(function() {
				// 执行组件方法  
				var instance = $.data( this, name );
				if (options == 'options') {
				    returnValue = instance && instance.options;
				    return false;
                } else {
    				var	methodValue = instance && $.isFunction( instance[options] ) ?
    						instance[ options ].apply( instance, args ) : instance;
    				if ( methodValue !== instance && methodValue !== undefined ) {
    					returnValue = methodValue;
    					return false;
    				}
                }
			});
		} else {
			// 调用组件的options方法  
			this.each(function() {
				var instance = $.data( this, name );
				if ( instance ) {
					// 设置options后再次调用_init方法，第一次调用是在_createWidget方法里面。这个方法需要开发者去实现。  
                    // 主要是当改变组件中某些参数后可能需要对组件进行重画  
                    instance._setOptions( options || {} );
				    $.extend(instance.options, options);
				    $(instance.beforeInitListeners).each(function(){
				        this.call(instance);
				    });
					instance._init();
					$(instance.initListeners).each(function(){
				        this.call(instance);
				    });
				} else {
					// 没有实例的话，在这里调用组件类的构造函数，并把构造后的示例保存在dom的data里面。注意这里的this是dom，object是模块类 
					$.data( this, name, new object( options, this ) );
				}
			});
		}

		return returnValue;
	};
};

$.omWidget.addCreateListener = function(name,fn){
    var temp=name.split( "." );
    $[ temp[0] ][ temp[1] ].prototype.createListeners.push(fn);
};
$.omWidget.addInitListener = function(name,fn){
    var temp=name.split( "." );
    $[ temp[0] ][ temp[1] ].prototype.initListeners.push(fn);
};
$.omWidget.addBeforeInitListener = function(name,fn){
    var temp=name.split( "." );
    $[ temp[0] ][ temp[1] ].prototype.beforeInitListeners.push(fn);
};
$.OMWidget = function( options, element ) {
    this.createListeners=[];
    this.initListeners=[];
    this.beforeInitListeners=[];
	// allow instantiation without initializing for simple inheritance
	if ( arguments.length ) {
		this._createWidget( options, element );
	}
};
$.OMWidget.prototype = {
	widgetName: "widget",
	widgetEventPrefix: "",
	options: {
		disabled: false
	},
	_createWidget: function( options, element ) {
		// $.widget.bridge stores the plugin instance, but we do it anyway
		// so that it's stored even before the _create function runs
		$.data( element, this.widgetName, this );
		this.element = $( element );
		this.options = $.extend( true, {},
			this.options,
			this._getCreateOptions(),
			options );
		var self = this;
		//注意，不要少了前边的 "om-"，不然会与jquery-ui冲突
		this.element.bind( "om-remove._" + this.widgetName, function() {
			self.destroy();
		});
		// 开发者实现  
		this._create();
		$(this.createListeners).each(function(){
	        this.call(self);
	    });
		// 如果绑定了初始化的回调函数，会在这里触发。注意绑定的事件名是需要加上前缀的，如$('#tab1').bind('tabscreate',function(){});  
		this._trigger( "create" );
		// 开发者实现 
		$(this.beforeInitListeners).each(function(){
	        this.call(self);
	    });
		this._init();
		$(this.initListeners).each(function(){
	        this.call(self);
	    });
	},
	_getCreateOptions: function() {
		return $.metadata && $.metadata.get( this.element[0] )[ this.widgetName ];
	},
	_create: function() {},
	_init: function() {},
	destroy: function() {
		this.element
			.unbind( "." + this.widgetName )
			.removeData( this.widgetName );
		this.widget()
			.unbind( "." + this.widgetName );
	},
	widget: function() {
		return this.element;
	},
	option: function( key, value ) {
        var options = key;
        if ( arguments.length === 0 ) {
            // don't return a reference to the internal hash
            return $.extend( {}, this.options );
        }
        if  (typeof key === "string" ) {
            if ( value === undefined ) {
                return this.options[ key ]; // 获取值
            }
            options = {};
            options[ key ] = value;
        }
        this._setOptions( options ); // 设置值
        return this;
    },
	_setOptions: function( options ) {
		var self = this;
		$.each( options, function( key, value ) {
			self._setOption( key, value );
		});
		return this;
	},
	_setOption: function( key, value ) {
		this.options[ key ] = value;
		return this;
	},
	
	// $.widget中优化过的trigger方法。type是回调事件的名称，如"onRowClick"，event是触发回调的事件（通常没有这个事件的时候传null）
	// 这个方法只声明了两个参数，如有其他参数可以直接写在event参数后面
	_trigger: function( type, event ) {
		// 获取初始化配置config中的回调方法
		var callback = this.options[ type ];
		// 封装js标准event对象为jquery的Event对象
		event = $.Event( event );
		event.type = type;
		// copy original event properties over to the new event
		// this would happen if we could call $.event.fix instead of $.Event
		// but we don't have a way to force an event to be fixed multiple times
		if ( event.originalEvent ) {
			for ( var i = $.event.props.length, prop; i; ) {
				prop = $.event.props[ --i ];
				event[ prop ] = event.originalEvent[ prop ];
			}
		}
		// 构造传给回调函数的参数，event放置在最后
		var newArgs = [],
			argLength = arguments.length;
		for(var i = 2; i < argLength; i++){
			newArgs[i-2] = arguments[i];
		}
		if( argLength > 1){
			newArgs[argLength-2] = arguments[1];
		}
		return !( $.isFunction(callback) &&
			callback.apply( this.element, newArgs ) === false ||
			event.isDefaultPrevented() );
	}
};
})( jQuery );