var Bob = function() { };
Bob.prototype = {
	hey: function(query) {
		if(this.isSilence(query)) return "Fine. Be that way!"; else if(this.isYelling(query)) return "Whoa, chill out!"; else if(this.isQuestion(query)) return "Sure."; else return "Whatever.";
	}
	,isSilence: function(query) {
		return new EReg("^\\s*$","").match(query);
	}
	,isYelling: function(query) {
		return query.toUpperCase() == query && query.toLowerCase() != query;
	}
	,isQuestion: function(query) {
		return StringTools.endsWith(query,"?");
	}
};
var EReg = function(r,opt) {
	opt = opt.split("u").join("");
	this.r = new RegExp(r,opt);
};
EReg.prototype = {
	match: function(s) {
		if(this.r.global) this.r.lastIndex = 0;
		this.r.m = this.r.exec(s);
		this.r.s = s;
		return this.r.m != null;
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
var StringTools = function() { };
StringTools.endsWith = function(s,end) {
	var elen = end.length;
	var slen = s.length;
	return slen >= elen && HxOverrides.substr(s,slen - elen,elen) == end;
};
module.exports = Bob;
