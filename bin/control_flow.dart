void main() {
  // if/else statements
  var yearOfBirth = 1985;

  if (yearOfBirth < 1990) {
    print('Born before the 90s');
  } else if (yearOfBirth == 1990) {
    print('Born in 1990');
  } else {
    print('Born during or after the 90s');
  }

  var str = yearOfBirth < 1990 ? 'before the 90s' : ' during or after 90s';
  print(str);

  // for loop
  var message = StringBuffer('Dart is fun');

  for (var j = 0; j < 3; j++) {
    message.write('!');
  }

  print(message);

  var callbacks = [];
  for (var k = 0; k < 3; k++) {
    callbacks.add(() => print(k));
  }

  // callbacks.forEach((cb) => cb());

  for (var cb in callbacks) {
    cb();
  }

  // while and do-while loops

  var k = 0;
  while (k < 10) {
    print(k);
    k++;
  }

  do {
    print(k);
    k++;
  } while (k < 10);

  // break/continue statement

  var i = 0;
  do {
    if (i == 5) break;
    print(i);
    i++;
  } while (i < 10);

  for (var n = 1; n < 10; n++) {
    if (n % 2 == 0) continue; // skip even numbers
    print(n);
  }

  // switch and case
  const appStatus = 'CLOSE';

  switch (appStatus) {
    case 'OPEN':
      print('Your application is open');
      break;
    case 'PENDING':
      print('Your application is pending');
      break;
    case 'CLOSE':
    default:
      print('Your application is closed');
  }
  // assert
  assert(''.isNotEmpty);
  assert(''.isNotEmpty, 'The String is empty');
  assert(false, 'Value is false');
  print("Hello World");
}
