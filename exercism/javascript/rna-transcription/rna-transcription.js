var DnaTranscriber = function() { };

DnaTranscriber.prototype = {
	toRna: function(dna) {
		var rna = "";
		var _g1 = 0;
		var _g = dna.length;
		while(_g1 < _g) {
			var i = _g1++;
			var _g2 = dna.charAt(i);
			switch(_g2) {
			case "C":
				rna += "G";
				break;
			case "G":
				rna += "C";
				break;
			case "A":
				rna += "U";
				break;
			case "T":
				rna += "A";
				break;
			default:
				throw new Error("Invalid dna string.");
			}
		}
		return rna;
	}
};

module.exports = DnaTranscriber;
