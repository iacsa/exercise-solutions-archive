class Year {

  var year: Int;

  public function new(year) {
    this.year = year;
  }

  public function isLeap() {
    return this.year % 400 == 0 ||
      this.year % 100 > 0 &&
      this.year % 4 == 0;
  }
}
