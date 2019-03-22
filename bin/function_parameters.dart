void main() {
  yell('Hello World');
  yell('Hello World', true);
  yell('Hello World', true, '🙋');
  whisper('Hello World', mysteriously: true);
  whisper('Hello World', emoji: '🤐', mysteriously: true);

  Person('Pradeep').speak(emoji: ' 🐲');
}

yell(String message, [bool exclaim = false, String emoji = '']) {
  var result = message.toUpperCase();
  if (exclaim) result += '!!!';
  if (emoji.isNotEmpty) result += emoji;
  print(result);
}

whisper(String message, {bool mysteriously, String emoji = ''}) {
  var result = message.toLowerCase();
  if (mysteriously) result += '...';
  if (emoji.isNotEmpty) result += emoji;
  print(result);
}

class Person {
  var name;

  Person(this.name);

  speak({String emoji = ''}) {
    var result = 'My Name is $name';
    if (emoji.isNotEmpty) result += emoji;
    print(result);
  }
}
