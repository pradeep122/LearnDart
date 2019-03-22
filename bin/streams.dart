import 'dart:async';
import 'package:dio/dio.dart';

void main() {
  // Single subscription stream

  StreamController<String> controller = StreamController();

  controller.stream.listen(
      (data) => print('Recieved data: ${data.toUpperCase()}'),
      onDone: () => print('No more data on the stream'),
      onError: (err) => print('Got an Error: $err'));

  controller.add("Hello");
  controller.add("World");

  controller.addError("This is an error");
  controller.close().then((_) => print('Stream is now closed'));

  StreamController<String> broadcastController = StreamController();

  Stream<String> broadcastStream =
      broadcastController.stream.asBroadcastStream();

  broadcastStream.listen(
      (data) => print('Recieved data: ${data.toLowerCase()}'),
      onDone: () => print('No data on the broacast stream'),
      onError: (err) => print('Got an Error: $err'));

  broadcastStream.listen(
      (data) => print('Recieved data again: ${data.toLowerCase()}'),
      onDone: () => print('No more data on the broadcast stream'),
      onError: (err) => print('Got an Error again: $err'));

  broadcastController.add("Hello");
  broadcastController.add("World");

  broadcastController.addError("This is broadcast  an error");
  broadcastController
      .close()
      .then((_) => print('Broadcast Stream is now closed'));

  Future<String> people1 = Dio()
      .get("https://swapi.co/api/people/1",
          options: Options(responseType: ResponseType.json))
      .then((people1) => people1.data.toString());

  Stream<String> resultStream = Stream.fromFuture(people1);

  resultStream.listen((data) => print('Got Data: $data'),
      onDone: () => print('No more data on stream'),
      onError: (err) => print('Got Error: $err'));

  Future<String> people2 = Dio()
      .get("https://swapi.co/api/people/2",
          options: Options(responseType: ResponseType.json))
      .then((people2) => people2.data.toString());

  Stream<String> combinedStream = Stream.fromFutures([people1, people2]);

  combinedStream.listen((data) => print('Got People: $data'),
      onDone: () => print('No more people on stream'),
      onError: (err) => print('Got Error: $err'));

  List<String> chars = 'Dart is awesome'.split('');
  Stream<String> charStream = Stream.fromIterable(chars);

  charStream.listen((str) => print(str));
}
