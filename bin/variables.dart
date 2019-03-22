void main() {
  var a = 1;
  print(a);

  int b = 2;
  print(b);

  final c = "Hello";
  // reassigning will throw an error
  // c = "Hello World";
  print(c);

  const d = "World";
  // A Compile time constant
  // Will throw error is assingned to a non-constant value
  // const e = new Date(2019);
  // Accepeted values - Number, String, Boolean, Array. Map, Symbol, const T
  print(d);
}
