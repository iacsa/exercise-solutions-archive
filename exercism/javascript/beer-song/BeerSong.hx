class BeerSong {
  public function verse(n) {
    var start = '${capitalize(bottles(n))} on the wall, ${bottles(n)}.\n';
    var middle = if (n == 0) {
      "Go to the store and buy some more, ";
    } else {
      'Take ${n == 1 ? "it" : "one"} down and pass it around, ';
    }
    var end = '${bottles((n + 99) % 100)} on the wall.\n';
    return start + middle + end;
  }
  public function sing(high, low = 0) {
    var result = [];
    for (n in low ... high + 1) {
      result.unshift(verse(n));
    }
    return result.join("\n");
  }
  private function bottles(n) {
    return switch (n) {
      case 0: "no more bottles of beer";
      case 1: "1 bottle of beer";
      default: '$n bottles of beer';
    }
  }
  private function capitalize(str: String) {
    var first = str.substr(0, 1);
    var rest = str.substr(1);
    return first.toUpperCase() + rest;
  }
}
