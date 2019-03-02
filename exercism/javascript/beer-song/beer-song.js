var BeerSong = function() { };
BeerSong.prototype = {
	verse: function(n) {
		var start = "" + this.capitalize(this.bottles(n)) + " on the wall, " + this.bottles(n) + ".\n";
		var middle;
		if(n == 0) middle = "Go to the store and buy some more, "; else middle = "Take " + (n == 1?"it":"one") + " down and pass it around, ";
		var end = "" + this.bottles((n + 99) % 100) + " on the wall.\n";
		return start + middle + end;
	}
	,sing: function(high,low) {
		if(low == null) low = 0;
		var result = [];
		var _g1 = low;
		var _g = high + 1;
		while(_g1 < _g) {
			var n = _g1++;
			result.unshift(this.verse(n));
		}
		return result.join("\n");
	}
	,bottles: function(n) {
		switch(n) {
		case 0:
			return "no more bottles of beer";
		case 1:
			return "1 bottle of beer";
		default:
			return "" + n + " bottles of beer";
		}
	}
	,capitalize: function(str) {
		var first = HxOverrides.substr(str,0,1);
		var rest = HxOverrides.substr(str,1,null);
		return first.toUpperCase() + rest;
	}
};
var HxOverrides = function() { };
HxOverrides.substr = function(s,pos,len) {
	if(pos != null && pos != 0 && len != null && len < 0) return "";
	if(len == null) len = s.length;
	if(pos < 0) {
		pos = s.length + pos;
		if(pos < 0) pos = 0;
	} else if(len < 0) len = s.length + len - pos;
	return s.substr(pos,len);
};
module.exports = BeerSong;
