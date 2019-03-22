import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:mirrors';
import 'dart:convert';

void main() {
  // Basic Future that returns a result at some point
  var result = Future(() => 'Hello World');
  result.then((res) => print(res));

  // Future that adds a delayed time before returning the result
  var delayedResult =
      Future.delayed(Duration(seconds: 2), () => 'Delayed Hello World');
  delayedResult.then((str) => print(str));

  // Handling Exceptions in Futures
  Future(() => throw "There was an error")
      .then((str) => print(str)) // Success callback
      .catchError((err) => print(err)); // Error Callback

  var showError = false;
  Future(() => showError ? throw 'There was an error' : '{"data" : "Success"}')
      .then((str) => json.decode(str))
      .then((dataMap) => print(dataMap))
      .catchError((err) => print(err));

  // HTTP based Futures
  Dio()
      .get('https://swapi.co/api/people/1',
          options: Options(responseType: ResponseType.json))
      // .then((str) => str.data)
      .then((str) => print(reflect(str).type.reflectedType.toString()))
      .catchError((err) => print('There was a problem - $err'));

  lookupVersion(cb) => Timer(Duration(seconds: 2), () => cb('v2.1.0'));

  lookupVersion((version) => print('Got the version: $version'));

  Future lookupVersionAsFuture() {
    var completer = Completer();

    lookupVersion((version) => completer.complete(version));
    // lookupVersion((_) => completer.completeError("There was a problem!"));
    return completer.future;
  }

  lookupVersionAsFuture()
      .then((version) => print('Got the Future version: $version'))
      .catchError((err) => print('Got Error: $err'));

  Future lookupVersionWithAsycAwait() async {
    try {
      var version = await lookupVersionAsFuture();
      print("Got the async/await version: $version");
    } catch (e) {
      print('Got Async Await Error: $e');
    }
  }

  lookupVersionWithAsycAwait();
}
