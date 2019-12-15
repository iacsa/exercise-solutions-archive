class Gigasecond {
  var start_date: Date;
  public function new(date) {
    start_date = date;
  }
  public function date() {
    // The time delta is in milliseconds, so we need 10^12
    return Date.fromTime(start_date.getTime() + 1000000000000);
  }
}
