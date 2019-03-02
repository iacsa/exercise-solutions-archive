var EReg = function(r,opt) {
	opt = opt.split("u").join("");
	this.r = new RegExp(r,opt);
};
EReg.prototype = {
	split: function(s) {
		var d = "#__delim__#";
		return s.replace(this.r,d).split(d);
	}
};
var Reflect = function() { };
Reflect.field = function(o,field) {
	try {
		return o[field];
	} catch( e ) {
		return null;
	}
};
Reflect.setField = function(o,field,value) {
	o[field] = value;
};
var Words = function() { };
Words.prototype = {
	count: function(text) {
		var word_counts = { };
		var words = new EReg("\\s+","g").split(text);
		var _g = 0;
		while(_g < words.length) {
			var word = words[_g];
			++_g;
			if(word != "") {
				if(Object.prototype.hasOwnProperty.call(word_counts,word)) Reflect.setField(word_counts,word,Reflect.field(word_counts,word) + 1); else word_counts[word] = 1;
			}
		}
		return word_counts;
	}
};
module.exports = Words;
