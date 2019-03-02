var Gigasecond = function(date) {
	this.start_date = date;
};
Gigasecond.prototype = {
	date: function() {
		var t = this.start_date.getTime() + 1000000000000;
		var d = new Date();
		d.setTime(t);
		return d;
	}
};
module.exports = Gigasecond;
