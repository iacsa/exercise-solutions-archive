var HxOverrides = function() { };
HxOverrides.cca = function(s,index) {
	var x = s.charCodeAt(index);
	if(x != x) return undefined;
	return x;
};
HxOverrides.iter = function(a) {
	return { cur : 0, arr : a, hasNext : function() {
		return this.cur < this.arr.length;
	}, next : function() {
		return this.arr[this.cur++];
	}};
};
var Lambda = function() { };
Lambda.fold = function(it,f,first) {
	var $it0 = $iterator(it)();
	while( $it0.hasNext() ) {
		var x = $it0.next();
		first = f(x,first);
	}
	return first;
};
var Pangram = function(word) {
	this.word = word.toLowerCase();
};
Pangram.prototype = {
	isPangram: function() {
		var char_present = [];
		var _g = 0;
		while(_g < 26) {
			var i = _g++;
			char_present.push(false);
		}
		var _g1 = 0;
		var _g2 = this.word.length;
		while(_g1 < _g2) {
			var i1 = _g1++;
			var code = HxOverrides.cca(this.word,i1);
			if(code != null && code >= 97 && code <= 122) char_present[code - 97] = true;
		}
		return Lambda.fold(char_present,function(a,b) {
			return a && b;
		},true);
	}
};
function $iterator(o) { if( o instanceof Array ) return function() { return HxOverrides.iter(o); }; return typeof(o.iterator) == 'function' ? $bind(o,o.iterator) : o.iterator; }
var $_, $fid = 0;
function $bind(o,m) { if( m == null ) return null; if( m.__id__ == null ) m.__id__ = $fid++; var f; if( o.hx__closures__ == null ) o.hx__closures__ = {}; else f = o.hx__closures__[m.__id__]; if( f == null ) { f = function(){ return f.method.apply(f.scope, arguments); }; f.scope = o; f.method = m; o.hx__closures__[m.__id__] = f; } return f; }
module.exports = Pangram;
