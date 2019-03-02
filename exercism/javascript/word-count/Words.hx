class Words {
  public function count(text) {
    var word_counts: Dynamic = {};
    var words = (~/\s+/g).split(text);
    for (word in words) {
      if (word != "") {
        if (Reflect.hasField(word_counts, word))
          Reflect.setField(word_counts, word,
              Reflect.field(word_counts, word) + 1);
        else
          Reflect.setField(word_counts, word, 1);
      }
    }
    return word_counts;
  }
}
