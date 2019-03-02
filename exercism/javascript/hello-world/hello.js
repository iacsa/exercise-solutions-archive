(function (console, $hx_exports) { "use strict";
var HelloWorld = $hx_exports.HelloWorld = function() { };
HelloWorld.prototype = {
	hello: function(name) {
		return "Hello " + name;
	}
};
})(typeof console != "undefined" ? console : {log:function(){}}, typeof window != "undefined" ? window : exports);
