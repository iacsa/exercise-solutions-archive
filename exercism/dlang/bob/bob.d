module bob;

import std.string : strip, endsWith, empty;
import std.ascii : isUpper, isLower;
import std.algorithm.searching : any;


string hey(string query) {
  auto cleaned = query.strip;
  if (cleaned.empty) {
    return "Fine. Be that way!";
  } else if (!cleaned.any!(a => a.isLower) && cleaned.any!(a => a.isUpper)) {
    return "Whoa, chill out!";
  } else if (cleaned.endsWith('?')) {
    return "Sure.";
  } else {
    return "Whatever.";
  }
}


unittest {
  const int allTestsEnabled = 1;

  assert(hey("Tom-ay-to, tom-aaaah-to.") == "Whatever.");
  static if (allTestsEnabled) {
    assert(hey("WATCH OUT!") == "Whoa, chill out!");
    assert(hey("Does this cryogenic chamber make me look fat?") == "Sure.");
    assert(hey("Let's go make out behind the gym!") == "Whatever.");
    assert(hey("It's OK if you don't want to go to the DMV.") == "Whatever.");
    assert(hey("WHAT THE HELL WERE YOU THINKING?") == "Whoa, chill out!");
    assert(hey("1, 2, 3 GO!") == "Whoa, chill out!");
    assert(hey("1, 2, 3") == "Whatever.");
    assert(hey("4?") == "Sure.");
    assert(hey("ZOMG THE %^*@#$(*^ ZOMBIES ARE COMING!!11!!1!") == "Whoa, chill out!");
    assert(hey("I HATE YOU") == "Whoa, chill out!");
    assert(hey("Ending with a ? means a question.") == "Whatever.");
    assert(hey("Wait! Hang on.  Are you going to be OK?") == "Sure.");
    assert(hey("Are you ok? ") == "Sure.");
    assert(hey("") == "Fine. Be that way!");
    assert(hey("   ") == "Fine. Be that way!");
    assert(hey(" A bit of silence can be nice.  ") == "Whatever.");
  }
}

void main () {
}
