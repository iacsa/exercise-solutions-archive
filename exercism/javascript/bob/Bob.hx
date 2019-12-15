class Bob {
  public function hey(query) {
    if (isSilence(query))
      return "Fine. Be that way!";
    else if (isYelling(query))
      return "Whoa, chill out!";
    else if (isQuestion(query))
      return "Sure.";
    else
      return "Whatever.";
  }
  private function isSilence(query) {
    return (~/^\s*$/).match(query);
  }
  private function isYelling(query: String) {
    return query.toUpperCase() == query &&
      query.toLowerCase() != query;
  }
  private function isQuestion(query) {
    return StringTools.endsWith(query, "?");
  }
}
