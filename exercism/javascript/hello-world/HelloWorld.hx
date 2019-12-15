class HelloWorld {
  public function hello(name: String) {
    if (name.length == 0)
      name = "World";
    return 'Hello, $name!';
  }
}
