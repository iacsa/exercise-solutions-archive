class Pangram {

  var word: String;

  public function new(word) {
    this.word = word.toLowerCase();
  }

  public function isPangram() {

    var char_present = new Array<Bool>();

    for (i in 0 ... 26)
      char_present.push(false);
    
    for (i in 0 ... word.length) {
      var code = word.charCodeAt(i);
      if (code != null && code >= 97 && code <= 122)
        char_present[code - 97] = true;
    }

    return Lambda.fold(char_present, function(a, b) { return a && b; }, true);
  }
}
