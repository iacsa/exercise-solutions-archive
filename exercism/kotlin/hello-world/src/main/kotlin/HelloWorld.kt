object HelloWorld {
  fun hello(name: String? = ""): String {
    if (name == null || name.isBlank()) {
      return "Hello, World!";
    } else {
      return "Hello, " + name + "!";
    }
  }
}
