void main() {
  Person pradeep =
      Person('Pradeep Dantuluri', 33, occupation: 'Software Engineer');
  pradeep.speak();
  print(pradeep.name);

  pradeep.name = 'Pradeep Varma Dantuluri';
  pradeep.speak();

  // Method cascading
  Person pradeepv = Person('Pradeep  Dantuluri', 33, occupation: 'Engineer')
    ..speak()
    ..name = 'Pradeep V Dantuluri'
    ..speak();

  print(pradeepv.name);

  Person swetha =
      Person.fromJson({'name': 'Swetha', 'age': 26}, 'Sofware Developer');
  swetha.speak();

  // Operator Overriding
  print(pradeep == Person('Pradeep Varma Dantuluri', 33));

  // Inheritance
  var vinay = Employee('Vinay', 32, DateTime.now());
  vinay.speak();
}

// Class Inheritance
class Employee extends Person {
  final DateTime joinDate;

  Employee(String name, int age, this.joinDate) : super(name, age);

  @override
  speak() {
    print("My name is $name. I joined on $joinDate");
  }
}

class Person {
  String _name;
  int age;
  String occupation;

  // Person(String name, int age){
  //   this.name = name;
  //   this.age = age;
  // }

  Person(this._name, this.age, {this.occupation});

  // Named Constructors
  Person.fromJson(Map json, [this.occupation]) {
    _name = json['name'];
    age = json['age'];
  }

  // Override Operators
  bool operator ==(dynamic b) => _name == b.name && age == b.age;

  String get name => _name;
  void set name(String updatedName) => _name = updatedName;

  speak() {
    print("My name is $_name. I am $age years old. I am a $occupation");
  }

  void _hiddenMethod() {
    print('This method is hidden');
  }
}
