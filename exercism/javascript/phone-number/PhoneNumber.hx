class PhoneNumber {
  private static var invalid = "0000000000";
  var num: String;
  public function new(num: String) {
    var reg = new EReg("[^\\d]", "g");
    var cleaned = reg.map(num, function(_) { return ""; });
    this.num = if (cleaned.length == 10)
      cleaned;
    else if (cleaned.length == 11 && StringTools.startsWith(cleaned, "1"))
      cleaned.substr(1);
    else
      invalid;
  }
  public function areaCode() {
    return num.substr(0, 3);
  }
  public function number() {
    return num;
  }
  public function toString() {
    return '(${num.substr(0, 3)}) ${num.substr(3, 3)}-${num.substr(6)}';
  }
}
