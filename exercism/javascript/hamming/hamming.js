var Hamming = function() { };

Hamming.prototype = {
	compute: function(s1,s2) {
		if(s1.length != s2.length) throw new Error("DNA strands must be of equal length.");
		var diffCount = 0;
		var _g1 = 0;
		var _g = s1.length;
		while(_g1 < _g) {
			var i = _g1++;
			if(s1.charAt(i) != s2.charAt(i)) diffCount++;
		}
		return diffCount;
	}
};

module.exports = Hamming;
