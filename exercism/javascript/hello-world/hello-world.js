var HelloWorld = function() { };

HelloWorld.prototype = {
	hello: function(name) {
		if(name.length == 0) name = "World";
		return "Hello, " + name + "!";
	}
};

module.exports = HelloWorld;
